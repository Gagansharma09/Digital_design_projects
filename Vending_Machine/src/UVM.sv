// ============================================================================
// Generic UVM Template Package
// ----------------------------------------------------------------------------
// Reusable UVM skeleton for any DUT (FIFO, UART, AXI-Lite, etc.).
//
// Components included:
//   1. my_sequence_item  -> Transaction object
//   2. my_sequence       -> Generates randomized transactions
//   3. my_driver         -> Drives DUT pins through virtual interface
//   4. my_monitor        -> Samples DUT activity and publishes transactions
//   5. my_scoreboard     -> Checks expected vs actual behavior
//   6. my_agent          -> Groups sequencer, driver, monitor
//   7. my_env            -> Top-level verification environment
//   8. my_test           -> Configures env and launches sequences
//
// Replace "my_" with protocol-specific names (e.g. fifo_, uart_, axi_).
// ============================================================================

package my_uvm_pkg;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // ==========================================================================
  // 1. TRANSACTION (Sequence Item)
  // --------------------------------------------------------------------------
  // Represents one abstract operation sent to the DUT.
  // Add protocol-specific fields here.
  // ==========================================================================
  class my_sequence_item extends uvm_sequence_item;

    // Example fields (customize for your DUT)
    rand bit [31:0] data;
    rand bit        write;
    rand bit        read;

    // Example constraints
    constraint legal_c {
      !(write && read); // avoid illegal simultaneous write+read
    }

    `uvm_object_utils_begin(my_sequence_item)
      `uvm_field_int(data,  UVM_ALL_ON)
      `uvm_field_int(write, UVM_ALL_ON)
      `uvm_field_int(read,  UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "my_sequence_item");
      super.new(name);
    endfunction

    function string convert2string();
      return $sformatf("data=0x%08h write=%0b read=%0b",
                       data, write, read);
    endfunction

  endclass : my_sequence_item


  // ==========================================================================
  // 2. SEQUENCE
  // --------------------------------------------------------------------------
  // Generates randomized transactions and sends them to the driver.
  // ==========================================================================
  class my_sequence extends uvm_sequence #(my_sequence_item);

    `uvm_object_utils(my_sequence)

    function new(string name = "my_sequence");
      super.new(name);
    endfunction

    virtual task body();
      my_sequence_item tr;

      repeat (20) begin
        tr = my_sequence_item::type_id::create("tr");

        start_item(tr);
        assert(tr.randomize())
          else `uvm_fatal("RANDFAIL", "Transaction randomization failed")
        finish_item(tr);

        `uvm_info("SEQ", tr.convert2string(), UVM_MEDIUM)
      end
    endtask

  endclass : my_sequence


  // ==========================================================================
  // 3. DRIVER
  // --------------------------------------------------------------------------
  // Receives transactions from sequencer and drives DUT signals.
  // Requires a virtual interface to the DUT.
  // ==========================================================================
  class my_driver extends uvm_driver #(my_sequence_item);

    `uvm_component_utils(my_driver)

    // Replace 'my_if' with your interface type
    virtual my_if vif;

    function new(string name = "my_driver", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      if (!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
        `uvm_fatal("NOVIF", "Virtual interface not found")
    endfunction

    virtual task run_phase(uvm_phase phase);
      my_sequence_item tr;

      forever begin
        seq_item_port.get_next_item(tr);

        // ---------------------------------------------------------------
        // Drive transaction onto DUT
        // Replace with protocol-specific logic
        // ---------------------------------------------------------------
        @(posedge vif.clk);
        vif.data  <= tr.data;
        vif.write <= tr.write;
        vif.read  <= tr.read;

        // Wait one cycle (customize as needed)
        @(posedge vif.clk);

        seq_item_port.item_done();

        `uvm_info("DRV", tr.convert2string(), UVM_MEDIUM)
      end
    endtask

  endclass : my_driver


  // ==========================================================================
  // 4. MONITOR
  // --------------------------------------------------------------------------
  // Observes DUT activity and broadcasts transactions to subscribers.
  // ==========================================================================
  class my_monitor extends uvm_component;

    `uvm_component_utils(my_monitor)

    virtual my_if vif;

    // Analysis port sends observed transactions to scoreboard/coverage
    uvm_analysis_port #(my_sequence_item) ap;

    function new(string name = "my_monitor", uvm_component parent = null);
      super.new(name, parent);
      ap = new("ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      if (!uvm_config_db#(virtual my_if)::get(this, "", "vif", vif))
        `uvm_fatal("NOVIF", "Virtual interface not found")
    endfunction

    virtual task run_phase(uvm_phase phase);
      my_sequence_item tr;

      forever begin
        @(posedge vif.clk);

        // Sample DUT signals and create transaction
        tr = my_sequence_item::type_id::create("tr");
        tr.data  = vif.data;
        tr.write = vif.write;
        tr.read  = vif.read;

        // Publish transaction
        ap.write(tr);

        `uvm_info("MON", tr.convert2string(), UVM_HIGH)
      end
    endtask

  endclass : my_monitor


  // ==========================================================================
  // 5. SCOREBOARD
  // --------------------------------------------------------------------------
  // Receives transactions and checks DUT correctness.
  // ==========================================================================
  class my_scoreboard extends uvm_component;

    `uvm_component_utils(my_scoreboard)

    // Analysis implementation port receives transactions from monitor
    uvm_analysis_imp #(my_sequence_item, my_scoreboard) analysis_export;

    function new(string name = "my_scoreboard",
                 uvm_component parent = null);
      super.new(name, parent);
      analysis_export = new("analysis_export", this);
    endfunction

    // Called automatically whenever monitor writes a transaction
    virtual function void write(my_sequence_item tr);

      // ---------------------------------------------------------------
      // Insert reference model and checking logic here
      // ---------------------------------------------------------------
      `uvm_info("SCB",
                $sformatf("Checking: %s", tr.convert2string()),
                UVM_MEDIUM)

      // Example:
      // if (actual != expected)
      //   `uvm_error("SCB", "Mismatch detected")

    endfunction

  endclass : my_scoreboard


  // ==========================================================================
  // 6. AGENT
  // --------------------------------------------------------------------------
  // Encapsulates sequencer, driver, and monitor.
  // ==========================================================================
  class my_agent extends uvm_agent;

    `uvm_component_utils(my_agent)

    uvm_sequencer #(my_sequence_item) sequencer;
    my_driver                        driver;
    my_monitor                       monitor;

    function new(string name = "my_agent", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      sequencer = uvm_sequencer#(my_sequence_item)::type_id::
                  create("sequencer", this);
      driver    = my_driver ::type_id::create("driver", this);
      monitor   = my_monitor::type_id::create("monitor", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);

      // Sequence items flow from sequencer to driver
      driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction

  endclass : my_agent


  // ==========================================================================
  // 7. ENVIRONMENT
  // --------------------------------------------------------------------------
  // Instantiates and connects agent and scoreboard.
  // ==========================================================================
  class my_env extends uvm_env;

    `uvm_component_utils(my_env)

    my_agent      agent;
    my_scoreboard scoreboard;

    function new(string name = "my_env", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      agent      = my_agent     ::type_id::create("agent", this);
      scoreboard = my_scoreboard::type_id::create("scoreboard", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);

      // Monitor sends observed transactions to scoreboard
      agent.monitor.ap.connect(scoreboard.analysis_export);
    endfunction

  endclass : my_env


  // ==========================================================================
  // 8. TEST
  // --------------------------------------------------------------------------
  // Top-level test that builds environment and starts sequences.
  // ==========================================================================
  class my_test extends uvm_test;

    `uvm_component_utils(my_test)

    my_env env;

    function new(string name = "my_test", uvm_component parent = null);
      super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      env = my_env::type_id::create("env", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
      my_sequence seq;

      phase.raise_objection(this);

      seq = my_sequence::type_id::create("seq");
      seq.start(env.agent.sequencer);

      // Allow time for DUT to complete responses
      #100ns;

      phase.drop_objection(this);
    endtask

  endclass : my_test

endpackage : my_uvm_pkg
