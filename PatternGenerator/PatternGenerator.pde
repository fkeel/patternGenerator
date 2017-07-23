
//By Paul Strohmeier based on Discussions with Cedric Honnet & Maurin Donneaud

//Victor, here is the scaling variable:
float scale = 0.7;
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
float spikeWidth = 55; // larger numbers = less spikes, in percent of spacing
float stripSpikeRatio = 70; //ratio between size of strip to size of spike, larger numbers = larger spikes
float offset = 100; //alignment between left and right side, percentage of spike width. 0 = no offset 100 = max offset

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





void setup() {
  strokeWeight(0.01);
  size (650, 550, PDF, "thisIsATest.pdf");
  
  
 effectiveWidth = spacing - distance; 
    effectiveSpikeWidth = spacing * spikeWidth / 100;
    effectiveSpikeHeight = effectiveWidth * stripSpikeRatio / 100;
    effectiveBlockWIdth = effectiveWidth * (100 - stripSpikeRatio) / 100;
    effectiveOffset = effectiveSpikeWidth/2*offset / 100;
    effectiveXoffset = effectiveSpikeHeight / ((effectiveSpikeWidth/2)/0); //this is adjusted by  recalculateOffsetValues(); // neet to calculate the dimensions of split triangle
    spikeCount = (480/effectiveSpikeWidth); //how many spikes fit on a strip
 globalOffset = 0; //this needs to be reset to zero everytime a pattern is drawn, even when recording

  translate(20, 125); //move the sensor image into a nice position
  scale(scale, scale);

  stroke(0); //make lines black
  background(255);

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
  drawLastStripA(7);
}