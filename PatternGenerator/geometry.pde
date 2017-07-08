

void drawFirstSpikeLeftA() {
  //no spike
  line (0, 0, -effectiveXoffset, 0);
  line (-effectiveXoffset, 0, 0, globalOffset);
  translate(0, globalOffset);
}

void drawFirstSpikeLeftB() {
  //extra spike
  stroke(0,200,0);
  line (0, 0, -effectiveSpikeHeight+effectiveXoffset, 0);
  line (-effectiveSpikeHeight+effectiveXoffset, 0, -effectiveSpikeHeight, globalOffset);
  line (  -effectiveSpikeHeight, globalOffset, 0, spikeWidth/2+globalOffset);
  translate(0, spikeWidth/2+globalOffset);
  stroke(0);
}

void drawSpikeRowLeft() {
  for (float i = 0; i < spikeCount-1; i++) {
    line(0, 0, -effectiveSpikeHeight, effectiveSpikeWidth/2);
    line(-effectiveSpikeHeight, effectiveSpikeWidth/2, 0, effectiveSpikeWidth);
    translate(0, effectiveSpikeWidth);
  }
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

void closeTop() {
  //top border of block:
  line (0, 0, effectiveBlockWIdth, 0);
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
  stroke(200,50,50);
  
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

void drawLastSpikeRightA() {
  line(0, 0, effectiveSpikeHeight, effectiveSpikeWidth/2);
  line(effectiveSpikeHeight, effectiveSpikeWidth/2, effectiveXoffset, effectiveSpikeWidth-globalOffset);
  line (effectiveXoffset, effectiveSpikeWidth-globalOffset, 0, effectiveSpikeWidth-globalOffset);
}

void drawLastSpikeRightB() {
  stroke(0,0,200);
  line(0,0,effectiveSpikeHeight-effectiveXoffset,effectiveSpikeWidth/2-globalOffset);
  line (effectiveSpikeHeight-effectiveXoffset,effectiveSpikeWidth/2-globalOffset, 0, effectiveSpikeWidth/2-globalOffset);
  stroke(0);
}