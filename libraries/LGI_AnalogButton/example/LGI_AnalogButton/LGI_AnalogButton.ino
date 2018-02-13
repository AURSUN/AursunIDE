#include <LGI_AnalogButton.h>

//anlegen der AnalgoButton-Instanzen
AnalogButton Button1(1);
AnalogButton Button2(2);
AnalogButton Button3(3);

void setup() {

  //starten der Seiellen Kommunikation
  Serial.begin(9600);

  //Ausgabe für Start-Button
  Serial.println("Waiting for Button 1...");
  Button1.startButton(); //Wartet bis Button1 gedrueckt wird

}

void loop() {

  //Ausgebe der Buttonzustände
  Serial.print(" Button 1: ");
  Serial.print(Button1.getButton());  //Tasterzustand
  Serial.print(" Switch 1: ");
  Serial.print(Button1.getSwitch()); //Schalterzustand
  Serial.print("  Button 2: ");
  Serial.print(Button2.getButton()); //Tasterzustand
  Serial.print("  Button 3: ");
  Serial.print(Button3.getButton()); //Tasterzustand
  Serial.print("  Switch 3: ");
  Serial.print(Button3.getSwitch()); //Schalterzustand
  Serial.print("Analog: ");
  Serial.println(analogRead(A3));    //Analogwert der Schalter

  delay(200);
}

