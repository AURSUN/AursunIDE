//developed by  ajay soni
#ifndef WON_H
#define WON_H
#include<SoftwareSerial.h>
#include<Arduino.h>
#if ARDUINO >= 100
#include "Arduino.h"
#else    
    #include "WProgram.h"
#endif
class DCMotor {

public:
    DCMotor(); 
    DCMotor(byte el, byte e2, byte I1, byte I2, byte I3, byte I4, int delay); // full constructor
    void starterpins(byte el, byte e2);
    void controlpins(byte I1, byte I2, byte I3, byte I4);
    void setDelay(int delay);
    void setSpeed(int speed);
    void start();
    void moveForward();
    void moveBackward();
    void moveleft();
    void moveRight();
    void stop();
    void goForward();
    void goBackward();
    void steerLeft();
    void steerRight();
	void rotate();

private:

    int mDelay;
    int mSpeed; 
    byte mE1;
    byte mE2;
    byte mI1;
    byte mI2;
    byte mI3;
    byte mI4;
};
#define CM 1
#define INC 0

class Ultrasonic
{
  public:
    Ultrasonic(int TP, int EP);
	Ultrasonic(int TP, int EP, long TO);
    long Timing();
    long distance(int sys);

  private:
    int Trig_pin;
    int Echo_pin;
	long Time_out;
    long duration,distance_cm,distance_inc;
};

#endif