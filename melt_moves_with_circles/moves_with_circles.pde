


int sizeX=int(1600);
int sizeY=int(900);
int zoneX0=int(1600/3);
int zoneY0=int(900);
int a, b;

float test=0.1  ; 
float rayon=zoneX0/3;
int test2=int(zoneY0/100);
float max_proxi_mouse;
boolean hautJ1;
boolean basJ1;
boolean droiteJ1;
boolean gaucheJ1;
boolean hautJ2;
boolean basJ2;
boolean droiteJ2;
boolean gaucheJ2;
int n_point;
float _x_draw1;
float _y_draw1;
float _x_draw2;
float _y_draw2;
boolean J1_new_point, J2_new_point;
boolean J1_actif() {
  return(hautJ1==true || basJ1==true || droiteJ1==true || gaucheJ1==true || hautJ2==true || basJ2==true || droiteJ2==true || gaucheJ2==true);
};
boolean J2_actif() {
  return(hautJ1==true || basJ1==true || droiteJ1==true || gaucheJ1==true || hautJ2==true || basJ2==true || droiteJ2==true || gaucheJ2==true);
};
boolean new_fusion_point_cond() {
  return(J1_new_point==true && J2_new_point==true);
};




class Fusion_point
{
  int id ;
  int age ;
  float _x;
  float _y;
  Fusion_point(float x, float y) {

    _x = x;
    _y = y;
  }
  void draw() {
    
    age++;
  }
}

ArrayList<Cercle_maker> Cercle_makers = new ArrayList<Cercle_maker>();
ArrayList<Fusion_point> Fusion_points = new ArrayList<Fusion_point>();
void new_fusion_point() {
  if (new_fusion_point_cond()) {

    Fusion_point Fusion_point=new Fusion_point((_x_draw1+_x_draw2)/2, (_y_draw1+_y_draw2)/2);
    _x_draw1=0;
    _y_draw1=0;
    _x_draw2=0;
    _y_draw2=0;
    Fusion_points.add(Fusion_point);
    Fusion_points.get(Fusion_points.size()-1).id=Fusion_points.size()-1;
    Fusion_points.get(Fusion_points.size()-1).age=0;
    n_point++;
    J1_new_point=false;
    J2_new_point=false;
  }
}

void setup() {
  size(1600, 900);
  for (int i = 0; i < 0; i ++) {
    test=test-0.01;
  }
  for (int i = 0; i < 2; i ++) {
    Cercle_maker Cercle_maker=new Cercle_maker(zoneX0/2, zoneY0/2);
    Cercle_makers.add(Cercle_maker);
  }
  Cercle_makers.get(1)._xBase=Cercle_makers.get(1)._xBase+zoneX0*2;
}

void draw() {

  background(255);

  for (int i = 0; i < Cercle_makers.size (); i++) { 
    Cercle_makers.get(i).id=i;
    Cercle_makers.get(i).draw();
  }
  for (int i = 0; i < Fusion_points.size (); i++) { 
    Fusion_points.get(i).draw();
    if ( Fusion_points.get(i).age>2550) {
      Fusion_points.remove(i);
    }
    if (i>0) {
      stroke(255/2+Fusion_points.get(i).age/20);
      strokeWeight(9-Fusion_points.get(i).age/300);
      if (i-1!=0) {
        line(Fusion_points.get(i-1)._x, Fusion_points.get(i-1)._y, Fusion_points.get(i)._x, Fusion_points.get(i)._y);
      }
    }
  }
  new_fusion_point();
  fill(255/1.33);
  textSize(sizeY/40);
  if(a==0){
  save(b+".png");
  b++;
  }
  a++;
  if(a>12){
    a=0;
  }
  text("Help: ZQSD to use the cursor on the left and the arrows keys to the one on the right. FPS : "+int(frameRate), sizeX/160, sizeY/35 );
}
void keyPressed() {
  if (keyCode==UP) {

    hautJ2=true;
  }
  if (keyCode==DOWN) {

    basJ2=true;
  }
  if (keyCode==RIGHT) {

    droiteJ2=true;
  }
  if (keyCode==LEFT) {

    gaucheJ2=true;
  }
  if (key=='z') {

    hautJ1=true;
  }
  if (key=='s') {

    basJ1=true;
  }
  if (key=='d') {

    droiteJ1=true;
  }
  if (key=='q') {

    gaucheJ1=true;
  }
}
void keyReleased() {
  if (keyCode==UP) {

    hautJ2=false;
  }
  if (keyCode==DOWN) {

    basJ2=false;
  }
  if (keyCode==RIGHT) {

    droiteJ2=false;
  }
  if (keyCode==LEFT) {

    gaucheJ2=false;
  }
  if (key=='z') {

    hautJ1=false;
  }
  if (key=='s') {

    basJ1=false;
  }
  if (key=='d') {

    droiteJ1=false;
  }
  if (key=='q') {

    gaucheJ1=false;
  }
}