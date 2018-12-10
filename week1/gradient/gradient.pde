void setup() {
  size(300, 300);
  background(0);
}


//pixels array
  void draw() {
    loadPixels();
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        pixels[i+j*height] = color(i, j, i+j/2);
      }
    }
    updatePixels();
  }
