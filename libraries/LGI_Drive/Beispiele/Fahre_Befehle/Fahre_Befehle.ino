#include <letsgoING_Drive.h>

//anlegen der Drive-Instanz
Drive Rover; //nutzt Pin 9-12 für die Motoren und Pin2+3 für die Interrupts

//alternativ:
//Drive Rover(m1SpdPin, m2SpdPin, m1DirPin, m2DirPin);
//Drive Rover(m1SpdPin, m2SpdPin, m1DirPin, m2DirPin, m1IntPin, m2IntPin);

void setup(){
}

void loop() 
{ 
  //Fahre vorwärts
  Rover.drive(80, 1);
  Rover.wait(1000);
  Rover.stopp();
  
  
  //Fahre rückwärts
  Rover.drive(80, 0);
  Rover.wait(1000);
  Rover.stopp();
  
  
  //Fahre vorwärts Distanz
  Rover.driveDistance(20, 80, 1);
  Rover.wait(1000);
  
  //Fahre rückwärts Distanz
  Rover.driveDistance(20, 80, 0);
  Rover.wait(1000);
  
   //Fahre Kurve vorwärts
  Rover.driveCurve(40, 80);
  Rover.wait(1000);
  Rover.stopp();
  Rover.wait(1000);
  
  //Fahre Kurve rückwärts
  Rover.driveCurve(40, 80);
  Rover.wait(1000);
  Rover.stopp();
  Rover.wait(1000);
  
  //Fahre Kurve vorwärts Distanz
  Rover.driveCurveDistance(20, 40, 80);
  Rover.wait(1000);
  
  //Fahre Kurve rückwärts Distanz
  Rover.driveCurveDistance(20, 40, 80);
  Rover.wait(1000);
  
  //Drehe 
  Rover.turn(80, 1);
  Rover.wait(1000);
  Rover.stopp();
  Rover.wait(1000);
  
  //Drehe 
  Rover.turn(80, 0);
  Rover.wait(1000);
  Rover.stopp();
  Rover.wait(1000);
  
  //Drehe 
  Rover.turnAngle(90, 40, 1);
  Rover.wait(1000);
  
  //Drehe 
  Rover.turnAngle(90, 40, 0);
  Rover.wait(1000);
}

