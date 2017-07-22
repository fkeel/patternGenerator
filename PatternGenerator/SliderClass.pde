
//TODO: needs a 'void setSliderValue(int x)' function
//needs some method of entering a precise value by keyboard
//maybe also constraining it to certain step sizes (using integer instead of float might already fix stuff


//a slider is a button that does not toggle, instead it returns a value
public class Slider extends Button {
  float sliderValue;
  int sliderPosition;
  int sliderMin;
  int sliderMax;
  boolean active;


  Slider(String nameShortcut, int x, int y, int w, int h ) { //its built the same way, just we add a min and max value
    super(nameShortcut, x, y, w, h);
    sliderValue = 0;
    sliderMin = 0;
    sliderMax = 0;
    active= false;
  }

  //constructor without position
  Slider(String nameShortcut) {
    super(nameShortcut);
    sliderValue = 0;
    sliderMin = 0;
    sliderMax = 0;
    active= false;
  }

  void assignRange(int min, int max) { //we tell the slider what its range is here
    sliderMin = min;
    sliderMax = max;
    sliderValue = max-min/2;
    sliderPosition = buttonX+int((random(buttonWidth/2, buttonWidth*2))); //random to put it into interesting starting positions
    //there is some strange bug here, its as if I took the button width double at some point
  }

  void display() {
    super.display();
    stroke(255);
    rect(sliderPosition-3, buttonY, 6, buttonHeight); //add the position indicator object to the slider
  }

  //alternate constructor, if we want to give it new coordinates
  void display(int x, int y, int w, int h) {
    super.display(x, y, w, h);
    stroke(255);
    rect(buttonX+sliderPosition-3, buttonY, 6, buttonHeight);
  }

  // not sure what to use the keyboard shortct for. kinda pointless here
  //I changed it around, so the curser can drift out of the slider
  void activateClick() { //instead of toggling, we move the slider

    if (!mousePressed && super.hover()) {
      readyForClick = true;
    } else if (!mousePressed) {
      readyForClick = false;
    }

    if (mousePressed &&  readyForClick) {
      active= true;
      if (mouseX>buttonX && mouseX < buttonX+buttonWidth) {
        if ((mouseY<buttonY) || (mouseY> buttonY+buttonHeight)) {
          fill(0);
        } else {
          fill(255);
        }

        sliderPosition = mouseX - buttonX;
        text(str(this.getSliderValue()), mouseX+10, mouseY + 10); //add the value, so you know what you're doing
      }
      fill(255);


      clicked = true;
    } else {
      active = false;
    }
  }

  boolean isSliderActive() {
    return active;
  }
  float getSliderValue() { //here we ask what its value is
    sliderValue = map(sliderPosition, 0, buttonWidth, sliderMin, sliderMax);
    return sliderValue;
  }
}