class Triangle {
  float x;
  float y;
  float radius = 20;

  Triangle(float Tempx, float Tempy) {
    x = Tempx;
    y = Tempy;
  }
  
  //function atan2
  void display() {
   
    pushMatrix();
    translate(x, y);
    float a = atan2(mouseY-y, mouseX-x);
    rotate(a);

    fill(255);
    ellipse(0, 0, radius, radius);
    fill(255, 0, 0);
    triangle(6, 0, -3, 3, -3, -3);
    line(0, 0, radius/2, 0);


    popMatrix();
  }
  

}
