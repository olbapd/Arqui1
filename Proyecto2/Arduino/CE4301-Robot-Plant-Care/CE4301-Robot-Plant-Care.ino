/**
 * Copyright (C) 2019
 * Computer Engineering, Costa Rica Institute of Technology, Costa Rica
 * CE-4301 – Computer Arhitecture I
 * 
 * @file PlantCare.ino
 * 
 * @brief This contains a arduino program to control a Plant Care System
 * 
 * @author Marco Fernández Granados 
 * @author Pablo García Brenes
 * @author André Herrera Chacón 
 * @author José Andrés Rivera Tencio
 */

//ESP8266 Independent Library 
#include "ESP_XYZ_StandAlone.h"

//Time library
#include <time.h>
#include "DailyTimer.h"

//Definitions
#define LIGHTS_PIN 0 
#define VALVE_PIN 2
#define FLOW_PIN  4
#define HUMIDITY_PIN  16 

//Wifi control object 
ESP_XYZ esp;

//Wifi data 
char* ssid = "Alfaro2";
char* pass = "Kosneo01";

//MQTT Server data
String server = "m12.cloudmqtt.com";
String user = "kvacnttu";
String srv_pass = "HErp-sdloW_B";
int port = 16515;

//Device ID 
String device_id = "Dispositivo1";

//MQTT server topics 
String lightsRTpc = "handleLights";
String waterRTpc = "handleWater";
String humidityRTpc = "handleHumidity";
String topic = "Send";

//Logic variables 
bool lightOn;
bool lightAuto;
bool autoWater;

//Time 
int i = 0;
uint8_t hourOn = 2;
uint8_t minuteOn = 00;
uint8_t hourOff = 23;
uint8_t minuteOff = 59;
int timezone = -6;

//Humidity 
int minimumHumidity = 50;

//Flow 
volatile int flow_frequency; // Measures flow sensor pulses
float l_hour; // Calculated litres/hour
float flowMilliLitres;
float totalMilliLitres;
float mlToPour;
void ICACHE_RAM_ATTR flow();

//Cloop 
unsigned long currentTime;
unsigned long cloopTime;
unsigned long lastWateringTime;

//Valve
bool isValve_open;


void _lightsOn();
void _lightsOff(); 
void flow();

DailyTimer lightsTimer(
  true,                                 // AutoSync true or false, will run the startTimeCallback() if restarts within the active range or after range changes and you are in the range
  hourOn,                               // Start Hour
  minuteOn,                             // Start Minute
  hourOff,                              // End Hour 
  minuteOff,                            // End Minute
  EVERY_DAY,                            // SUNDAYS, MONDAYS, TUESDAYS, WEDNESDAYS, THURSDAYS, FRIDAYS, SATURDAYS, WEEKENDS, WEEKDAYS, or EVERY_DAY
  FIXED,                                // OPTIONAL - FIXED, RANDOM, RANDOM_START, or RANDOM_END
  _lightsOn,                            // pointer to function to execute at Start time, or a Lambda as in this example:
  _lightsOff                            // pointer to function to execute at End time
);

void setup() {
  //19200 baudios communication initializer 
  Serial.begin(19200);

  //Wait wifi connection 
  while(!Serial);

  //End wifi connection if there is not communication
  while(!esp.connectAP(ssid, pass));

  //Control print
  Serial.println("Successful Communication");

  //Intitialize device  
  esp.MQTTConfig(device_id);

  //MQTT server configuration 
  esp.MQTTSetServer(server, port, user, srv_pass);

  //Subscribe MQTT to a specific topic to listen 
  esp.MQTTSubscribe(lightsRTpc);
  esp.MQTTSubscribe(waterRTpc);
  esp.MQTTSubscribe(humidityRTpc);
  
  //Create subscribe loop 
  esp.MQTTSetCallback(mqtt_callback);

  //Lights
  lightOn = false;
  lightAuto = true;
  pinMode(LIGHTS_PIN, OUTPUT);

  //Water flow 
  autoWater = true;
  pinMode(HUMIDITY_PIN, INPUT);
  pinMode(VALVE_PIN, OUTPUT);
  cloopTime = currentTime;
  flowMilliLitres   = 0;
  totalMilliLitres = 1000;
  mlToPour = 1000;
  isValve_open = false;
  lastWateringTime = 0;

  
  pinMode(FLOW_PIN, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(FLOW_PIN), flow, RISING); 
  sei(); // Enable interrupts


    
  configTime(timezone * 3600, 0, "pool.ntp.org", "time.nist.gov");
  Serial.println("\nWaiting for time");
  while (!time(nullptr)) {
    Serial.print(".");
    delay(1000);
  }

    for(uint8_t cont = 0; cont < 15; ++cont){
    Serial.print(".");
    delay(1000);
    }
  time_t now = time(nullptr);
  setTime(hour(now), minute(now), second(now), day(now), month(now), year(now));

  lightsTimer.begin();

  currentTime = millis();

  Serial.println("");
}

void loop() {
  //Verifie device connection
  if (!esp.MQTTConnected()) {
    //Make connection again 
    esp.MQTTReconnect(device_id);
  }
  //MQTTSubscriibe
  esp.MQTTLoop();

  //JSON string message
  String json_msg = "";

  //Add data needed  
  jsonInit(&json_msg);
  addToJson(&json_msg, "adc", analogRead(A0));
  addToJson(&json_msg, "millis", int(millis())); 
  jsonClose(&json_msg);

  //An HTTP POST request is executed and the response code is stored
  bool published = esp.MQTTPublish(topic, json_msg);
  
  //The memory associated with the JSON message is freed
  jsonClear(&json_msg);

  //The code and body of the response is printed
  Serial.println("Mensaje publicado: ");
  Serial.println(published);
  
  //One second pause in program execution
  delay(1000);
}

// Callback function
void mqtt_callback(char* topic, byte* payload, unsigned int len) {
  // Notify the reception of a message in UART port
  String recvMessage = "";
  Serial.print("Recived message");
  Serial.println(topic);
  Serial.print("Prossesing request...");

  //Recv message and "cast" to String
  for (int i = 0; i < len; i++) {
    recvMessage = (char)payload[i];
  }
  
  Serial.println(recvMessage);

  //Handle request
  if((String)topic == "handleLights"){
    handleLights(recvMessage);
    }
  else if((String)topic == "handleWater"){
    handleWater(recvMessage);
    }
  else if((String)topic == "handleHumidity"){
    handleHumidity(recvMessage);
    }
  else{
    Serial.println("Request error");
    }
}

// Interrupt function
void flow () 
{
   flow_frequency++;
}
//Turn on lights
void _lightsOn(){
  lightOn = true;
  digitalWrite(LIGHTS_PIN, HIGH);
  Serial.println("Lights On");
  }
//Turn off lights
void _lightsOff(){
  lightOn = false;
  digitalWrite(LIGHTS_PIN, LOW);
  Serial.println("Lights Off");
  }
//Handle humidity
void handleHumidity(String request){ 
  int humidity = getJsonInt(request,"humidity");
  if(humidity !=0){
    minimumHumidity = humidity;
  }
  Serial.println("Humidity Handled");
}
//Open water flow 
void waterNow(){
  lastWateringTime = millis();
  isValve_open = true;
  totalMilliLitres = 0;
  digitalWrite(VALVE_PIN, HIGH);
  Serial.println("Now Watering");
  }
//Loop to handle flow data  
void flow_loop(){
  currentTime = millis();
  // Every second, calculate and print litres/hour
  if(currentTime >= (cloopTime + 1000))
  { 
    cloopTime = currentTime; // Updates cloopTime
    // Pulse frequency (Hz) = 7.5Q, Q is flow rate in L/min.
    l_hour = (flow_frequency / 7.5); // (Pulse frequency x 60 min) / 7.5Q = flowrate in L/hour
  
    flowMilliLitres = ((l_hour /60)) * 1000;
    // Add the millilitres passed in this second to the cumulative total
    totalMilliLitres += flowMilliLitres;
    
    flow_frequency = 0; // Reset Counter
    Serial.print(l_hour, DEC); // Print litres/hour
    Serial.println(" L/min");
    
    Serial.print(totalMilliLitres, DEC);
    Serial.println(" mL");
   }
}
//Get humidity data 
int getHumidity(){
  int value = analogRead(HUMIDITY_PIN);   //Read analog value 
  value = constrain(value,400,1023);  //Keep the ranges!
  value = map(value,400,1023,100,0);  //Map value : 400 will be 100 and 1023 will be 0
  return value;
}
//Water handle function 
void handleWater(String request){
  String option = getJsonStr(request,"option");
  if (option =="amount"){
    mlToPour = 0; // Poner aqui
    totalMilliLitres = getJsonInt(request,"value");;
    }
  if (option =="manual"){
    autoWater = false;
    if (request == "on"){ //Cambiar
      waterNow();
      }
    }
  else if (option == "auto"){
    autoWater = true;
    if (option =="minimumHumidity")
      minimumHumidity = getJsonInt(request,"value");;
    }
    Serial.println("Handled Water");
}
//Lights handle function 
void handleLights(String request) {
  String option = getJsonStr(request,"option");
  if (option =="manual"){
    lightAuto = false;
    String action = getJsonStr(request,"action");
    if (action == "on"){
      _lightsOn();
      }
     else if (action == "off"){
      _lightsOff();
      }
    }
    else if (request=="auto"){
      String action = getJsonStr(request,"action");
      lightAuto = true;
      if (action =="hourOn")
        hourOn = 0;
      if (action =="hourOff")
        hourOff = 0;
      if (action =="minuteOn")
        minuteOn = 0;
      if (action == "minuteOff")
        minuteOff = 0; 
      lightsTimer.setStartTime(hourOn, minuteOn);
      lightsTimer.setEndTime(hourOff, minuteOff);
      }
   Serial.println("Handled Lights");
  }
  
