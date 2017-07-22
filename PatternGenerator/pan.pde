
void pan() {

  translate(xPan, yPan);
  //re-adjusts visualization
  if ( createPDF.hover() || setDistance.isSliderActive() || setSpikeWidth.isSliderActive() || setRatio.isSliderActive() || setOffset.isSliderActive()) {
    //nothing
  } else {




    //if mouse is clicked, updates the values
    //(this could be cleaned up)
    if (mousePressed) {
      if (ready == true);
      {

        xPan = oldx + mouseX - xCurrent; 
        yPan = oldy + mouseY - yCurrent;
      }
    } else {
      ready = false;
    }
  }
}


// functions for dynamic visualization:
void mousePressed() {
  //another hack, because I can't think right now

  xCurrent=mouseX;
  yCurrent=mouseY;
  oldx = xPan;
  oldy = yPan;

  ready = true;
}