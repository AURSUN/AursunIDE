#include "AURSUN_BLUETOOTH.h"
#include <Arduino.h>
Bluetooth wireless;
typedef char data;
void Extension ::begin()
{
  wireless.begin(9600);
}
void Extension ::check()
{
  data a;
  a= wireless.read_char();
  switch (a)
  {
    case  'A': 
    one=0x01;
    EEPROM.write(0x00,one);
    break;
     case 'a':
     one=0x00; 
    EEPROM.write(0x00,one);
     break;
     case 'B':
     two=0x01;
     EEPROM.write(0x01,two);
     break;
     case 'b':
     two=0x00;
     EEPROM.write(0x01,two);
     break;
     case 'C':
     three=0x01;
     EEPROM.write(0x02,three);
     break;
     case 'c':
     three=0x00;
     EEPROM.write(0x02,three);
     break;
     case 'D':
     four=0x01;
     EEPROM.write(0x03,four);
     break;
     case 'd':
     four=0x00;
     EEPROM.write(0x03,four);
     break;
     default:
     one=0x03;
     two=0x03;
     three=0x03;
     four=0x03;
  }
}
 bool Extension::p1_on ()  {    check();    return EEPROM.read(0x00);}
 bool Extension::p1_off() {     check();    return EEPROM.read(0x00);}
 bool Extension::p2_on  ()  {    check();    return EEPROM.read(0x01);}
 bool Extension::p2_off ()  {    check();    return EEPROM.read(0x01);}
 bool Extension::p3_on  ()  {    check();    return EEPROM.read(0x02);}
 bool Extension::p3_off ()  {    check();    return EEPROM.read(0x02);}
 bool Extension::p4_on  ()  {    check();    return EEPROM.read(0x03);}
 bool Extension::p4_off ()  {    check();    return  EEPROM.read(0x03);}
