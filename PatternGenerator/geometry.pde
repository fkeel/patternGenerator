

void drawFirstSpikeLeftA() {
  //no spike
  line (0, 0, -effectiveXoffset, 0);
  line (-effectiveXoffset, 0, 0, globalOffset);
  translate(0, globalOffset);
}

void drawFirstSpikeLeftB() {
  //extra spike
  stroke(0, 200, 0);
  line (0, 0, -effectiveSpikeHeight+effectiveXoffset, 0);
  line (-effectiveSpikeHeight+effectiveXoffset, 0, -effectiveSpikeHeight, globalOffset);
  line (  -effectiveSpikeHeight, globalOffset, 0, effectiveSpikeWidth/2+globalOffset);
  translate(0, effectiveSpikeWidth/2+globalOffset);
  stroke(0);
}

void drawSpikeRowLeft() {
  for (float i = 0; i < spikeCount-1; i++) {
    line(0, 0, -effectiveSpikeHeight, effectiveSpikeWidth/2);
    line(-effectiveSpikeHeight, effectiveSpikeWidth/2, 0, effectiveSpikeWidth);
    translate(0, effectiveSpikeWidth);
  }
}

void drawBeginningLeft() {
  translate(+effectiveBlockWIdth/2, 0);
  for (float i = 0; i < spikeCount; i++) {
    if (i == 0) {
      line(-effectiveBlockWIdth/2, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    } else {
      line(0, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    }
  }
  line(0, 0, effectiveBlockWIdth/2, 0);
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

void closeTop(int multiplier) {
  //top border of block:
  line (effectiveBlockWIdth, 0, effectiveBlockWIdth, -(effectiveBlockWIdth+distance/2)*multiplier);
  line (0, 0, 0, -(effectiveBlockWIdth+distance/2)*(multiplier-1)-distance/2);
  pushMatrix();
  translate(effectiveBlockWIdth, -(effectiveBlockWIdth+distance/2)*multiplier);
  line(0,0,-20+(-spacing*multiplier),0);
   line(-effectiveBlockWIdth,effectiveBlockWIdth,-20+(-spacing*multiplier),effectiveBlockWIdth);
   line(-20+(-spacing*multiplier),0,-20+(-spacing*multiplier),effectiveBlockWIdth);
  
  popMatrix();

  
}

void drawFirstSpikeRightA() {
  //first spike, right side
  translate(effectiveBlockWIdth, 0);
  line (0, 0, effectiveXoffset, 0);
  line (effectiveXoffset, 0, 0, globalOffset);

  //going down, right side
  translate(0, globalOffset);
}

void drawFirstSpikeRightB() {
  translate(effectiveBlockWIdth, 0);
  stroke(200, 50, 50);

  // line (0, 0, effectiveXoffset, 0);
  line (effectiveXoffset, 0, effectiveSpikeHeight, globalOffset);
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
  translate(effectiveBlockWIdth/2, 0);
  for (float i = 0; i < spikeCount; i++) {
    if (i == 0) {
      line(effectiveBlockWIdth/2, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    } else {
      line(0, 0, 0, effectiveSpikeWidth);
      translate(0, effectiveSpikeWidth);
    }
  }
  line(0, 0, effectiveBlockWIdth/2, 0);
}

void drawLastSpikeRightA() {
  line(0, 0, effectiveSpikeHeight, effectiveSpikeWidth/2);
  line(effectiveSpikeHeight, effectiveSpikeWidth/2, effectiveXoffset, effectiveSpikeWidth-globalOffset);
  line (effectiveXoffset, effectiveSpikeWidth-globalOffset, 0, effectiveSpikeWidth-globalOffset);
}

void drawLastSpikeRightB() {
  stroke(0, 0, 200);
  line(0, 0, effectiveSpikeHeight-effectiveXoffset, effectiveSpikeWidth/2-globalOffset);
  line (effectiveSpikeHeight-effectiveXoffset, effectiveSpikeWidth/2-globalOffset, 0, effectiveSpikeWidth/2-globalOffset);
  stroke(0);
}