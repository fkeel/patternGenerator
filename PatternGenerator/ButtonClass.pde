//this is just here so we can re-use it for the sliders

//buttons must be initialzied
//once drawn, buttons track if they are toggled or not
//you can toggle by clicking or by using the hotkey

public class Button {
  int buttonX, buttonY, buttonWidth, buttonHeight; //position & dimensions
  boolean state; 
  String buttonName; //name to be displayed
  char hotKey; //keyboard shortcut for toggling button
  boolean readyForClick;
  boolean clicked; //only used internally to detect click
  boolean hotKeyHit; //only used internally to detect keyHit
  boolean checkMouse; //set false to deactivate mouse inptu
  boolean checkKey; //set false to deactivate keyboard shortcuts

  color lowGreen = color(0, 155, 0);
  color lowRed = color(155, 0, 0);
  color highGreen = color(0, 255, 0);
  color highRed = color(255, 0, 0);
  color white = color(255);

  //constructor with position (there are two different constructors)
  Button(String nameShortcut, int x, int y, int w, int h ) {
    checkMouse = true;
    checkKey = true;
    hotKeyHit = false;
    clicked = false;
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    readyForClick = false;
    String[] stringArray = splitTokens(nameShortcut, ":");
    if (stringArray.length != 2) {
      println("ERROR: Please format your buttons as \"ButtonName:Hotkey\" instead of \"" +nameShortcut+"\"");
    }
    buttonName = stringArray[0];
    hotKey = stringArray[1].charAt(0);
    println("Button Created - Name: " + buttonName + ", HotKey: " + hotKey + 
      ", Position: (" + buttonX + "," + buttonY + 
      ") Size: " + buttonWidth + "x"+ buttonHeight);
    state = false;
  }

  //constructor without position
  Button(String nameShortcut) {
    checkMouse = true;
    checkKey = true;
    hotKeyHit = false;
    clicked = false;
    buttonX = 0;
    buttonY = 0;
    buttonWidth = 100;
    buttonHeight = 100;
    readyForClick = false;
    String[] stringArray = splitTokens(nameShortcut, ":");
    if (stringArray.length != 2) {
      println("ERROR: Please format your buttons as \"ButtonName:Hotkey\" instead of \"" +nameShortcut+"\"");
    }
    buttonName = stringArray[0];
    hotKey = stringArray[1].charAt(0);
    println("Button Created - Name: " + buttonName + ", HotKey: " + hotKey + 
      ", no size or position assigned.");
    state = false;
  }

  //switches state
  boolean toggle() {
    return state = !state;
  }

  //needs a toggle and a switch function

  //sets state
  void setState(boolean newState) {
    state = newState;
  }

  //asks for state
  boolean isToggled() {
    return state;
  }
  
  boolean getClicked(){
    return clicked;
  }

  void activateClick() {
    //gotta check if another one is not still clicked
    if (!mousePressed && hover()) {
      readyForClick = true;
    }
    
    if (mousePressed && hover() && readyForClick) {
      clicked = true;
    } 

    if (clicked && hover() && !mousePressed) {
      toggle();
    } 

    if (!mousePressed || !hover()) {
      clicked = false;
    }
  }


  void activateKey() {
    if (keyPressed) {
      if (key == hotKey)
        hotKeyHit = true;
    } 
    if (hotKeyHit && !keyPressed) {
      toggle();
    } 

    if (keyPressed) {
      if (key != hotKey)
        hotKeyHit = false;
    } 

    if (!keyPressed) {
      hotKeyHit = false;
    }
  }
  //checks if it was clicked
  boolean hover() {
    return mouseX > buttonX & mouseX < buttonX+buttonWidth 
      & mouseY > buttonY & mouseY < buttonY+buttonHeight;
  }


  //there are two display functions, depending on if the button has coordinates or not

  //button has coordinates
  void display() {
    fill(state? highGreen:highRed); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    fill(state? highGreen:white); //color of name
     text(buttonName, buttonX+15, buttonY+35);
    fill(state? highGreen:highRed);  //color of hotkey
 
    if (checkMouse) {
      activateClick();
    }
    if (checkKey) {
      activateKey();
    }
  }

  //button does not have coordinates
  void display(int x, int y, int w, int h) {
    buttonX = x;
    buttonY = y;
    buttonWidth = w;
    buttonHeight = h;
    fill(state? highGreen:highRed); //color of rectangle
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    fill(state? highGreen:white); //color of name
    text(buttonName, buttonX+15, buttonY+35);
    // fill(state? highGreen:highRed);  //color of hotkey
   
    if (checkMouse) {
      activateClick();
    }
    if (checkKey) {
      activateKey();
    }
  }
}