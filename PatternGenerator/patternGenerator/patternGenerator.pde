
//constraint function
//--> calculate overlap 
//--> calculate optimal sensor for constraints

//User Input (either percentage or pixels)
//in pixels (should be mm in the future)

//these are constants for the experiment
int spacing = 100; //width between center of two strips, in pixels
int distance = 10; //distance between two strips, in pixels 
//should be dynamic, somehow, because its effected by angle

//in percentage of spacing
int spikeWidth = 30; // larger numbers = less spikes, in percent of spacing
int stripSpikeRatio = 60; //ratio between size of strip to size of spike, larger numbers = larger spikes
int offset = 0; //alignment between left and right side. 0 = no offset 100 = max offset

//Experiment Condition
//spikeWidth (3) * stripSpikeRatio (4) * offset (3) = 48 sensors + Special case

//Variables used internally (in pixels)
int effectiveWidth = spacing - distance; 
int effectiveSpikeWidth = spacing * spikeWidth / 100;
int effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
int effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
int effectiveOffset = spacing*offset / 100;
int effectiveXoffset = effectiveSpikeHeight * (effectiveOffset/(effectiveSpikeWidth/2)) / 100;
int spikeCount; //number of spikes per strip

void setup() {

  println("effectiveXoffset: " + effectiveXoffset);
  println("effectiveSpikeHeight: " + effectiveSpikeHeight);
  //  println("
  size (800, 410);

  spikeCount = (height-10)/effectiveSpikeWidth; //how many spikes fit on a strip


  drawStripA(2);
}



void drawStripA(int spikeNumber) {
  pushMatrix();
  translate(spikeNumber*spacing, 5);


  //going down, left side
  pushMatrix();
  for (int i = 0; i < spikeCount; i++) {
    line(0, 0, -effectiveSpikeHeight, effectiveSpikeWidth/2);
    line(-effectiveSpikeHeight, effectiveSpikeWidth/2, 0, effectiveSpikeWidth);
    translate(0, effectiveSpikeWidth);
  }
  line (0, 0, effectiveBlockWIdth, 0);
  popMatrix();

  //moving to right
  pushMatrix();
  line (0, 0, effectiveBlockWIdth+(effectiveXoffset*spikeNumber), 0);
  line (effectiveBlockWIdth+(effectiveXoffset*spikeNumber), 0, effectiveBlockWIdth, effectiveOffset*spikeNumber);


  //going down, right side
  translate(effectiveBlockWIdth, effectiveOffset*spikeNumber);
  for (int i = 0; i < spikeCount; i++) {
    line(0, 0, effectiveSpikeHeight, effectiveSpikeWidth/2);
    line(effectiveSpikeHeight, effectiveSpikeWidth/2, 0, effectiveSpikeWidth);
    translate(0, effectiveSpikeWidth);
  }
  popMatrix();


  popMatrix();
}