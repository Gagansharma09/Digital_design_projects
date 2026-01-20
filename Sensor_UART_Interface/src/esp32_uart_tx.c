///esp32 tx embeeded c code // ESP32 UART Transmitter for Cora Z7 FPGA
// ESP32 TX (GPIO17) → Cora Z7 U14 (CK_IO0)

#include <HardwareSerial.h>

// Use Serial2 on ESP32 (TX=GPIO17, RX=GPIO16)
HardwareSerial SerialPort(2);

void setup() {
    // Initialize Serial for debugging
    Serial.begin(115200);
    Serial.println("ESP32 UART Transmitter Starting...");
    
    // Initialize Serial2 for FPGA communication
    SerialPort.begin(115200, SERIAL_8N1, 16, 17); // RX=16, TX=17
    
    delay(1000);
    Serial.println("Sending LED patterns to FPGA...");
}

void loop() {
    // LED test patterns
    byte patterns[] = {
        0x01,  // LED0_R ON
        0x02,  // LED0_G ON
        0x04,  // LED0_B ON
        0x07,  // LED0 RGB ON
        0x08,  // LED1_R ON
        0x10,  // LED1_G ON
        0x20,  // LED1_B ON
        0x3F,  // All LEDs ON
        0x00   // All LEDs OFF
    };
    
    for (int i = 0; i < sizeof(patterns); i++) {
        SerialPort.write(patterns[i]);
        Serial.print("Sent: 0x");
        Serial.println(patterns[i], HEX);
        
        delay(1000); // 1 second between patterns
    }
}
