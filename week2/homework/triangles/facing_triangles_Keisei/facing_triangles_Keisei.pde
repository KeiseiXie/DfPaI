Triangle[] triangles = new Triangle [25];
float numsSpace =100;



//create triangle
void setup() {
  size(640, 360);
  for (int x =0; x<5; x++) {
    for (int y=0; y<5; y++) {
      triangles[x+y*5] = new Triangle (x*numsSpace+numsSpace, y*numsSpace+numsSpace);
    }
  }
}

void draw() {
  //background(255);
  fill(0, 5);
  rect(0, 0, width, height);
  
  for (int i =0; i<triangles.length; i++) {
    triangles[i].display();
  }
}
