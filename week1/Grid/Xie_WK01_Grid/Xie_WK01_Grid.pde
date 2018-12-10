float eyer = 7 ;
int smileSpcace=30;
void setup() {
  size(900, 900);
}



//face
void draw() {
  background(0);

  for (int x =4; x<100; x+=4) {
    for (int y =4; y<100; y+=4) {
      fill(255);
      ellipse( x * smileSpcace, y *smileSpcace, smileSpcace, smileSpcace);
      fill(255,0,0);
      ellipse(x*smileSpcace-eyer, y*smileSpcace -eyer, eyer ,eyer);
      ellipse(x*smileSpcace+eyer, y*smileSpcace -eyer, eyer ,eyer);
      line(x*smileSpcace-eyer,y*smileSpcace+eyer,x*smileSpcace+eyer,y*smileSpcace+eyer);
    }
  }
  //if(frameCount<2){
  //        saveFrame("frame/frames-###.png");

      
  //  }
  
}
