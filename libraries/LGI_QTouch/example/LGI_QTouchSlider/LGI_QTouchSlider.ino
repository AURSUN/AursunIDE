#include <LGI_QTouch.h>

//Anlegen der Slider-Instanz
//alle Pins dienen als Anschluss- und Partner-Pin
QTouchSlider Slider(0, 2, 4);

void setup() {

  //starten der seriellen Schnittstelle
  Serial.begin(9600);

  //Initialisieren des Sliders (Einmessen der Offsets)
  Slider.init();
  
  //Ausgabe der Offsetwerte
  Serial.print("  Offset 3: ");
  Serial.print(Slider.getOffset(1));
  Serial.print("  Offset 4: ");
  Serial.print(Slider.getOffset(2));
  Serial.print("  Offset 5: ");
  Serial.println(Slider.getOffset(3));
  Serial.print("\n\n");

}

void loop() {

  //Ausgabe der Silderposition
  Serial.print("SliderPos: ");
  Serial.println(Slider.getTouchPosition());

  delay(50);
}



