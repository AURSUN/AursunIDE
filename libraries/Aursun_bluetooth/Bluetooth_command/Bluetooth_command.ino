#include "AURSUN_BLUETOOTH.h"
Bluetooth data;
Extension USE;
void setup()
{
  data.begin(9600);
}
void loop()
{
 Serial.println( USE.p1_on());
  
}

