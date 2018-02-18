#ifndef AURSUN_BLUETOOTH
#define AURSUN_BLUETOOTH
#include<Arduino.h>
#include<EEPROM.h>
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
   String read();
   char read_char();
  bool connected();
  private:
   bool  done;
   char ori=' ';
 };
 class Extension
 {
  public:
void begin();
//plug 1
 bool p1_on();
 bool p1_off();
//plug 2
 bool p2_on();
 bool p2_off();
//plug 3
 bool p3_on();
 bool p3_off();
// plug 4
 bool p4_on();
 bool p4_off();  
 private:
 void check();
 bool one=EEPROM.read(0x00);
 bool two=EEPROM.read(0x01);
 bool three=EEPROM.read(0x02);
 bool four=EEPROM.read(0x03);
 };


#endif

