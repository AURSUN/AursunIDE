#ifndef AURSUN_BLUETOOTH
#define AURSUN_BLUETOOTH
#include<Arduino.h>
#include "EEPROM.h "
typedef String STRING_DATA_SEND;
typedef int PINS_STATUS;
typedef void WITHOUT_RETURN;
class Bluetooth 
{
  public:
  Bluetooth();
  Bluetooth(int,int);
  void begin(long int a=9600);
   bool available();
  
  bool connected();
  private:
   String read();
   char read_char();
   bool  done;
   char ori=' ';
 };
 class Extension
 {
  public:
void begin();
//plug 1
 bool p1();
 bool p1();
//plug 2
 bool p2();
 bool p2();
//plug 3
 bool p3();
 bool p3();
// plug 4
 bool p4();
 bool p4();  
 private:
 void check();
 bool one=EEPROM.read(0x00);
 bool two=EEPROM.read(0x01);
 bool three=EEPROM.read(0x02);
 bool four=EEPROM.read(0x03);
 };


#endif

