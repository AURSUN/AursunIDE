/*Demoprogramm zur Anzeige der Sensorwerte vom Sharp 2Y0A21 auf der LED-Bar
* Anzeige als Ausschlag, nicht als Zahlenwert
* 21.06.2013 Michael Grupp
*/
#include "Arduino.h"
#include "letsgoING_LEDBar.h"

//LED-Bar Instanz Pin6: gelbes Kabel, Pin7: weißes Kabel
LEDBar myLEDBar(6, 7);

//Werte vom Infrarotsensor
int sensorValue;
int sensorPin;

void setup()
{
    //Pins
    sensorPin=0;
    pinMode(sensorPin, INPUT);
    
    //Wertebereich
    myLEDBar.setMapLow(20);
    myLEDBar.setMapHigh(500);
}

void loop()
{
    //Wert einlesen
    sensorValue=analogRead(sensorPin);
	
    //Ausgabe auf LEDs, Richtung von gruen nach rot (0)
    myLEDBar.analogToStack(sensorValue, 0);
    delay(50);
}
