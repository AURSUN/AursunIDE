/*
This example code and library was written by Øyvind Schei aka Sabesto (sabesto@gmail.com) 
as a result of purchasing the Sparkfun 128x64 serial display (http://www.sparkfun.com/products/9351).
After a while I found out that there where no libraries and that the firmware on the backpack was bugged.
I bought this module because I'm a complete beginner and wanted something easy, so I decided to make this library to help other beginners

This library ONLY works with summoningdark's firmware at http://sourceforge.net/projects/serialglcd/
If you bought this unit, I strongly suggest you upgrade to this firmware as the original is both slow and bugged.
summoningdark's firmware only works with the 128x64 display and NOT the 160x128 display.

Some of the functions was copied from Michael Nash (iklln6 at sparkfun) (http://www.evernote.com/pub/iklln6/GLCdlibrarywork#n=5eddb1b2-29bf-4053-9a56-91b8cd2662f9&b=c602d0e4-4d76-46f4-a036-376d1a4f9bd0)
but i changed them to work with summoningdark's firmware. I also added some new functions that was made possible with the new firmware.

I have not yet commended in the library itself, nor made a README file, but I hope this example code will make things clear. 
Have a look at summoningdark's README file that comes with the firmware(firmware/trunk/README.txt) or email me if something is unclear.
If something doesnt work, try adding delays.

As stated earlier, I'm a compete beginner, so if something is done wrong or not working properly please email me (sabesto@gmail.com).
*/

#include <serialGLCD.h> // Include the library

// Example 128x64 bitmap, use Paint and BMP2ASM (http://www.piclist.com/techref/microchip/bmp2asm.htm) to
// make your own. used in the drawData function further down..
byte sprite[] = {    
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x80,0x80,0xC0,0xC0,0xE0,0xE0,0xF0,0xF0,0xF8,0xF8,0xFC,0xFC,0x7E,0xFE,0xFF,0xFF,
0xFF,0xFE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,
0x80,0xC0,0xC0,0xE0,0xE0,0xF0,0xF0,0xF8,0xF8,0xF8,0xFC,0x7C,0x7E,0x3E,0x3F,0x1F,
0x1F,0x0F,0x0F,0x07,0x07,0x03,0x03,0x01,0x01,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,
0xFF,0xFF,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,
0x80,0xC0,0xC0,0xE0,0xE0,0xF0,0xF0,0xF8,0xF8,0xFC,0x7C,0x7E,0x3E,0x3F,0x1F,0x1F,
0x0F,0x0F,0x0F,0x07,0x07,0x03,0x03,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x07,0x0F,
0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,
0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,
0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,
0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0x0F,0xFF,0xFF,0xFF,0xFF,0xFF,
0x80,0xC0,0xE0,0xE0,0xF0,0xF0,0xF8,0xF8,0xFC,0x7C,0x7E,0x7E,0x3F,0x3F,0x1F,0x1F,
0x0F,0x0F,0x07,0x07,0x03,0x03,0x01,0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0xFF,
0x01,0x03,0x07,0x07,0x0F,0x0F,0x1F,0x1F,0x3F,0x3E,0x7E,0x7C,0xFC,0xFC,0xF8,0xF8,
0xF0,0xF0,0xE0,0xE0,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,
0x03,0x03,0x03,0x07,0x07,0x0F,0x0F,0x1F,0x1F,0x3F,0x3E,0x7E,0x7C,0xFC,0xF8,0xF8,
0xF0,0xF0,0xE0,0xE0,0xC0,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xE0,0xF0,
0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,
0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,
0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,
0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xF0,0xFF,0xFF,0xFF,0xFF,0xFF,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,
0x01,0x03,0x03,0x07,0x07,0x0F,0x0F,0x1F,0x1F,0x3F,0x3F,0x3E,0x7E,0x7C,0xFC,0xF8,
0xF8,0xF0,0xF0,0xE0,0xE0,0xC0,0xC0,0x80,0x80,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,
0xFF,0xFF,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,
0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,
0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,
0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x01,0x01,0x03,0x03,0x07,0x07,0x0F,0x0F,0x1F,0x1F,0x3F,0x3E,0x7E,0x7F,0xFF,0xFF,
0xFF,0x7F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
};

void setup() {
  Serial.begin(115200); //default baudrate of the display, can be changed, consult summoningdark's README that comes with the firmware to change it
  delay(5000);
  
}

serialGLCD lcd; // initialisation

void loop() {
  
  lcd.clearLCD();
  // Allow for a short delay after clearLCD since it takes some time for the backpack to clear the entire screen
  delay(10);
  // Draw the sprite (int x, int y, int mode, int height, int width, byte data)
  // x and y defines the upper left corner to draw from, mode (same modes as text), height and width of the bitmap in pixels. sprite is the array of bytes.
  lcd.drawData(0,0,4,128,64,sprite); 
  delay(2000);  
  lcd.clearLCD();
  
  // Draw box. This command draws an outline of a box with corners x1,y1,x2,y2 and S_R for line type (respects reverse)
  // so to draw a box from (5,5) to (15,15) would be (5,5,15,15,1)
  lcd.drawBox(40,10,60,30,1);
  
  
  // draw filled box. this draws a box much like the previous command, but the inside is filled with the fill byte. the fill byte describes 1 8-pixel high stripe
  // that is repeated every x pixels and every 8 y pixels. the most useful are 0x00 to clear the box, and 0xFF to fill it.
  // arguments x1,y1,x2,y2,fillbyte
  lcd.drawFilledBox(10,10,30,30,0x55);
  delay(2000);
  lcd.clearLCD();
  
  // Print text with the default font
  Serial.print("test");
  
  // Toggle to the aux font (bigger) and print text again, then toggle back to default text
  lcd.toggleFont();
  Serial.print("test");
  lcd.toggleFont();
  delay(2000);
  lcd.clearLCD();
  
  // Draw a circle with center x=30, y=20, radius=10, and 1 for write (0 for erase)
  lcd.drawCircle(30,20,10,1);
  delay(2000);
  
  // Set backlight to 50%, then back to 100%
  lcd.backLight(50);
  delay(2000);
  lcd.backLight(100);
  lcd.clearLCD();
  
  // Go to line 1, print "Line1" then go to line 8 and print "Line8"
  // gotoLine uses gotoPosition further down in the examples, but splits the screen up in 8 lines to make it easier
  lcd.gotoLine(1);
  Serial.print("Line1");
  lcd.gotoLine(8);
  Serial.print("Line8");
  delay(2000);
  lcd.clearLCD();
  
  // Draw a filled box, then use eraseBlock to erase inside
  // eraseBlock works just like drawbox, but no S_R is required, it simply draws a box with white
  lcd.drawFilledBox(10,10,30,30,0xFF);
  delay(1000);
  lcd.eraseBlock(13,13,27,27);
  delay(2000);
  lcd.clearLCD();
  
  // Toggle a pixel on/off, needs x,y coords and 1 or 0 to write or erase
  // Write to pixel 10,10, then erase it
  lcd.togglePixel(10,10,1);
  delay(2000);
  lcd.togglePixel(10,10,0);
  delay(1000);
  
  // Use gotoPosition to print between lines
  lcd.gotoPosition(0,7);
  Serial.print("0,7");
  delay(500);
  lcd.gotoPosition(20,8);
  Serial.print("20,8");
  delay(500);
  lcd.gotoPosition(46,9);
  Serial.print("46,9");
  delay(2000);
  
  // Draw a line from 10,10 to 50,50
  lcd.drawLine(10,10,50,50,1);
  delay(1000);
  // Then erase it
  lcd.drawLine(10,10,50,50,0);
  delay(1000);
  lcd.clearLCD();
  
  /*
  Upload sprite. this stores the sprite in the backpack, they must be 32 byte by default. a total of 8 sprites can be stored.
  uploadSprite(1,10,16,sprite2) stores a 10x16px sprite as sprite 1 (0 is the first).
  Read the documentation for the firmware to find out how this works if you really need it
  */  
  byte sprite2[] = {0x80,0xc0,0x40,0x0c,0x3e,0xfe,0xf2,0xe0,0xf0,0xe0,0xff,0x7f,0x3f,0x1f,0x1f,0x1f,0x1f,0x0f,0x07,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00};
  lcd.uploadSprite(1,10,16,sprite2);
  
  /*
  Then draw the sprite that was uploaded previosly.
  drawsprite(10,10,1,4) draws sprite 1 from top left corner 10,10 using method 4 (XOR, read firmware doc)
 */ 
  lcd.drawSprite(10,10,1,4);
  while(1){};
}