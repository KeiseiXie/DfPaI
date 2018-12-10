import oscP5.*;
import netP5.*;

OscP5 oscP5;

float centerLat=51.5074;
float centerLon=0.1278;


//Create floatlist
FloatList lats=new FloatList();
FloatList lons=new FloatList();


void setup() {
  size(1000, 1000);
  frameRate(1);
  oscP5 = new OscP5(this, 12000);
}


void draw() {
  background(120);
}

//Class OscMessage input theOscMessage
void oscEvent(OscMessage theOscMessage) {

  float lat = theOscMessage.get(0).floatValue();
  float lon = theOscMessage.get(1).floatValue();

  float x=width/2+(lat-centerLat)*1000;
  float y=height/2+(centerLon+lon)*1000;


//Add items in lats list and lons list
  lats.append(x);
  lons.append(y);

  //println("   "+lat+"   " + lon);
}


void mousePressed() {

  for (int i=0; i<lats.size(); i++) {
    
    //Get item from lats list and lons list
    float a=lons.get(i);
    float b=lats.get(i);
    fill(255);
    ellipse(a, b, 20, 20);
  }
}
