void fusion() {
  for (int i=0; i<memoire; i++) { 
    tracesFusion[i].x=(tracesJ1[i].x+tracesJ2[i].x)/2;
    tracesFusion[i].y=(tracesJ1[i].y+tracesJ2[i].y)/2;
    tracesFusion[i].r=(tracesJ1[i].r+tracesJ2[i].r)/2;
    tracesFusion[i].v=(tracesJ1[i].v+tracesJ2[i].v)/2;
    tracesFusion[i].b=(tracesJ1[i].b+tracesJ2[i].b)/2;
  }
}

void visuFusion() {
  for (int i=0; i<memoire; i++) { 
    strokeWeight(1);
    stroke(0,0,255);
   line( tracesJ1[i].x,tracesJ1[i].y,tracesFusion[i].x,tracesFusion[i].y );
   stroke(255,0,0);
line( tracesJ2[i].x,tracesJ2[i].y,tracesFusion[i].x,tracesFusion[i].y );
  }
}

void dessinJ2() {
  if (mousePressed) {
    J1=0;
    if (J2>memoire-1) {
      tempsTraceJ2=false;
    }
        if (J2<memoire-1) {
      J2++;
    }
    tracesJ2[J2].x=mouseX;
    tracesJ2[J2].y=mouseY;
   tracesJ2[J2].b=J2*4;
  }
}

void dessinJ1() {
  if (mousePressed) {

    J2=0;
    if (J1>memoire-1) {
      tempsTraceJ1=false;
    }
    if (J1<memoire-1) {
      J1++;
    }
    tracesJ1[J1].x=mouseX;
    tracesJ1[J1].y=mouseY;
    tracesJ1[J1].b=J1*4;
  }
}


