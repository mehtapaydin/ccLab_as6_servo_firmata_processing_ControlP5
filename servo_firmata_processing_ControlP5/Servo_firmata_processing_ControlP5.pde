import processing.serial.*;
import cc.arduino.*;
import controlP5.*;
ControlP5 controlP5;
Arduino arduino;

int slider_RED = 200;
int slider_GREEN = 200;
int slider_BLUE = 200;
int servoAngle = 200;

void setup() {
 
 size(1200,1200);
 controlP5 = new ControlP5(this);
 
 println(Arduino.list());
 arduino = new Arduino(this, Arduino.list()[2], 57600);

 for (int i = 0; i <= 13; i++)
 arduino.pinMode(i, Arduino.OUTPUT);

 controlP5 = new ControlP5(this);
 controlP5.addSlider("servoAngle",0,180,servoAngle,20,110,360,20);
 controlP5.addSlider("slider_RED",0,255,slider_RED,20,10,255,20);
 controlP5.addSlider("slider_GREEN",0,255,slider_GREEN,20,40,255,20);
 controlP5.addSlider("slider_BLUE",0,255,slider_BLUE,20,70,255,20);

}
void draw() {
  background(slider_RED, slider_GREEN, slider_BLUE);
 arduino.analogWrite(9, servoAngle);
 arduino.analogWrite(6, slider_RED);
 arduino.analogWrite(10, slider_GREEN);
 arduino.analogWrite(11, slider_BLUE);
 //delay(15);
}