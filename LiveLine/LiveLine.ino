//==============================================================
//                  INCLUDING LIBRARIES
//==============================================================
#include <Wire.h>
#include "MAX30100_PulseOximeter.h"
#include <ESP8266WiFi.h>
#include <FirebaseArduino.h> // ESP8266 lib to make Firebase API calls over SSL
 

 
//==============================================================
//                  INITIAL PROPERTIES
//==============================================================

// Create a MAX30100 object
#define REPORTING_PERIOD_MS 1000
char* ssid= "Wifi SSID";                                     // Your WiFi credentials.
char* pass = "wifi pass";
//wifi bandwidth must be 2.4GHz
#define FIREBASE_APP    "??????"  // Firebase app address, example "<yourAppName>.firebaseio.com"
#define FIREBASE_SECRET "??????"  // Secret ID generated for your FireBase app, example "ABcd1eF23gHIjKlMNOpqR456St7UVWXyZAB89cDE
// Connections : SCL PIN - D1 , SDA PIN - D2 , INT PIN - D0
PulseOximeter pox;
 
float BPM, SpO2;
// Time when the last reading was taken
uint32_t tsLastReading = 0;
 

const unsigned char bitmap [] PROGMEM=
{
0x00, 0x00, 0x00, 0x00, 0x01, 0x80, 0x18, 0x00, 0x0f, 0xe0, 0x7f, 0x00, 0x3f, 0xf9, 0xff, 0xc0,
0x7f, 0xf9, 0xff, 0xc0, 0x7f, 0xff, 0xff, 0xe0, 0x7f, 0xff, 0xff, 0xe0, 0xff, 0xff, 0xff, 0xf0,
0xff, 0xf7, 0xff, 0xf0, 0xff, 0xe7, 0xff, 0xf0, 0xff, 0xe7, 0xff, 0xf0, 0x7f, 0xdb, 0xff, 0xe0,
0x7f, 0x9b, 0xff, 0xe0, 0x00, 0x3b, 0xc0, 0x00, 0x3f, 0xf9, 0x9f, 0xc0, 0x3f, 0xfd, 0xbf, 0xc0,
0x1f, 0xfd, 0xbf, 0x80, 0x0f, 0xfd, 0x7f, 0x00, 0x07, 0xfe, 0x7e, 0x00, 0x03, 0xfe, 0xfc, 0x00,
0x01, 0xff, 0xf8, 0x00, 0x00, 0xff, 0xf0, 0x00, 0x00, 0x7f, 0xe0, 0x00, 0x00, 0x3f, 0xc0, 0x00,
0x00, 0x0f, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};
 
//==============================================================
//                  SETUP
//==============================================================
 
void setup()
{
  pinMode(BUILTIN_LED, OUTPUT); //here builtin led works inverted
  Serial.begin(115200); //baud rate of nodemcu
  WiFi.disconnect(); 
  delay(500);
  WiFi.begin(ssid,pass);
  Serial.println("");
  Serial.print("Connecting to ");
  Serial.print(ssid);
  while(WiFi.status()!=WL_CONNECTED) //if status is not connected to
  {
    Serial.print(".");
    delay(500);
    
  }
  digitalWrite(BUILTIN_LED, HIGH); //here high means low
 // digitalWrite(BUILTIN_LED,LOW); //here low means high
  Serial.println("");
  Serial.print("Connected! IP Address is: ");
  Serial.println(WiFi.localIP());  //display the ip address 
    Serial.print("Initializing Pulse Oximeter..");
 
    if (!pox.begin())
    {
         Serial.println("FAILED");
         for(;;);
    }
    else
    {
         Serial.println("SUCCESS");
         pox.setOnBeatDetectedCallback(onBeatDetected);
    }
 
    // The default current for the IR LED is 50mA and it could be changed by uncommenting the following line.
     //pox.setIRLedCurrent(MAX30100_LED_CURR_7_6MA);
 
     // Configure sensor
    configureMax30100();
 Firebase.begin(FIREBASE_APP, FIREBASE_SECRET);   // Initialise Firebase object
}
 

//==============================================================
//                     LOOP
//==============================================================
void loop()
{
digitalWrite(BUILTIN_LED,LOW); //here low means high
    
    pox.update();
    BPM = pox.getHeartRate();
    SpO2 = pox.getSpO2();
     if (millis() - tsLastReport > REPORTING_PERIOD_MS)
    {
	  pox.startTemperatureSampling();
        Serial.print("Heart rate:");
        Serial.print(BPM);
        Serial.print(" bpm / SpO2:");
        Serial.print(SpO2);
        Serial.println(" %");
	if (pox.isTemperatureReady()) {
    	  float temp = pox.retrieveTemperature();
     	  Serial.print("Temperature = ");
        Serial.print(temp);
        Serial.print("*C | ");
        Serial.print((temp * 9.0) / 5.0 + 32.0);//print the temperature in Fahrenheit
        Serial.println("*F");
   		 }
        tsLastReport = millis();
     }
	sendData();
digitalWrite(BUILTIN_LED, HIGH); //here high means low
}

//==============================================================
//                     Other Functions
//==============================================================
void configureMax30100() {
  pox.setMode(MAX30100_MODE_SPO2_HR);
  pox.setLedsCurrent(MAX30100_LED_CURR_50MA, MAX30100_LED_CURR_27_1MA);
  pox.setLedsPulseWidth(MAX30100_SPC_PW_1600US_16BITS);
  pox.setSamplingRate(MAX30100_SAMPRATE_100HZ);
  pox.setHighresModeEnabled(true);
}

void sendData(){

StaticJsonBuffer<200> jsonBuffer;
JsonObject& data = jsonBuffer.createObject();
 data["temp"] = String(temp);
 data["spo2"]  = String(SpO2);
 data["hr"]  = String(BPM);
Firebase.set("/healthdata", JsonVariant(data));
if (Firebase.failed()) {
      Serial.print("setting /number failed:");
      Serial.println(Firebase.error());  
      return;
  }
delay(1000); // check every second
}