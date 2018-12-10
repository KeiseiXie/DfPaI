void setup() {
  size(900, 900);
  background(0);
}


//pixels array
  void draw() {
    loadPixels();
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        pixels[i+j*height] = color((i+j)%255, sin(j)*i%255, cos(i)*j%255);
      }
    }
    updatePixels();
    //if(frameCount<121){
    //      saveFrame("frame/frames-###.png");

      
    //}
  }
