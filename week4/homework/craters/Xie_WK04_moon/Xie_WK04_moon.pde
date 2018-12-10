
import peasy.*;

PeasyCam cam;
float x, y, z;
float radius =1737;

Table table;

boolean action = false;
int start;

//Create coords and circle list 
ArrayList <Coord> coords = new ArrayList<Coord>();

ArrayList<Circle> circles = new ArrayList<Circle>();
void setup() {
  
  //revolve cam
  size(900, 900, P3D);
  cam = new PeasyCam(this, 6000);
  //cam.setMinimumDistance(0.01);
  //cam.setMaximumDistance(100);


//Load table
  table= loadTable("moon_crater_coords_diameters.csv", "header");
  for (int i = 0; i<table.getRowCount(); i++) {
    //print(table.getString(i,0));
    float lat = table.getFloat(i, "lat");

    //print(table.getString(i,1));
    float lon = table.getFloat(i, "lon");


    float dia = table.getFloat(i, "dia");
//Add new items in coords list
    coords.add(new Coord(lat, lon, dia));

    //println(lat+","+lon);
  }
}


void draw() {
  background(0);
  
  //this list only contain lat and dia 
  //Not function like Vector class
  for (Coord coord : coords) {
    circles.add(new Circle(coord.lat, coord.lon, coord.dia));
  }
  
  for (Circle circle : circles) {
    circle.display();
  }
  //if(action == true && frameCount<start+241){
  //  saveFrame("frame/frames-###.png");
    
  //}
}

void keyPressed(){
  if (key==' '){
  action=!action;
  start = frameCount;
  }
}
