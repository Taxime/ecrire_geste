

int nbComp=6;
int nbPtComp=255/2/nbComp;
int[] ptX= new int[nbPtComp*nbComp];
int[] ptY= new int[nbPtComp*nbComp];

int[]ptCle= new int [nbComp];

int[] vitesseX = new int[ptCle.length];
int[] vitesseY = new int[ptCle.length];

int botX;
int botY;

int sizeX=1200;
int sizeY=800;

int k ;

//human
int nbPoints=ptX.length;
int[] x= new int[nbPoints];
int[] y= new int[nbPoints];
int temps;
boolean trace;
// Fusion
int[] xFusion= new int[nbPoints];
int[] yFusion= new int[nbPoints];

float graisse;

// Type

int corpsOrgnX=100;
int corpsOrgnY=100;
int corpsLargeur=200;
int corpsHauteur=400;

void setup() {
  noSmooth();
  strokeWeight(3);
  size(sizeX, sizeY); 

  println(ptX);
}

void draw() {
  background(255);

  displayTraceBot();
  //human
  if (trace==false) {
    for (int i =0; i<nbPoints; i++) {
      x[i]=mouseX;
      y[i]=mouseY;
    }
  }
  if (mousePressed) {
    if (temps<nbPoints) {
      traceHuman();
    }
  }
  displayTrace();
  //fusion
  traceFusion();
  displayTraceFusion();
 // regleA();
   fill(255/2);
  textSize(18);
  text("ENTER = tracé ordinateur | MOUSE = tracé utilisateur",30,30);
}

void initPtCle() {
  for ( int i = 0; i <ptCle.length; i ++ ) {
    ptCle[i]=ptX.length/nbComp*i;
  }
  for ( int i = 0; i <ptCle.length; i ++ ) {
    ptX[ptCle[i]]=int(random(corpsOrgnX, corpsOrgnX+corpsLargeur));
    ptY[ptCle[i]]=int(random(corpsOrgnY, corpsOrgnY+corpsHauteur));
  }
}

void initVitesse() {
  for ( int i = 0; i <vitesseX.length; i ++ ) {
    if (i<vitesseX.length-1) {
      if (ptX[ptCle[i]]>ptX[ptCle[i+1]]) {
        vitesseX[i]=(ptX[ptCle[i]]-ptX[ptCle[i+1]])/nbPtComp;
      } else {
        vitesseX[i]=(ptX[ptCle[i+1]]-ptX[ptCle[i]])/nbPtComp;
      }
      if (ptY[ptCle[i]]>ptY[ptCle[i+1]]) {
        vitesseY[i]=(ptY[ptCle[i]]-ptY[ptCle[i+1]])/nbPtComp;
      } else {
        vitesseY[i]=(ptY[ptCle[i+1]]-ptY[ptCle[i]])/nbPtComp;
      }
    }
  }
}

void traceBot() {
  k=0;
  for ( int i = 0; i <ptCle.length; i ++ ) {
    botX=ptX[ptCle[i]];
    for ( int j = 0; j <nbPtComp; j ++ ) {
      if (i<ptCle.length-1) {
        if (botX<ptX[ptCle[i+1]]) {
          botX=botX+vitesseX[i];
        } else {
          botX=botX-vitesseX[i];
        }
        if (botY<ptY[ptCle[i+1]]) {
          botY=botY+vitesseY[i];
        } else {
          botY=botY-vitesseY[i];
        }
        ptX[k]=botX;
        ptY[k]=botY;
        k++;
      } else {

        if (botX<ptX[ptCle[i]]) {
          botX=botX+vitesseX[i];
        } else {
          botX=botX-vitesseX[i];
        }
        if (botY<ptY[ptCle[i]]) {
          botY=botY+vitesseY[i];
        } else {
          botY=botY-vitesseY[i];
        }
        ptX[k]=botX;
        ptY[k]=botY;
        k++;
      }
    }
  }
}
void displayTraceBot() {
  graisse=0;
  stroke(255, 0, 0);
  for ( int i = 0; i <ptX.length-1; i ++ ) {
    strokeWeight(graisse);
    line(ptX[i], ptY[i], ptX[i+1], ptY[i+1]);
    graisse=graisse+0.1;
  }
}

void keyPressed() {

  if (keyCode==ENTER) {
    initPtCle();
    initVitesse();
    traceBot();
  }
  if (key==' ') {
    saveFrame();
  }
}
//human
void displayTrace() {
  graisse=0;
  for (int i =0; i<nbPoints-1; i++) {
    stroke(0, 0, 255);
    strokeWeight(graisse);
    line(x[i], y[i], x[i+1], y[i+1]);
    graisse=graisse+0.5;
  }
}

void traceHuman() {
  trace=true;
  x[temps]=mouseX;
  y[temps]=mouseY;
  temps++;
}


void mouseReleased() {
  temps=0;
}

//Fusion
void displayTraceFusion() {
  graisse=0;
  for (int i =0; i<nbPoints-1; i++) {
    stroke(255, 0, 255);
    if (xFusion[i]!=0||yFusion[i]!=0) {
      strokeWeight(graisse);
      line(xFusion[i], yFusion[i], xFusion[i+1], yFusion[i+1]);
      graisse=graisse+0.25;
    }
  }
}
void traceFusion() {
  for (int i =0; i<nbPoints; i++) {

    if (ptX[i]!=0 || x[i]!=0 || ptY[i]!=0 || y[i]!=0) {
      xFusion[i]=int(((ptX[i]*1.5)+(x[i]/3))/1.25);
      yFusion[i]=int(((ptY[i]*1.5)+(y[i]/3))/1.25);
    }
  }
}

//Regles

//A
void regleA() {
  ptX[ptCle[1]]=corpsOrgnX;
  ptY[ptCle[2]]=corpsOrgnY+corpsHauteur;
  ptY[ptCle[2]]=corpsOrgnY;
  ptX[ptCle[2]]=corpsOrgnX+(corpsLargeur/2);
  ptX[ptCle[3]]=corpsOrgnX+corpsLargeur;
  ptY[ptCle[3]]=corpsOrgnY+corpsHauteur;

  
  if (ptY[ptCle[5]]!=int(corpsOrgnY+(corpsHauteur/2.5))) {
    ptY[ptCle[5]]=int(corpsOrgnY+(corpsHauteur/2.5));
  }
  if (ptY[ptCle[4]]!=ptY[ptCle[5]]) {
    ptY[ptCle[4]]=ptY[ptCle[5]];
  }
  if(ptX[ptCle[5]]>ptX[ptCle[2]]-(corpsLargeur/4)){
    ptX[ptCle[5]]--;
  }
  if(ptX[ptCle[4]]<ptX[ptCle[2]]+(corpsLargeur/4)){
    ptX[ptCle[5]]++;
  }
}

