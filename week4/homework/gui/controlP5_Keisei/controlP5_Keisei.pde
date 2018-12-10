import controlP5.*;

ControlP5 cp5;
int Red =100;
int Green =100;
int Blue =100;
RadioButton r;
int mycolor=color(0, 0, 0);

void setup() {
  size(640, 360);
  cp5 = new ControlP5(this);
  
  //EnableShortcuts alt + mouseleft move Tricky one
  cp5.enableShortcuts();

//Create Group
//slider and Radio button
  Group c = cp5.addGroup("c")
    .setPosition(300, 100)
    .setWidth(300)
    .activateEvent(true)
    .setBackgroundColor(color(255, 80))
    .setBackgroundHeight(100)
    .setLabel("Control Color.")
    ;

  cp5.addSlider("Red")
    .setPosition(80, 10)
    .setSize(180, 9)
    .setRange(0, 255)
    .setGroup(c)
    ;

  cp5.addSlider("Green")
    .setPosition(80, 20)
    .setSize(180, 9)
    .setRange(0, 255)

    .setGroup(c)
    ;
  cp5.addSlider("Blue")
    .setPosition(80, 30)
    .setSize(180, 9)
    .setRange(0, 255)
    .setGroup(c)
    ;
  r=cp5.addRadioButton("radio")
    .setPosition(10, 10)
    .setSize(20, 9)
    .setColorForeground(color(120))

    .addItem("red", 0)
    .addItem("green", 1)
    .addItem("blue", 2)

    .setGroup(c)
    ;
}


void draw() {
  background(Red, Green, Blue);
  //fill(Red,Green,Blue);
}


//Get different value from click different value
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup() && theEvent.name().equals("radio")) {
    println(int(theEvent.arrayValue()));
    //println(theEvent.arrayValue(0));

    int x = int(theEvent.arrayValue()[0]);
    println(x);
    int y = int(theEvent.arrayValue()[1]);
    int z = int(theEvent.arrayValue()[2]);
    if (x>0) {
      //mycolor=color(187, 100, 100);
      Red =187;
      Green=100;
      Blue=100;
    }
    if (y>0) {
      //mycolor=color(100, 131, 100);
      Red=100;
      Green=131;
      Blue=100;
    }
    if (z>0) {
      //mycolor=color(100, 100, 196);
      Red=100;
      Green=100;
      Blue=196;
    }
  }
}
