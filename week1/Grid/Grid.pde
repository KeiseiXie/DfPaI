int eyer = 4 ;
void setup() {
  size(900, 900);
}



//face
void draw() {
  background(0);

  for (int x =0; x<100; x++) {
    for (int y =0; y<100; y++) {
      fill(255);
      ellipse( x * 20, y * 20, 20, 20);
      fill(255,0,0);
      ellipse(x*20-eyer, y*20 -eyer, eyer ,eyer);
      ellipse(x*20+eyer, y*20 -eyer, eyer ,eyer);
      line(x*20-eyer,y*20+eyer,x*20+eyer,y*20+eyer);
    }
  }
}
