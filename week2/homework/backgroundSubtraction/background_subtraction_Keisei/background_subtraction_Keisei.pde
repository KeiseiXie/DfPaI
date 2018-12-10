import gab.opencv.*;

import processing.video.*;

Capture captures;
OpenCV  opencv;
PImage backgroundImage;
float threshold = 20;
PImage bimage;

void setup() {
  size(320, 240);
  captures = new Capture(this, width, height);
  captures.start();
  opencv = new OpenCV(this, captures);
  //create an empty image the same size as the video
  backgroundImage = createImage(captures.width,captures.height,RGB);
  bimage = loadImage("background.jpg");
}

//difference between pixel
void draw() {
  if (captures.available()) {
    captures.read();
  }
  loadPixels();
  captures.loadPixels();
  backgroundImage.loadPixels();
  bimage.loadPixels();
  for (int x=0; x<width; x++) {
    for (int y =0; y<height; y++) {
      int index = x+ y*width;
      color fgColor = captures.pixels[index];
      color bgColor = backgroundImage.pixels[index];
      float r1 = red(fgColor);
      float g1 = green(fgColor);
      float b1 = blue(fgColor);
      float r2 = red(bgColor);
      float g2 = green(bgColor);
      float b2 = blue(bgColor);

      float diff = dist(r1, g1, b1, r2, g2, b2);
      color bimagecolor = bimage.pixels[index];

      if (diff>threshold) {
        pixels[index] = fgColor;
      } else {
        pixels[index] = bimagecolor;
      }
    }
  }
  updatePixels();
}


void keyPressed() {
  if (key == ' ') {
    backgroundImage.copy(captures, 0, 0, captures.width, captures.height, 0, 0, captures.width, captures.height);
    backgroundImage.updatePixels();
  }
}
