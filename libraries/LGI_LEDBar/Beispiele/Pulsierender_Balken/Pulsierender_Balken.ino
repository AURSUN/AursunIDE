/*Demoprogramm zur Anzeige von pulsierendem Balken
 * 16.07.2013 Michael Grupp
 */
 
#include "Arduino.h"
#include "letsgoING_LEDBar.h"

//LED-Bar Instanz Pin6: gelbes Kabel, Pin7: weißes Kabel
LEDBar myLEDBar(6, 7);

void setup(){   
}

void loop()
{	
  for (int i=0; i<1023; i++) {
    myLEDBar.analogToStack(i, 0);
  }
  for (int j=1023; j>0; j--) {
    myLEDBar.analogToStack(j, 0);
  }
}

