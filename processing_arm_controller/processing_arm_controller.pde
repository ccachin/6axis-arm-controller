/**
* Control 6 axis arm
**/
import controlP5.*;
import processing.serial.*;
ControlP5 cp5;

Serial COMPort;
PFont f;

int Servo_1 = 0;
int Servo_2 = 0;
int Servo_3 = 0;
int Servo_4 = 0;
int Servo_5 = 0;
int Servo_6 = 0;


Knob servo_1;
Knob servo_2;
Knob servo_3;
Knob servo_4;
Knob servo_5;
Knob servo_6;

void setup() {
  // Serial configuration
  println(Serial.list());
  COMPort = new Serial(this, Serial.list()[1], 9600);
  COMPort.buffer(1);
  //----------------------
  
  size(400,350);
  smooth();
  noStroke();
  background(0);
  f = createFont("Arial",16,true);
  
  cp5 = new ControlP5(this);
  
  rect(0,300,400,1);
  textFont(f);       
  fill(255);
  text("- SERVOS CONTROLLER -",100,330); 
  
  //Controllers placement                 
  servo_1 = cp5.addKnob("Servo_1")
               .setRange(0,180)
               .setValue(0)
               .setPosition(20,20)
               .setRadius(50)
               .setNumberOfTickMarks(30)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.VERTICAL)
               ;
               
  servo_2 = cp5.addKnob("Servo_2")
               .setRange(0,180)
               .setValue(0)
               .setPosition(150,20)
               .setRadius(50)
               .setNumberOfTickMarks(30)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.VERTICAL)
               ;
               
  servo_3 = cp5.addKnob("Servo_3")
               .setRange(0,180)
               .setValue(0)
               .setPosition(280,20)
               .setRadius(50)
               .setNumberOfTickMarks(30)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.VERTICAL)
               ;
  
  servo_4 = cp5.addKnob("Servo_4")
               .setRange(0,180)
               .setValue(0)
               .setPosition(20,150)
               .setRadius(50)
               .setNumberOfTickMarks(30)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.VERTICAL)
               ;
               
  servo_5 = cp5.addKnob("Servo_5")
               .setRange(0,180)
               .setValue(0)
               .setPosition(150,150)
               .setRadius(50)
               .setNumberOfTickMarks(30)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.VERTICAL)
               ;
               
  servo_6 = cp5.addKnob("Servo_6")
               .setRange(0,180)
               .setValue(0)
               .setPosition(280,150)
               .setRadius(50)
               .setNumberOfTickMarks(30)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.VERTICAL)
               ;
            
               
}

void draw() {
  
  //Send Datas
  COMPort.write(Servo_1);
  
  //Print Datas
  println("Servo1: ",Servo_1 , "Servo2: ",Servo_2, "Servo3: ",Servo_3);
  println("Servo4: ",Servo_4 , "Servo5: ",Servo_5, "Servo6: ",Servo_6);
  println("----------------------------------------------------------------");
}

// MANUAL CONTROL
void keyPressed() {
  switch(key) {
    case('q'):servo_1.setValue(0);break;
    case('w'):servo_1.setValue(90);break;
    case('e'):servo_1.setValue(180);break;
    
    case('a'):servo_2.setValue(0);break;
    case('s'):servo_2.setValue(90);break;
    case('d'):servo_2.setValue(180);break;
    
    case('y'):servo_3.setValue(0);break;
    case('x'):servo_3.setValue(90);break;
    case('c'):servo_3.setValue(180);break;
    
    case('r'):servo_4.setValue(0);break;
    case('t'):servo_4.setValue(90);break;
    case('z'):servo_4.setValue(180);break;
    
    case('f'):servo_5.setValue(0);break;
    case('g'):servo_5.setValue(90);break;
    case('h'):servo_5.setValue(180);break;
    
    case('v'):servo_6.setValue(0);break;
    case('b'):servo_6.setValue(90);break;
    case('n'):servo_6.setValue(180);break;

  }
}