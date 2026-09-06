Shell initialized. You can now type commands.
╔────────────────────────────────────────────────────────╗
│                                                        │
│   <<<<<<<<<<<<<{{ CHIPIN-C2S Server }}>>>>>>>>>>>>>    │
│                                                        │
│            Welcome to Compcarta Solutions!             │
│                                                        │
│                                                        │
╚────────────────────────────────────────────────────────╝
Last login: Mon Sep  7 03:03:23 2026 from 157.173.220.200
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~$ 
here 
execute cd ~/catalyzer_projects/digital/uart/run/synthesis
now #pwd is 
c2s-nitj-047-gagan-sharma@compcarta-chipin-c2s1:~/catalyzer_projects/digital/uart/run/synthesis$ 
then execute 
cat > view_reports.sh <<'EOF'
#!/bin/bash

REPORT_DIR="$(dirname "$0")/reports"

echo "=========================================="
echo "        UART SYNTHESIS REPORTS"
echo "=========================================="

echo
echo "1. SUMMARY"
echo "------------------------------------------"
cat "$REPORT_DIR/summary.rpt"

echo
echo "2. POST-SYNTHESIS STATISTICS"
echo "------------------------------------------"
cat "$REPORT_DIR/post_synth_stat.rpt"

echo
echo "3. MAX TIMING / SETUP"
echo "------------------------------------------"
cat "$REPORT_DIR/max_timing.rpt"

echo
echo "4. MIN TIMING / HOLD"
echo "------------------------------------------"
cat "$REPORT_DIR/min_timing.rpt"

echo
echo "5. POWER"
echo "------------------------------------------"
cat "$REPORT_DIR/power.rpt"

echo
echo "6. SYNTHESIS CHECKS"
echo "------------------------------------------"
cat "$REPORT_DIR/checks.rpt"

echo
echo "7. REGISTERS"
echo "------------------------------------------"
cat "$REPORT_DIR/registers.rpt"

echo
echo "8. HIERARCHICAL STATISTICS"
echo "------------------------------------------"
cat "$REPORT_DIR/post_synth_stat_hier.rpt"

echo
echo "9. MACHINE-READABLE STATISTICS"
echo "------------------------------------------"
cat "$REPORT_DIR/stats.json"

echo
echo "=========================================="
echo "        END OF SYNTHESIS REPORTS"
echo "=========================================="
EOF

chmod +x view_reports.sh

