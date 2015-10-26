import processing.pdf.*;

int memoire=138;
int sizeX=1280;
int sizeY=768;
int J1;
int J2;
int a;

boolean hautJ1;
boolean basJ1;
boolean gaucheJ1;
boolean droiteJ1;

boolean tempsTraceJ1=true;
boolean tempsTraceJ2=true;
boolean visuLine;

traceJ1[] tracesJ1 = new traceJ1[memoire];
traceJ2[] tracesJ2 = new traceJ2[memoire];
traceFusion[] tracesFusion = new traceFusion[memoire];

void setup() {
  for (int i=0; i<memoire; i++) { 
    tracesJ1[i] = new traceJ1();
    tracesJ2[i] = new traceJ2();
    tracesFusion[i] = new traceFusion();
    tracesJ1[i].id=i;
    tracesJ2[i].id=i;
    tracesFusion[i].id=i;
  }
  size(1280, 768);
}

void draw() {

  background(255);
  noFill(); 
  stroke(255/1.03);
  strokeWeight(2);
  rect(0, 0, sizeX/3, sizeY);
  rect(sizeX/3, 0, sizeX/3, sizeY);
  rect(sizeX/3*2, 0, sizeX/3, sizeY);

  if (mouseX>tracesJ1[0].formatOrgnX && mouseX<tracesJ1[0].formatX) {
    if ( tempsTraceJ1=true) {
      dessinJ1();
    }
  }

  if (mouseX>sizeX/3*2 && mouseX<sizeX) {
    if ( tempsTraceJ2=true) {
      dessinJ2();
    }
  }


  for (int i=0; i<memoire; i++) { 
    if (tracesJ1[i].x!=0 && tracesJ1[i].y!=0) {
      tracesJ1[i].display();
    }
    if (tracesJ2[i].x!=0 && tracesJ2[i].y!=0) {
      tracesJ2[i].display();
    }
    if (tracesJ2[i].x!=0 && tracesJ2[i].y!=0 && tracesJ1[i].x!=0 && tracesJ1[i].y!=0) {
      tracesFusion[i].display();
    }
  }
  fusion();
  //println(visuLine);
  println(J2);
  if (visuLine==true) {

    visuFusion();
  }
  //  fill(255/1.1875,250);
  //rect(tracesJ1[0].formatOrgnX,tracesJ2[0].formatOrgnY,137,35);
  //    fill(255,250);
  //  text("TIME:"+J1,tracesJ1[0].formatOrgnX,tracesJ2[0].formatOrgnY,tracesJ1[0].formatX,tracesJ1[0].formatY);
  fill(255/2);
  textSize(12);
  text("Une fois l'un des tracés fixé, modifier l'autre pour retravailler le premier", 20, 20);
}