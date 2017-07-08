
//constrafloat function
//--> calculate overlap 
//--> calculate optimal sensor for constrafloats

//User Input (either percentage or pixels)
//in pixels (should be mm in the future)

//these are constants for the experiment
float spacing = 150; //width between center of two strips, in pixels
float distance = 10; //distance between two strips, in pixels 
//should be dynamic, somehow, because its effected by angle

//in percentage of spacing
float spikeWidth = 40; // larger numbers = less spikes, in percent of spacing
float stripSpikeRatio = 80; //ratio between size of strip to size of spike, larger numbers = larger spikes
float offset = 75; //alignment between left and right side, percentage of spike width. 0 = no offset 100 = max offset

//Experiment Condition
//spikeWidth (3) * stripSpikeRatio (4) * offset (3) = 48 sensors + Special case

//Variables used floaternally (in pixels)
float effectiveWidth = spacing - distance; 
float effectiveSpikeWidth = spacing * spikeWidth / 100;
float effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
float effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
float effectiveOffset = effectiveSpikeWidth/2*offset / 100;
float effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/0); //this is adjusted by  recalculateOffsetValues(); // neet to calculate the dimensions of split triangle
int spikeCount; //number of spikes per strip
float globalOffset = 0;

void setup() {
  println("effectiveOffset: " + effectiveOffset);
  println("globalOffset: " + globalOffset);
  println("effectiveXoffset: " + effectiveXoffset);
  println("effectiveSpikeHeight: " + effectiveSpikeHeight);
  println("effectiveSpikeWidth: " + effectiveSpikeWidth);
  //  println("
  size (1200, 510);

  spikeCount = int((height-10)/effectiveSpikeWidth); //how many spikes fit on a strip



  drawStripA(1);
  drawStripB(2);
  drawStripA(3);
  drawStripB(4);
  drawStripA(5);
}


void draw() {
background(220,250,255);

// needs to be live if dynamic UI

globalOffset = 0;
  drawStripA(1);
  drawStripB(2);
  drawStripA(3);
  drawStripB(4);
  drawStripA(5);
}

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
  closeTop();
  drawFirstSpikeRightA();
  drawSpikeRowRight();//loop down, drawing negative spikes along left side //moves to endposition
  drawLastSpikeRightA();
  popMatrix();//go back to local origin

  popMatrix(); //go back to global origin
}



void drawStripB(int spikeNumber) {

  adjustOffsetVariables(globalOffset);

  pushMatrix(); //remember global origin
  translate(spikeNumber*spacing, 5);

  pushMatrix(); //remember local origin
  closeTop();
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