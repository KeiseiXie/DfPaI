PImage ascii;
int pixelSpace=30;
String [] words;
int nums =0;
int cx;
void setup() {
  ascii= loadImage("img.png");



  //Load string and split string
  String [] lines= loadStrings("txt.txt");
  String entiretxt=join(lines, " ");
  words = splitTokens(entiretxt, "?!,. ");


  size(640, 640);
  //image(ascii, 0, 0);
  ascii.resize(640, 0);
  image(ascii, 0, 0);
}

void draw() {
  //Create pixels index based on pixelSpace
  for (int x=0; x< width; x+=pixelSpace) {
    for (int y =0; y<height; y+=pixelSpace) {
      int index = x+y*width;


      loadPixels();
      float b = brightness(ascii.pixels[index]);

      updatePixels();
      
      //words
      if (b<100) {
        textSize(b/8);
        if (index<words.length) {
          cx=index;
        } else {
          cx= index%words.length;
        }
        text(words[cx], x, y);
        println(words[cx]);
      }
    }
  }
}
