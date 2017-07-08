//code by Victor Håkansson <victor@skavi.dk>,

import processing.pdf.*;

// the dimension of the canvas
float canvasWidth = 500;
float canvasHeight = 400;
  
// the dimension of each tack
float tackWidth = 8;
float tackHeight = 25;
  
// the gap between each row
float rowGap = 10;
  
// extra space that is put inbetween the tacks
float rowBuffer = 10;

void setup() {
  size(152, 171, PDF, "NoSpikes.pdf");
  //createCanvas(canvasWidth, canvasHeight);
}

void draw() {
  // mark the border of the canvas with red outline to see if all the space is used
  //stroke(255, 0, 0);
  //rect(0, 0, canvas.width - 1, canvas.height - 1);
  
  //stroke('black');
  background(255);
  strokeWeight(0.1);
  
  // no spikes
  for (int i = 0; i < 5; i++) {
    rect(0, i * 26 + i * 10, 152, 26);
  } 
  
  /*
  // pressure reference
  rect(0, 0, 80, 80);
  rect(0, 81, 80, 80);
  */
  //drawRows(tackWidth, tackHeight, rowGap, rowBuffer);
  exit();
}

void drawRows(float tackWidth, float tackHeight, float rowGap, float rowBuffer) {
  // start row
  drawRow(0, tackWidth, tackHeight, -1);
  
  int numberOfRows = floor((canvasHeight - (tackHeight + rowGap)) /
                      (floor((tackHeight * 2 + rowGap + rowBuffer) / 2) 
                      +floor((rowGap + rowBuffer) / 2)));
  
  float currentY = rowGap;
  for(int i = 0; i < numberOfRows; i++) {
    
    if(i % 2 != 0) { drawRowTwo(currentY, tackWidth, tackHeight, rowBuffer); }
    else { drawRowOne(currentY, tackWidth, tackHeight, rowBuffer); }
    
    
    currentY += ((i + 1) % 2) * (tackHeight * 2.0) + rowGap + rowBuffer;
  }
  
  if ((numberOfRows % 2 != 0) && (currentY + tackHeight + rowBuffer) <= canvasHeight) {
    drawRowTwo(currentY, tackWidth, tackHeight, rowBuffer);
  }
}


void drawRowOne(float startY, float tackWidth, float tackHeight, float rowBuffer) {
  drawRow(startY, tackWidth, tackHeight, -1);
  drawRow(startY + (2 * tackHeight) + rowBuffer, tackWidth, tackHeight, 1);
}

void drawRowTwo(float startY, float tackWidth, float tackHeight, float rowBuffer) {
  drawRow(startY, tackWidth, tackHeight, 1);
  drawRow(startY + rowBuffer, tackWidth, tackHeight, -1);
}

// draws a row of tacks
void drawRow(float startY, float tackWidth, float tackHeight, float PVMovement) {
  int numberOfTacks = floor(canvasWidth / tackWidth);
  
  float currentX = 0.0;
  for(int i = 0; i < numberOfTacks; i++) {
    drawTack(currentX, startY, tackWidth, tackHeight, PVMovement);
    currentX += tackWidth;
  }
    
}

// draws one tack where PVMovement decides the direction of the tack.
// positive = up, negative = down
void drawTack(float startX, float startY, float tackWidth, float tackHeight, float PVMovement) {  
  float midX = startX + floor(tackWidth / 2);
  float midY = startY + (-PVMovement * tackHeight);
  
  float endX = midX + ceil(tackWidth / 2);
  float endY = midY + (PVMovement * tackHeight);
    
  line(startX, startY, midX, midY);
  line(midX, midY, endX, endY);
}