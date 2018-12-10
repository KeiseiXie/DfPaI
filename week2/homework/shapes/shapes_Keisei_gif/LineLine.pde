class Line {
  PVector start, end;
  Box[] boxes= new Box[boxesPerLine];

  Line(PVector begin, PVector end) {
    this.start = new PVector(begin.x, begin.y, begin.z);
    this.end = new PVector(end.x, end.y, end.z);

    // setup boxes
    for (int i=0; i<boxes.length; i++) {
      boxes[i] = new Box();
    }
  }

  void draw() {
    for (Box b : boxes) {
      b.update(start, end);
      b.draw();
    }
  }
}
