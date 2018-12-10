class Circle {
  float dia;
  float lat;
  float lon;
  float x, y, z;
  
  //moon radius km
  float radius =1737;
  Circle(float _lat, float _lon, float _dia) {
    dia= _dia;
    lat= radians(_lat);
    lon= radians(_lon);
    
    //each circle positon on the moon
    x=radius*cos(lat)*sin(lon);
    y=radius*cos(lat)*cos(lon);
    z=radius*sin(lat);
    
    
  }
  void display() {
    pushMatrix();

    translate(x, y, z);
    //Subtraction lon and lat to make sure the right angle
    rotateZ(HALF_PI-lon);
    rotateY(HALF_PI-lat);
    noFill();
    ellipse(0, 0, dia, dia);
    popMatrix();
  }
}
