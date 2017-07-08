
//constrafloat function
//--> calculate overlap 
//--> calculate optimal sensor for constrafloats

//User Input (either percentage or pixels)
//in pixels (should be mm in the future)

//these are constants for the experiment
float spacing = 80; //width between center of two strips, in pixels
float distance = 20; //distance between two strips, in pixels 
//should be dynamic, somehow, because its effected by angle

//in percentage of spacing
float spikeWidth = 30; // larger numbers = less spikes, in percent of spacing
float stripSpikeRatio = 85; //ratio between size of strip to size of spike, larger numbers = larger spikes
float offset = 50; //alignment between left and right side, percentage of spike width. 0 = no offset 100 = max offset

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
  size (1200, 700);

  spikeCount = int(480/effectiveSpikeWidth); //how many spikes fit on a strip




}


void draw() {
background(220,250,255);

// needs to be live if dynamic UI
translate(200,200);
globalOffset = 0;
  drawFirstStripA(1);
  drawStripB(2);
  drawStripA(3);
  drawStripB(4);
   drawStripA(5);
  drawStripB(6);
  drawLastStripA(7);
}