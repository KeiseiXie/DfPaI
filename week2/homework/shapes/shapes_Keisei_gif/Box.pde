class Box {
  float boxSize = 8.0;
  float amt, vel;
  PVector pos;

  Box() {
    vel = random(0.001);
    amt = random(1);  // box's position should be between start and end point
  }

  void update(PVector begin, PVector end) {
    float x = lerp(begin.x, end.x, amt);
    float y = lerp(begin.y, end.y, amt);
    float z = lerp(begin.z, end.z, amt);

    pos = new PVector(x, y, z);
    amt += vel;
    if (amt > 1) {
      amt = 0;
    }
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    scale(1/sin(frameCount*0.01));  // fix box's size
    box(boxSize);
    popMatrix();
  }
}
