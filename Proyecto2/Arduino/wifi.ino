 
#include <ESP8266WiFi.h>        // Include the Wi-Fi library
#include <ESP8266WiFiMulti.h>   // Include the Wi-Fi-Multi library
#include <PubSubClient.h>


//-------------------VARIABLES GLOBALES--------------------------
int contconexion = 0;

const char *ssid = "ElPack";
const char *password = "Marco0011";
char   SERVER[50]   = "soldier.cloudmqtt.com";
int    SERVERPORT   = 12599;
String USERNAME = "arduinoUser";   
char   PASSWORD[50] = "admin";     


char PLACA[50];
// Leds Settings
int ledPin = 0;
char valueStr[15];
String strtemp = "";
char GLASS[50];
char PLATE[50];

WiFiClient espClient;
PubSubClient client(espClient);


//----------------------------Callback-----------------------------------
void callback(char* topic, byte* payload, unsigned int lenght){
  char PAYLOAD[5] = "";
  Serial.print("Mensaje Recibido: ");
  Serial.println(topic);

  for (int i = 0; i< lenght; i++){
    PAYLOAD[i] = (char)payload[i];
  }
  Serial.print(PAYLOAD);
}
//------------------------RECONNECT-----------------------------
void reconnect() {
  uint8_t retries = 3;
  // Loop hasta que estamos conectados
  while (!client.connected()) {
    Serial.print("Intentando conexion MQTT...");
    // Crea un ID de cliente al azar
    String clientId = "ESP8266Client-";
    clientId += String(random(0xffff), HEX);
    // Attempt to connect
    USERNAME.toCharArray(PLACA, 50);
    Serial.println(PLACA);
    Serial.println(PASSWORD);  
    if (client.connect(clientId.c_str(), PLACA, PASSWORD)) {
      Serial.println("conectado");
    } else {
      Serial.print("Failed, rc=");
      Serial.print(client.state());
      Serial.println("Retrying connection...");
      delay(5000);
    }
    retries--;
    if (retries == 0) {
      // esperar a que el WDT lo reinicie
      while (1);
    }
  }
}

//--------------- SETUP ---------------------
void setup() {
  
  Serial.begin(9600);  // Start the Serial communication to send messages to the computer.
  delay(10);
  
  pinMode(ledPin, OUTPUT);    // LED pin as output
  
 // scale_glass.begin(D2, D3);
 // scale_plate.begin(D0, D1);
  Serial.print("Lectura del valor del ADC:  ");
  //Serial.println(scale_glass.read());
  //Serial.println(scale_plate.read());
  Serial.println("No ponga ningun  objeto sobre la balanza");
  Serial.println("Destarando...");


   // Conexión WIFI
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED and contconexion <50) { //Cuenta hasta 50 si no se puede conectar lo cancela
    ++contconexion;
    delay(500);
    Serial.print(".");
  }
  if (contconexion <50) {
      //para usar con ip fija
      /*IPAddress ip(192,168,100,31); 
      IPAddress gateway(192,168,100,1); 
      IPAddress subnet(255,255,255,0); 
      WiFi.config(ip, gateway, subnet); */
      
      Serial.println("");
      Serial.println("WiFi conectado");
      Serial.println(WiFi.localIP());
      digitalWrite(ledPin , HIGH);
  
  }
  else { 
      Serial.println("");
      Serial.println("Error de conexion");
    digitalWrite(ledPin , LOW);
  }
  
  client.setServer(SERVER, SERVERPORT);
  client.setCallback(callback);

  String glass =  USERNAME + "/" + "humidity"; 
  glass.toCharArray(GLASS, 50);
  String plate=  USERNAME + "/" + "light"; 
  plate.toCharArray(PLATE, 50);
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  //unsigned long currentMillis = millis();
    
  //if (currentMillis - previousMillis >= 5000) { //envia la temperatura cada 10 segundos
   float glasWeight = 10;//scale_glass.get_units(20);
  //  float plateWeight = scale_plate.get_units(20); 
    
    //Send plate
   // strtemp = String(plateWeight, 2);
    strtemp = String(10);
    strtemp.toCharArray(valueStr, 15);
    Serial.println("Enviando: [" +  String(PLATE) + "] " + strtemp);
    client.publish(PLATE, valueStr);
    delay(500);
    //Send Glass
//    strtemp = String(glasWeight, 2);
    strtemp = String(glasWeight, 15);
    strtemp.toCharArray(valueStr, 15);
    Serial.println("Enviando: [" +  String(GLASS) + "] " + strtemp);
    client.publish(GLASS, valueStr);
  
  //}
  delay(10000);
}
