
//By Paul Strohmeier based on Discussions with Cedric Honnet & Maurin Donneaud

//Victor, here is the scaling variable:
float scale = 0.8;
//-------------------Making the .pdf--------------------//
import processing.pdf.*;
boolean record = false;


//-------------------Meta Functions (in mm)--------------------------------//
/*these don't exist yet, but we could do something interesting 
 using the results of the evaluation. For example:
 - If I have 6 analog inputs, can tolerate errors of up to 5mm and 
 expect the sensor to be touched by fingers, how large can I make my sensor?
 
 - I want a 1m by 1m sensor that can tolerate errors of up to 2mm and 
 expects touch by fingers, how many analog inputs do I need?
 
 - I have 16 analog Inputs and am measuring footsteps
 in a carpet that is 3m by 6m. Whats the maximum error I should expect?
 */


//-------------------User defined Variables---------------------------------//

//-----------------constraints (in pixels)
float spacing = 100; //width between center of two strips, in pixels
float distance = 10; //distance between two strips, in pixels 
//should be dynamic, somehow, because its effected by angle (if kept static spacing dictates overlap)

//-----------------variables (in percentage of spacing)
float spikeWidth = 50; // larger numbers = less spikes, in percent of spacing
float stripSpikeRatio = 80; //ratio between size of strip to size of spike, larger numbers = larger spikes
float offset = 00; //alignment between left and right side, percentage of spike width. 0 = no offset 100 = max offset

//Experiment Condition
//spikeWidth (3) * stripSpikeRatio (4) * offset (3) = 48 sensors + Special case


//-------------------Internally used Variables (in pixels)--------------------//
float effectiveWidth = spacing - distance; 
float effectiveSpikeWidth = spacing * spikeWidth / 100;
float effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
float effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
float effectiveOffset = effectiveSpikeWidth/2*offset / 100;
float effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/0); //this is adjusted by  recalculateOffsetValues(); // neet to calculate the dimensions of split triangle
float spikeCount; //number of spikes per strip
float globalOffset = 0;

float breakOutVariable = 0; //because I am a bad programmer and can't figure it out. (used to make broader breakouts)

//-------------------GUI Stuff--------------------//
Slider setSpacing;
Slider setDistance;
Slider setSpikeWidth;
Slider setRatio;
Slider setOffset;
Button createPDF;
String feedback = "";

//-------------------Pan--------------------//
int xPan;
int yPan;
int oldx;
int oldy;
int xCurrent;
int yCurrent;
boolean ready;

void setup() {
  strokeWeight(0.1);
  size (1200, 1000);

  //-------------------GUI Stuff--------------------//
  setSpacing = new Slider("Spacing:s");
  setDistance = new Slider("Distance:d");
  setSpikeWidth = new Slider("SpikeWidth:w");
  setRatio = new Slider("Ratio:r");
  setOffset = new Slider("Offset:o");
  createPDF = new Button("Create PDF:p");

  setSpacing.assignRange(50, 150);
  setDistance.assignRange(0, 35);
  setSpikeWidth.assignRange(0, 200);
  setRatio.assignRange(0, 100); //this could go beyond 100. Creates interesting patterns, but some othe rcode will need fixing
  setOffset.assignRange(0, 100);
  textSize(15);
}


void draw() {
  background(240, 240, 240);

  if (createPDF.isToggled()) {
    background(0, 255, 0);
    record = true;
  }

  stroke(240, 240, 240);
  if (!record) { //skip this bit when recording to pdf

    ///////////////GUI Stuff////////////
    //sliders take x & y coordinate as well as height and width
    //setSpacing.display(900, 100, 250, 40);
    setDistance.display(900, 150, 250, 40);
    setSpikeWidth.display(900, 200, 250, 40);
    setRatio.display(900, 250, 250, 40);
    setOffset.display(900, 300, 250, 40);
    createPDF.display(1000, 350, 150, 40);
    fill(0);
    text(feedback, 800, 450);
    fill(255);

    //get slider values:
    //pacing = setSpacing.getSliderValue();
    distance = setDistance.getSliderValue();
    spikeWidth = setSpikeWidth.getSliderValue();
    stripSpikeRatio = setRatio.getSliderValue();
    offset = setOffset.getSliderValue();

    //recalculate strips based on GUI:
    effectiveWidth = spacing - distance; 
    effectiveSpikeWidth = spacing * spikeWidth / 100;
    effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
    effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
    effectiveOffset = effectiveSpikeWidth/2*offset / 100;
    effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/0); //this is adjusted by  recalculateOffsetValues(); // neet to calculate the dimensions of split triangle
    spikeCount = (480/effectiveSpikeWidth); //how many spikes fit on a strip



    setSpikeWidth.display(900, 200, 250, 40);
    setRatio.display(900, 250, 250, 40);
    setOffset.display(900, 300, 250, 40);
    createPDF.display(1000, 350, 150, 40);


    pan();
  } else if (record) {
    //start creating .pdf, filename contains parameters as defined here:
    beginRecord(PDF, "frame-d" + distance + "-w" +spikeWidth+"-r"+stripSpikeRatio+"-o"+ offset + "-scale"+scale+".pdf");
  }



  globalOffset = 0; //this needs to be reset to zero everytime a pattern is drawn, even when recording

  translate(50, 300); //move the sensor image into a nice position
  scale(scale, scale);

  stroke(0); //make lines black

  //The way I am doing this is kind of dumb.
  //I would prefer an object or a function that I tell 
  //"Make a sensor using X number of strips that has a width W and height H"
  // and use the above parameters for the pattern
  // this is just a hack to get it working and needs cleaning

  drawFirstStripA(1); //the functions parameter moves the strip by multiplying it with the spacing
  drawStripB(2);
  drawStripA(3);
  drawStripB(4);
  drawStripA(5);
  drawStripB(6);
  drawLastStripA(7); //right now it only supports uneven sensor numbers. I would also need a 'drawLastStripB' type function.
  // find the strips in the 'strip' tab at top. The details of how the spikes are generated are in the 'geometry' tab
  // the breakout is in the closeTop() function in the geometry tab

  if (record) {
    println("Making PDF");
    feedback = "created frame-d" + distance + "-w" +spikeWidth+"-r"+stripSpikeRatio+"-o"+ offset + "-scale"+scale+".pdf";
    endRecord(); //stop recording after one frame
    record = false; //don't start a new one next time round
    createPDF.setState(false); //needs to be set back or .pdfs will be created continuously
  }
}