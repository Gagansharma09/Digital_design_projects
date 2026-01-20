// ESP32 UART TX → FPGA UART RX
#include <Arduino.h>

void setup() {
    Serial2.begin(115200, SERIAL_8N1, -1, 17);
}

void loop() {
    Serial2.write(0x3F);
    delay(1000);
}
