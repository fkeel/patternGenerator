
//each spike is made up of many sub-parts. they are organized here.
//I use the matrix-stack liberally. pushMatrix() saves a coordinate system
//pop-matrix goes back to the previously stored one.
//pushMatrix can be called many times in sequence, and then popMatrix will go back step by step


void drawStripA(int spikeNumber) {

  adjustOffsetVariables(globalOffset);

  pushMatrix(); //remember global origin
  translate(spikeNumber*spacing, 5);

  pushMatrix(); //remember local origin
  drawFirstSpikeLeftA(); //draws the spike and moves endposition
  drawSpikeRowLeft();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeLeftA();
  popMatrix(); 

  adjustOffsetVariables(globalOffset+effectiveOffset);

  pushMatrix(); //remember local origin
  closeTop(spikeNumber);
  ;
  drawFirstSpikeRightA();
  drawSpikeRowRight();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeRightA();
  popMatrix();//go back to local origin

  popMatrix(); //go back to global origin
}


void drawFirstStripA(int spikeNumber) {

  adjustOffsetVariables(globalOffset);

  pushMatrix(); //remember global origin
  translate(spikeNumber*spacing, 5);

  pushMatrix(); //remember local origin

  drawBeginningLeft();//loop down, drawing negative spikes along left side //moves to endposition

  popMatrix(); 

  adjustOffsetVariables(globalOffset+effectiveOffset);

  pushMatrix(); //remember local origin
  closeTop(spikeNumber);
  drawFirstSpikeRightA();
  drawSpikeRowRight();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeRightA();
  popMatrix();//go back to local origin

  popMatrix(); //go back to global origin
}


void drawLastStripA(int spikeNumber) {

  adjustOffsetVariables(globalOffset);

  pushMatrix(); //remember global origin
  translate(spikeNumber*spacing, 5);

  pushMatrix(); //remember local origin

  drawFirstSpikeLeftA(); //draws the spike and moves endposition
  drawSpikeRowLeft();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeLeftA();
  popMatrix(); 

  adjustOffsetVariables(globalOffset+effectiveOffset);

  pushMatrix(); //remember local origin
  closeTop(spikeNumber);
  ;
  drawEndRight();
  popMatrix();//go back to local origin

  popMatrix(); //go back to global origin
}




void drawStripB(int spikeNumber) {

  adjustOffsetVariables(globalOffset);

  pushMatrix(); //remember global origin
  translate(spikeNumber*spacing, 5);

  pushMatrix(); //remember local origin
  closeTop(spikeNumber);
  drawFirstSpikeLeftB(); //draws the spike and moves endposition
  drawSpikeRowLeft();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeLeftB();
  popMatrix(); 

  adjustOffsetVariables(globalOffset-effectiveOffset);

  pushMatrix(); //remember local origin
  drawFirstSpikeRightB();
  drawSpikeRowRight();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeRightB();
  popMatrix();//go back to local origin

  popMatrix(); //go back to global origin
}