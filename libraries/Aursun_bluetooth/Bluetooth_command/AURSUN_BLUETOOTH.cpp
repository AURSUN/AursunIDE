#include<Arduino.h>
#include "AURSUN_BLUETOOTH.h"
#include " SoftwareSerial.h "
String inform;
String actual_data="";
#define ALERT "AURSUN"
typedef SoftwareSerial Bluetooth_information;
typedef String STRING_DATA_SEND;
typedef int PIN_STATUS;
typedef void WITHOUT_RETURN;
typedef char SINGLE_BYTE;
PIN_STATUS RX=0x00;
PIN_STATUS TX=0x01;
Bluetooth_information data_bluetooth(RX,TX);   // bluetooth connections 
Bluetooth::Bluetooth(){RX=3;TX=2;}
Bluetooth::Bluetooth(int a,int b){RX=a; TX=b;}  // declear pins  
String Bluetooth::read(){ String data=""; data=data_bluetooth.readString(); return data;}
void Bluetooth::begin(long int a)
{Serial.begin(a);data_bluetooth.begin(a);}
bool Bluetooth::available(){PIN_STATUS CHECK=data_bluetooth.available();return  CHECK;}
bool Bluetooth::connected(){ if(data_bluetooth.available()) 
{String a=data_bluetooth.readString();if(a.equals(ALERT)){done=true; }else  {done=false;  } } return done;}
char Bluetooth:: read_char()
{
  if(available())
  {
   ori=data_bluetooth.read();
  }
  return ori;
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

