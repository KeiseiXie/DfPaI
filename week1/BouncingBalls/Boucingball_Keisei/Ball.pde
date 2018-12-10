class Ball {

  PVector pos;
  PVector vel;
  PVector velb;
  PVector acceleration;
  PVector mouse;
  float dia;
  color c;

  Ball(float x ) {
    pos = new PVector(random(100,width-40), random(100,height-40));
    vel = new PVector(0, 0);
    velb = new PVector(2, -2);
    dia = x;
    c =color(random(255), random(255), random(255));
  }
  
  //check edge
  void update() {
    pos.add(velb);
    if (pos.x<dia/2||pos.x>width-dia/2) {
      velb.x = -velb.x;
    }
    if (pos.y<dia/2||pos.y>height-dia/2) {
      velb.y=-velb.y;
    }
  }

//solve bug mouse vector attract
  void clickclick() {
    mouse = new PVector (mouseX, mouseY);


    mouse.sub(pos);
    mouse.setMag(0.5);
    acceleration = mouse;

    velb.add(acceleration);
    velb.limit(5);
    pos.add(velb);

    //println(i);
    println("done");
  }
  
  
  //collision ball class Ball input _otherBall
 void collision(Ball _otherBall){
   float d = dist(pos.x, pos.y, _otherBall.pos.x, _otherBall.pos.y);
   if(d<(dia+_otherBall.dia)/2){
   velb.mult(-1);
   _otherBall.velb.mult(-1);
   
   }
 }
    
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(c);
    ellipse(pos.x, pos.y, dia, dia);
  }
}
