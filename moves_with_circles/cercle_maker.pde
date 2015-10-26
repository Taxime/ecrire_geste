class Cercle_maker

{
  int pt_select;

  int id;
  // float nb_Cercle_points= 10;
  float _x, _y;
  float _xBase, _yBase;
  float angle = 0.0;
  float angle_stepsize = test;
  Cercle_maker(float x, float y) {

    _xBase = x;
    _yBase = y;
  }
  void calc() {
    max_proxi_mouse=0;
    for ( int i = 0; i < Cercle_points.size (); i ++ ) {
      if (Cercle_points.get(i).proxi_mouse>max_proxi_mouse) {
        max_proxi_mouse=Cercle_points.get(i).proxi_mouse;
      }
      if (Cercle_points.get(i).select()) {
        pt_select=i;
      }
    }
  }

  class Draw_point
  {
    int id;
    int J;
    int age;
    float _x;
    float _y;
    Draw_point(float x, float y) {

      _x = x;
      _y = y;
    }
    
   void draw(){
      for (int i = 0; i < Draw_points.size (); i++) { 
      if (Draw_points.get(i)._x==_x && Draw_points.get(i)._y==_y && Draw_points.get(i).id != id ) {
        Draw_points.remove(i);
      }
      //
      
      // _y=_y+0.1;
    }
      
    }

  }

  class Pointe {
    float _x;
    float _y;
    float distance_cursorX;
    float distance_cursorY;
    float proxi_mouse;
    float Weight;
    int r;
    void distance_mouse_calcul() {
      if (cursor._x>_x) {
        distance_cursorX=distance_cursorX-_x;
      } else {
        distance_cursorX=_x-cursor._x;
      }
      if (cursor._y>_y) {
        distance_cursorY=cursor._y-_y;
      } else {
        distance_cursorY=_y-cursor._y;
      }
      proxi_mouse=zoneY0/3-( distance_cursorY+distance_cursorX);
      if (proxi_mouse<0) {
        proxi_mouse=zoneY0/150;
      }
    }
    void draw() {
      distance_mouse_calcul();
      _x=Cercle_points.get(pt_select)._x;
      _y=Cercle_points.get(pt_select)._y;
      if (J1_actif()) {
        r=r+8;
      } else {
        r=r-8;
      }
      if (r<0) {
        r=0;
      }
      if (r>255) {
        r=255;
      }

      Weight=Cercle_points.get(pt_select).Weight;
      if (Cercle_points.get(pt_select).Weight>sizeY/18) {
        stroke(255, 215-r, 215-r, r/3);
        strokeWeight(Weight);
        point(_x, _y);
      } else {

        stroke( 255, 255-r/2, 255-r/2, r/3);
        strokeWeight(Weight);
        point(_x, _y);
      }
    }
  }
  class Cercle_point {
    float Weight;
    int id;
    float _x;
    float _y;
    float distance_cursorX;
    float distance_cursorY;
    float proxi_mouse;
    Cercle_point(float x, float y) {
      _x = x;
      _y = y;
    }

    boolean select() {
      return(proxi_mouse==max_proxi_mouse);
    }
    void distance_mouse_calcul() {

      if (cursor._x>_x) {
        distance_cursorX=cursor._x-_x;
      } else {
        distance_cursorX=_x-cursor._x;
      }
      if (cursor._y>_y) {
        distance_cursorY=cursor._y-_y;
      } else {
        distance_cursorY=_y-cursor._y;
      }
      proxi_mouse=zoneY0/3-( distance_cursorY+distance_cursorX);
      if (proxi_mouse<0) {
        proxi_mouse=zoneY0/150;
      }
    }

    void draw() {

      distance_mouse_calcul();
    }
    void display() {
      Weight=proxi_mouse/4;
      strokeWeight(Weight);  
      stroke(230+ proxi_mouse, 255-proxi_mouse/4, 255-proxi_mouse/4, proxi_mouse);

      point(_x, _y);
    }
  }
  // go through all angles from 0 to 2 * PI radians

  class Cursor {
    int id;
    float _x=sizeX/2;
    float _y=sizeY/2;
    float speed_x;
    float speed_y;
    float speed_length;
    float speed_angle;




    void control_mouvementJ1() {
      if (hautJ1==true) {
        _y=_y-2.75;
      }
      if (basJ1==true) {
        _y=_y+2.75;
      }
      if (droiteJ1==true) {
        _x=_x+2.75;
      }
      if (gaucheJ1==true) {
        _x=_x-2.75;
      }
      if (Cercle_points.get(pt_select).Weight>sizeY/18) {
        Draw_point Draw_point=new Draw_point(Cercle_points.get(pt_select)._x, Cercle_points.get(pt_select)._y);
        _x_draw1=Cercle_points.get(pt_select)._x;
        _y_draw1=Cercle_points.get(pt_select)._y;
        Draw_points.add(Draw_point);
        Draw_points.get(Draw_points.size()-1).J=1;
        Draw_points.get(Draw_points.size()-1).id=Draw_points.size()-1;
        J1_new_point=true;
      }
    }
    void control_mouvementJ2() {
      if (hautJ2==true) {
        _y=_y-2.75;
      }
      if (basJ2==true) {
        _y=_y+2.75;
      }
      if (droiteJ2==true) {

        _x=_x+2.75;
      }
      if (gaucheJ2==true) {
        _x=_x-2.75;
      }
      if (Cercle_points.get(pt_select).Weight>sizeY/18) {
        Draw_point Draw_point=new Draw_point(Cercle_points.get(pt_select)._x, Cercle_points.get(pt_select)._y);
        _x_draw2=Cercle_points.get(pt_select)._x;
        _y_draw2=Cercle_points.get(pt_select)._y;
        Draw_points.add(Draw_point);
        Draw_points.get(Draw_points.size()-1).J=2;
        J2_new_point=true;
      }
    }

    void draw() {

      if (_x>Cercle_points.get(pt_select)._x) {

        _x=_x-2;
      }
      if (_y>Cercle_points.get(pt_select)._y) {

        _y=_y-2;
      }
      if (_x<Cercle_points.get(pt_select)._x) {

        _x=_x+2;
      }
      if (_y<Cercle_points.get(pt_select)._y) {

        _y=_y+2;
      }

      stroke(255/2);
      strokeWeight(sizeY/250);
      if (id==0) {
        control_mouvementJ1();
      } else {
        control_mouvementJ2();
      }
      line(_x, _y-15, _x, _y+15);
      line(_x-15, _y, _x+15, _y);
    }
  }


  ArrayList<Cercle_point> Cercle_points = new ArrayList<Cercle_point>();
  ArrayList<Draw_point> Draw_points = new ArrayList<Draw_point>();
  Pointe pointe= new Pointe();
  Cursor cursor= new Cursor();

  void  draw() {  
    cursor.id=id;
    calc();
    for (int i = 0; i < Cercle_points.size (); i++) { 
      Cercle_points.remove(i);
    }

    angle = 0.0;
    angle_stepsize = test;
    while (angle < 2 * PI)
    {
      // calculate x, y from a vector with known length and angle
      _x = int(rayon * cos (angle));
      _y = int(rayon * sin (angle));
      _x=_x+_xBase;
      _y=_y+_yBase;
      Cercle_point Cercle_point=new Cercle_point(_x, _y);
      Cercle_points.add(Cercle_point);
      angle += angle_stepsize;
    }

    for (int i = 0; i < Cercle_points.size (); i++) { 
      Cercle_points.get(i).id=i;
      Cercle_points.get(i).draw();
    }
    strokeWeight(Cercle_points.get(pt_select).proxi_mouse/8);
    stroke(230, 255, 255);
    fill(Cercle_points.get(pt_select).proxi_mouse/4+255/1.25);
    ellipse(_xBase, _yBase, rayon*2, rayon*2);
    for (int i = 0; i < Cercle_points.size (); i++) { 
      Cercle_points.get(i).display();
    }
    for (int i = 0; i < Draw_points.size (); i++) { 
      Draw_points.get(i).id=i;
      /* if (i>2) {
       strokeWeight(sizeY/200);
       stroke(255, 255/2+Draw_points.get(i-1).age/2, 255/2+Draw_points.get(i-1).age/2);
       line( Draw_points.get(i)._x, Draw_points.get(i)._y, Draw_points.get(i-1)._x, Draw_points.get(i-1)._y);
       }*/
    }
    pointe.draw();
    cursor.draw();
  }
}

