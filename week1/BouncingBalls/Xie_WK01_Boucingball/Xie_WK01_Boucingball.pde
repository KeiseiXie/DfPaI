int nums =10;
Ball [] ball = new Ball [nums];
boolean action = false;
int start;


void setup() {
  size(900, 900);
  for (int i=0; i<nums; i++) {
    float d = random(12, 48);
    ball[i] = new Ball(d);
  }
}


void draw() {
  background(0);
  for (int i=0; i<nums; i++) {

    ball[i].update();
    ball[i].display();
    if (mousePressed) {
      ball[i].clickclick();
    }
  }
  
  //j = num -i
  for (int i=0; i<nums-1; i++) {
    for (int j=1; j<nums-i; j++) {
      ball[i].collision(ball[i+j]);
    }
  }
  if(action == true && frameCount<start+241){
    saveFrame("frame/frames-###.png");
    
  }
  
}

void keyPressed(){
  action=!action;
  start = frameCount;
  
}
