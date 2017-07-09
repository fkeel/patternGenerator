
//constrafloat function
//--> calculate overlap 
//--> calculate optimal sensor for constrafloats

//User Input (either percentage or pixels)
//in pixels (should be mm in the future)

//these are constants for the experiment
float spacing = 100; //width between center of two strips, in pixels
float distance = 10; //distance between two strips, in pixels 
//should be dynamic, somehow, because its effected by angle

//in percentage of spacing
float spikeWidth = 50; // larger numbers = less spikes, in percent of spacing
float stripSpikeRatio = 80; //ratio between size of strip to size of spike, larger numbers = larger spikes
float offset = 00; //alignment between left and right side, percentage of spike width. 0 = no offset 100 = max offset

//Experiment Condition
//spikeWidth (3) * stripSpikeRatio (4) * offset (3) = 48 sensors + Special case

//Variables used floaternally (in pixels)
float effectiveWidth = spacing - distance; 
float effectiveSpikeWidth = spacing * spikeWidth / 100;
float effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
float effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
float effectiveOffset = effectiveSpikeWidth/2*offset / 100;
float effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/0); //this is adjusted by  recalculateOffsetValues(); // neet to calculate the dimensions of split triangle
float spikeCount; //number of spikes per strip
float globalOffset = 0;



///////////////GUI Stuff////////////
Slider setSpacing;
Slider setDistance;
Slider setSpikeWidth;
Slider setRatio;
Slider setOffset;

void setup() {
  println("effectiveOffset: " + effectiveOffset);
  println("globalOffset: " + globalOffset);
  println("effectiveXoffset: " + effectiveXoffset);
  println("effectiveSpikeHeight: " + effectiveSpikeHeight);
  println("effectiveSpikeWidth: " + effectiveSpikeWidth);
  //  println("
  size (1200, 1000);

  spikeCount = int(480/effectiveSpikeWidth); //how many spikes fit on a strip


  ///////////////GUI Stuff////////////
  setSpacing = new Slider("Spacing:s");
  setDistance = new Slider("Distance:d");
  setSpikeWidth = new Slider("SpikeWidth:w");
  setRatio = new Slider("Ratio:r");
  setOffset = new Slider("Offset:o");

  setSpacing.assignRange(50, 150);
  setDistance.assignRange(0, 35);
  setSpikeWidth.assignRange(0, 200);
  setRatio.assignRange(0, 100);
  setOffset.assignRange(0, 100);
  textSize(15);
}


void draw() {
    background(240, 240, 240);

stroke(240, 240, 240);
  ///////////////GUI Stuff////////////
  //sliders take x & y coordinate as well as height and width
 // setSpacing.display(900, 100, 250, 40);
  setDistance.display(900, 150, 250, 40);
  setSpikeWidth.display(900, 200, 250, 40);
  setRatio.display(900, 250, 250, 40);
  setOffset.display(900, 300, 250, 40);

//  spacing = setSpacing.getSliderValue();
  distance = setDistance.getSliderValue();
  spikeWidth = setSpikeWidth.getSliderValue();
  stripSpikeRatio = setRatio.getSliderValue();
  offset = setOffset.getSliderValue();

  effectiveWidth = spacing - distance; 
  effectiveSpikeWidth = spacing * spikeWidth / 100;
  effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
  effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
  effectiveOffset = effectiveSpikeWidth/2*offset / 100;
  effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/0); //this is adjusted by  recalculateOffsetValues(); // neet to calculate the dimensions of split triangle
  spikeCount = (480/effectiveSpikeWidth); //how many spikes fit on a strip
  globalOffset = 0;


  // needs to be live if dynamic UI
translate(50,300);


stroke(0);

  drawFirstStripA(1);
  drawStripB(2);
  drawStripA(3);
  drawStripB(4);
  drawStripA(5);
  drawStripB(6);
  drawLastStripA(7);
}