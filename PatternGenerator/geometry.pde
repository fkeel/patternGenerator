
//this could be organized better.
//I compartmentalized different parts of the strip, so my brain hurts less
//Instead of a stripA and stripB type, I would prefer a generic strip object that just gets offset
//Such a generalized strip could also be set to a specific size, independently of spikeWidth as is done now


void drawFirstSpikeLeftA() {
  //no spike, just a diagonal line
  line (0, 0, -effectiveXoffset, 0);
  line (-effectiveXoffset, 0, 0, globalOffset);
  translate(0, globalOffset);
}

void drawFirstSpikeLeftB() {
  //extra spike
  line (0, 0, -effectiveSpikeHeight+effectiveXoffset, 0);
  line (-effectiveSpikeHeight+effectiveXoffset, 0, -effectiveSpikeHeight, globalOffset);
  line (  -effectiveSpikeHeight, globalOffset, 0, effectiveSpikeWidth/2+globalOffset);
  translate(0, effectiveSpikeWidth/2+globalOffset);
  stroke(0);
}

void drawSpikeRowLeft() {
  //series of triangles
  for (float i = 0; i < spikeCount-1; i++) {
    line(0, 0, -effectiveSpikeHeight, effectiveSpikeWidth/2);
    line(-effectiveSpikeHeight, effectiveSpikeWidth/2, 0, effectiveSpikeWidth);
    translate(0, effectiveSpikeWidth);
  }
}

void drawBeginningLeft() {
  //maybe this should be set to be thicker? not divide widht by 2 (which is logical, but not practical)
  //
  translate(-20, 0);
  for (float i = 0; i < spikeCount; i++) {
    if (i == 0) {
      line(0, 0, 0, effectiveSpikeWidth);
      line(0, 0, 20,0 );
      translate(0, effectiveSpikeWidth);
    } else {
      line(0, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    }
  }
  line(0, 0, effectiveBlockWIdth+20, 0);
}

void drawLastSpikeLeftA() {
  //last spike, right side
  line(0, 0, -effectiveSpikeHeight, effectiveSpikeWidth/2);
  line(-effectiveSpikeHeight, effectiveSpikeWidth/2, -effectiveXoffset, effectiveSpikeWidth-globalOffset);
  line (-effectiveXoffset, effectiveSpikeWidth-globalOffset, effectiveBlockWIdth, effectiveSpikeWidth-globalOffset);
}

void drawLastSpikeLeftB() {
  line(0, 0, -effectiveSpikeHeight+effectiveXoffset, effectiveSpikeWidth/2-globalOffset);
  line(-effectiveSpikeHeight+effectiveXoffset, effectiveSpikeWidth/2-globalOffset, 0, effectiveSpikeWidth/2-globalOffset);
  //closeshapeAtbottom
  line(0, effectiveSpikeWidth/2-globalOffset, effectiveBlockWIdth, effectiveSpikeWidth/2-globalOffset);
}

void closeTop(int multiplier) { //this also draws the breakouts
  //top border of block:
  line (effectiveBlockWIdth+effectiveXoffset, 0, effectiveBlockWIdth+effectiveXoffset, -(15+distance)*multiplier);
 // stroke(255,0,0);
  line (0, 0, 0, -(15+distance)*(multiplier-1)-distance);
  pushMatrix();
  translate(effectiveBlockWIdth, -(15+distance)*multiplier);
  line(0+effectiveXoffset, 0, -15+(-spacing*multiplier), 0);
  line(-effectiveBlockWIdth, 15, -15+(-spacing*multiplier), 15);
  line(-15+(-spacing*multiplier), 0, -15+(-spacing*multiplier), 15);
  popMatrix();
}

void drawFirstSpikeRightA() {
  //first spike, right side
  translate(effectiveBlockWIdth, 0);
 // line (0, 0, effectiveXoffset, 0);
 //stroke(0,0,255);
  line (effectiveXoffset, 0, 0, globalOffset);
  breakOutVariable = effectiveXoffset;
  println("xOffset" + effectiveXoffset);
  println("globalOffset" + globalOffset);
 stroke(00);
  //going down, right side
  translate(0, globalOffset);
}

void drawFirstSpikeRightB() {
 // rect(0,0,5,5);
  translate(effectiveBlockWIdth, 0);
 // rect(0,0,10,10);
 //  stroke(200, 50, 50);
   //strokeWeight(5);
 line (breakOutVariable, 0, effectiveSpikeHeight, 0);
 //strokeWeight(1);
  //line(0, 0, effectiveSpikeHeight, effectiveSpikeWidth/2);
  line(effectiveSpikeHeight, globalOffset, 0, effectiveSpikeWidth/2+globalOffset);

  //first spike, right side
  stroke(0);

  //going down, right side
  translate(0, effectiveSpikeWidth/2+globalOffset);
}

void drawSpikeRowRight() {
  for (float i = 0; i < spikeCount-1; i++) {
    line(0, 0, effectiveSpikeHeight, effectiveSpikeWidth/2);
    line(effectiveSpikeHeight, effectiveSpikeWidth/2, 0, effectiveSpikeWidth);
    translate(0, effectiveSpikeWidth);
  }
}

void drawEndRight() {
  translate(effectiveBlockWIdth+20, 0);
  for (float i = 0; i < spikeCount; i++) {
    if (i == 0) {
      line(0+breakOutVariable-20, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    } else {
      line(0, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    }
  }

  line(0, 0, -20, 0);
 
}

void drawLastSpikeRightA() {
  //again, I think this should be thicker. Its logical but unpractical
  line(0, 0, effectiveSpikeHeight, effectiveSpikeWidth/2);
  line(effectiveSpikeHeight, effectiveSpikeWidth/2, effectiveXoffset, effectiveSpikeWidth-globalOffset);
  line (effectiveXoffset, effectiveSpikeWidth-globalOffset, 0, effectiveSpikeWidth-globalOffset);
}

void drawLastSpikeRightB() {
  //stroke(0, 0, 200);
  line(0, 0, effectiveSpikeHeight-effectiveXoffset, effectiveSpikeWidth/2-globalOffset);
  line (effectiveSpikeHeight-effectiveXoffset, effectiveSpikeWidth/2-globalOffset, 0, effectiveSpikeWidth/2-globalOffset);
  stroke(0);
}