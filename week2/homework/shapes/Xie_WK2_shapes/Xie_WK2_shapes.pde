ArrayList<Box> boxes = new ArrayList<Box>();
int boxesPerLine = 30;

ArrayList<Line> linesInIcosahedron = new ArrayList<Line>();
final float goldenratio = (1.0 + sqrt(5))/2;  // golden ratio

ArrayList<Line> linesInCube = new ArrayList<Line>();
float cubeSideLength = 500;
float ilength = 200;  //icosahedron's triagle line's length

boolean action = false;
int start;

void setup() {
  size(900, 900, P3D);
  noStroke();
  fill(250, 50);
  blendMode(ADD);

  // Create a Cube with Lines
  PVector p1 = new PVector(-cubeSideLength/2, -cubeSideLength/2, cubeSideLength/2);
  PVector p2 = new PVector(cubeSideLength/2, -cubeSideLength/2, cubeSideLength/2);
  PVector p3 = new PVector(cubeSideLength/2, -cubeSideLength/2, -cubeSideLength/2);
  PVector p4 = new PVector(-cubeSideLength/2, -cubeSideLength/2, -cubeSideLength/2);
  PVector p5 = new PVector(-cubeSideLength/2, cubeSideLength/2, cubeSideLength/2);
  PVector p6 = new PVector(cubeSideLength/2, cubeSideLength/2, cubeSideLength/2);
  PVector p7 = new PVector(cubeSideLength/2, cubeSideLength/2, -cubeSideLength/2);
  PVector p8 = new PVector(-cubeSideLength/2, cubeSideLength/2, -cubeSideLength/2);
  linesInCube.add(new Line(p1, p2));
  linesInCube.add(new Line(p2, p3));
  linesInCube.add(new Line(p3, p4));
  linesInCube.add(new Line(p4, p1));
  linesInCube.add(new Line(p1, p5));
  linesInCube.add(new Line(p2, p6));
  linesInCube.add(new Line(p3, p7));
  linesInCube.add(new Line(p4, p8));
  linesInCube.add(new Line(p5, p6));
  linesInCube.add(new Line(p6, p7));
  linesInCube.add(new Line(p7, p8));
  linesInCube.add(new Line(p8, p5));

  //  Icosahededron  from Wiki 
  PVector[] vertexIndices = {
    new PVector(ilength*goldenratio, 0, ilength), new PVector(ilength*goldenratio, 0, -ilength), new PVector(-ilength*goldenratio, 0, -ilength), new PVector(-ilength*goldenratio, 0, ilength), // X 
    new PVector(ilength, ilength*goldenratio, 0), new PVector(-ilength, ilength*goldenratio, 0), new PVector(-ilength, -ilength*goldenratio, 0), new PVector(ilength, -ilength*goldenratio, 0), // Y 
    new PVector(0, ilength, ilength*goldenratio), new PVector(0, -ilength, ilength*goldenratio), new PVector(0, -ilength, -ilength*goldenratio), new PVector(0, ilength, -ilength*goldenratio)  // Z 
  };

  for (int i=0; i<vertexIndices.length; i++) {
    PVector tgt = vertexIndices[i];

    // Check distance and draw line
    for (int j=i+1; j<vertexIndices.length; j++) {
      PVector cmp = vertexIndices[j];
      float dist = PVector.dist(tgt, cmp);
      if (int(dist) == int(ilength*2)) {
        linesInIcosahedron.add(new Line(tgt, cmp));
      }
    }
  }
}




void draw() {
  background(30);

  translate(width / 2, height / 2, -500);
  rotateX(frameCount*0.003);
  rotateY(frameCount*0.003);
  scale(sin(frameCount*0.01));  // scale whole

  if (sin(frameCount*0.01) > sin(PI)) {
     //icosahedron 
    for (Line l : linesInIcosahedron) {
      l.draw();
    }
  } else {
     // cube
    for (Line l : linesInCube) {
      l.draw();
    }
  }
  //if(action == true && frameCount<start+241){
  //  saveFrame("frame/frames-###.png");
    
  //}
}

void mousePressed(){
  action=!action;
  start = frameCount;
  
}
