PImage img;
int pixeSquare = 20;

void setup() {
  size(500, 500);
  img = loadImage("hand.jpg");
  background(0);

}

void draw() {
//Create pixels index based on pixelSpace
  for (int x = 0; x < img.width; x += pixeSquare) {
    for (int y = 0; y < img.height; y += pixeSquare) {
      int loc = x + y*img.width;



       //RGB color in the source image
      loadPixels();
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      updatePixels();

      // Draw an square at that location with that color
      noStroke();
      fill(r, g, b);
      rect(x, y, pixeSquare, pixeSquare);
    }
  }
}
