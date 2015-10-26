class traceJ1 {
  int formatOrgnX;
  int formatOrgnY;
  int formatX=sizeX/3;
  int formatY=sizeY;
  int id;
  int taille=40;
  int x;
  int y;
  int r=255;
  int v;
  int b;
  traceJ1() {
  }

  void display() {
    if (id!=137) {
      if (id!=1) {
        strokeWeight(taille/4);
        stroke(r, v, b);
        // point(x, y);
        if (id+1!=137 && tracesJ1[id+1].x!=0 && tracesJ1[id+1].y !=0) {
          line(x, y, tracesJ1[id+1].x, tracesJ1[id+1].y);
        }
      } else {
        //strokeWeight(1);
        // stroke(couleur/2, 255/1.12+couleur,0);
        //rect(x-taille, y-taille,taille/2,taille/2);
      }
      if (x<formatOrgnX) {
        x=formatOrgnX;
      }
    }
  }
}
class traceJ2 {
  int formatOrgnX=sizeX/3*2;
  int formatOrgnY;
  int formatX=sizeX/3;
  int formatY=sizeY;
  int id;
  int taille=40;
  int x;
  int y;
  int r;
  int v=255;
  int b;
  traceJ2() {
  }

  void display() {
    if (id!=137) {
      if (id!=1) {
        strokeWeight(taille/4);
        stroke(r, v, b);
        // point(x, y);
        if (id+1!=137 && tracesJ2[id+1].x!=0 && tracesJ2[id+1].y !=0) {
          line(x, y, tracesJ2[id+1].x, tracesJ2[id+1].y);
        }
      } else {
        //strokeWeight(1);
        // stroke(couleur/2, 255/1.12+couleur,0);
        // rect(x-taille, y-taille,taille/2,taille/2);
      }
      if (x<formatOrgnX) {
        x=formatOrgnX;
      }
    }
  }
}
class traceFusion {
  int formatOrgnX=sizeX/3;
  int formatOrgnY;
  int formatX=sizeX/3;
  int formatY=sizeY;
  int id;
  int taille=40;
  int x;
  int y;
  int r;
  int v;
  int b;
  traceFusion() {
  }

  void display() {
    if (id!=J1 && id!=J2) {
      if (id!=137) {
        if (id!=0) {
          strokeWeight(taille/4);
          stroke(r, v, b);
          if (id+1!=137 && tracesFusion[id+1].x!=0 && tracesFusion[id+1].y !=0) {
            line(x, y, tracesFusion[id+1].x, tracesFusion[id+1].y);
          }
        }
      }
    }
  }
}

