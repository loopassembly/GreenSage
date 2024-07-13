#include <Adafruit_MLX90614.h>

Adafruit_MLX90614 mlx = Adafruit_MLX90614();
#define relayPin 2
#define wet 210
#define dry 510

void setup() {
  Serial.begin(9600);
  while (!Serial);

  Serial.println("Adafruit MLX90614 test");

  if (!mlx.begin()) {
    Serial.println("Error connecting to MLX sensor. Check wiring.");
    while (1);
  }

  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, HIGH); 
}

void loop() {
  int sensorValue = analogRead(A0);
  int moisturePercentage = map(sensorValue, dry, wet, 0, 100);
  
  Serial.print(moisturePercentage);
  Serial.print(",");
  Serial.print(mlx.readObjectTempC());
  Serial.print(",");
  
  if ((moisturePercentage >0)&&(moisturePercentage <100)) {
    digitalWrite(relayPin, LOW); 
    Serial.print("ON");
  } else {
    digitalWrite(relayPin, HIGH); 
    Serial.print("OFF");
  }
  Serial.println();

  delay(1000); // Delay for stability, adjust as needed
}