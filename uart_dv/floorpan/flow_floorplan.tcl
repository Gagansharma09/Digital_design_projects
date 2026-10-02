cd ~/catalyzer_projects/digital/uart/run/floorplan

cat > view_reports.sh <<'EOF'
#!/bin/bash

REPORT_DIR="$(dirname "$0")/reports"

echo "=========================================="
echo "          UART FLOORPLAN REPORTS"
echo "=========================================="

echo
echo "1. DESIGN AREA"
echo "------------------------------------------"
cat "$REPORT_DIR/design_area.rpt"

echo
echo "2. CELL USAGE"
echo "------------------------------------------"
cat "$REPORT_DIR/cell_usage.rpt"

echo
echo "3. SETUP / MAX TIMING"
echo "------------------------------------------"
cat "$REPORT_DIR/max_timing.rpt"

echo
echo "4. HOLD / MIN TIMING"
echo "------------------------------------------"
cat "$REPORT_DIR/min_timing.rpt"

echo
echo "5. POWER"
echo "------------------------------------------"
cat "$REPORT_DIR/power.rpt"

echo
echo "6. TIMING"
echo "------------------------------------------"
cat "$REPORT_DIR/timing.rpt"

echo
echo "7. SETUP CHECKS"
echo "------------------------------------------"
cat "$REPORT_DIR/check_setup.rpt"

echo
echo "8. UNCONSTRAINED PATHS"
echo "------------------------------------------"
cat "$REPORT_DIR/unconstraints.rpt"

echo
echo "9. DONT-USE CELLS"
echo "------------------------------------------"
cat "$REPORT_DIR/dont_use.rpt"

echo
echo "10. LOGIC DEPTH HISTOGRAM"
echo "------------------------------------------"
cat "$REPORT_DIR/logic_depth_histogram.rpt"

echo
echo "=========================================="
echo "        END OF FLOORPLAN REPORTS"
echo "=========================================="
EOF

chmod +x view_reports.sh

./view_reports.sh
