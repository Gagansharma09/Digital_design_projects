cd ~

cat > view_cts_reports.sh <<'EOF'
#!/bin/bash

REPORT_DIR="$HOME/my_projects/uart/run/cts/reports"

echo "=========================================="
echo "             UART CTS REPORTS"
echo "=========================================="

echo
echo "1. CTS REPORT"
echo "------------------------------------------"
cat "$REPORT_DIR/report_cts.rpt"

echo
echo "2. CLOCK SKEW"
echo "------------------------------------------"
cat "$REPORT_DIR/clock_skew.rpt"

echo
echo "3. SETUP / MAX TIMING"
echo "------------------------------------------"
cat "$REPORT_DIR/max_timing.rpt"

echo
echo "4. HOLD / MIN TIMING"
echo "------------------------------------------"
cat "$REPORT_DIR/min_timing.rpt"

echo
echo "5. POST-CTS TIMING"
echo "------------------------------------------"
cat "$REPORT_DIR/timing.rpt"

echo
echo "6. POWER"
echo "------------------------------------------"
cat "$REPORT_DIR/power.rpt"

echo
echo "7. DESIGN AREA"
echo "------------------------------------------"
cat "$REPORT_DIR/design_area.rpt"

echo
echo "8. CELL USAGE"
echo "------------------------------------------"
cat "$REPORT_DIR/cell_usage.rpt"

echo
echo "9. LONG WIRES"
echo "------------------------------------------"
cat "$REPORT_DIR/long_wires.rpt"

echo
echo "10. LOGIC DEPTH"
echo "------------------------------------------"
cat "$REPORT_DIR/logic_depth_histogram.rpt"

echo
echo "11. CTS CONFIGURATION"
echo "------------------------------------------"
cat "$REPORT_DIR/cts.config"

echo
echo "12. UNCONSTRAINED PATHS"
echo "------------------------------------------"
cat "$REPORT_DIR/unconstraints.rpt"

echo
echo "=========================================="
echo "          END OF CTS REPORTS"
echo "=========================================="
EOF

chmod +x view_cts_reports.sh

~/view_cts_reports.sh
