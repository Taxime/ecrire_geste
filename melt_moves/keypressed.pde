void keyPressed() {
  if (visuLine==false) {
    if (key==' ') {

      visuLine=true;
    }
  } else {
    if (key==' ') {

      visuLine=false;
    }
  }
  if ( keyCode==ENTER ) {
    beginRecord(PDF, "frame"+a+".pdf");
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
    if (visuLine==true) {

    visuFusion();
  }
    endRecord();
    a++;
  }
}