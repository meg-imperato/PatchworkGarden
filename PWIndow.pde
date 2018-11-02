class PWindow extends PApplet { // new window
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() {
    size(600, 600);
  }

  void setup() {
    if (windowID.equals("Wilt")){
      click=100;
    } else{
      click=0;
    }
    a=0;
    b=50;
    w=1;
    seedY=100;
    rad=40;
  }

  void draw() {
    font = createFont("Georgia", 32);
    textFont(font);
    textAlign(CENTER);
    if (windowID.equals("Plant")){
      
      //black to blue-green gradient
      for (int i = 0; i < 600; i += 1) {
        stroke(10, i/5, i/6);
        line(0, i, 600, i);
      }
      text("Made by a living thing, \nfrom once living things,\nhow am I anything but \na living thing? \nWhat better way \nto shed the name of Death \nthan to create life?", 300,150);
    } else if (windowID.equals("Blossom")){
      background(0);
      translate(300,300);
      noStroke();
      fill(250-click,250-click,250); 
      
        for (int i = 0; i < 10; i++) {
          ellipse(0, click, 70, 250);
          rotate(radians(40));
        }
      if (click<125){
        click++;
      } else {
        click--;
      }
      /*
        background(0);
       
        fill(#ffffff); 
        
        text("Click to bloom", 450,550);
        translate(300,300);
        noStroke();
        
        //draw petals
        fill(#ffffff); 
        for (int i = 0; i < 10; i++) {
          if (click<20){
            ellipse(0, -8*(click/2), 6*(click/2), 20*(click/2));
          } else {
            ellipse(0, -80, 60, 200);
          }
          rotate(radians(40));
        }
        
        fill(#FCD90A); 
        //center of flower --> fruit
        if (click<110){
           ellipse(0, 0, 7*(click/2), 7*(click/2));
        } else {
          ellipse(0, 0, 7*55, 7*55);
          //stem of fruit
          noFill();
          stroke(#BC7C28);
          strokeWeight(10);
          arc(-100, -150, 100, 100,-PI/3, PI/9);
          //bite the fruit
          if (click>150){
            noStroke();
            fill(0);
            ellipse(-200, 10, 200, 200);
          }
        }
        
        if (click>0){ //only start animation once screen clicked
          click+=1; //grow
        }
        */
      } 
      else if (windowID.equals("Grow")){
        //draw recursive tree
        for (int i = 0; i < 600; i += 1) {
          stroke(i/5, 200-i/8, 130);
          line(0, i, 600, i);
        }
        frameRate(30);
        stroke(#4A1B50);
        strokeWeight(5);
        //increment angle so that tree expands/blooms
        if (a<50){
          a++;
        }
        theta = radians(a); //convert to radians
        translate(width/2,height);
        line(0,0,0,-180);
        translate(0,-180);
        branch(180); //call to recursive function
      } 
      else if (windowID.equals("Joy")){
        fill(0);
       for (int i = 0; i < 600; i += 1) {
          stroke(150, 200, 250-i/4);
          line(0, i, 600, i);
        }
        textSize(28);
        text("\"Nature\" is what we see—\nThe Hill—the Afternoon—\nSquirrel—Eclipse— the Bumble bee—\nNay—Nature is Heaven—\nNature is what we hear—\nThe Bobolink—the Sea—\nThunder—the Cricket—\nNay—Nature is Harmony—\nNature is what we know—\nYet have no art to say—\nSo impotent Our Wisdom is\nTo her Simplicity.",300,50);
        text("- Emily Dickinson", 450,575);
      }
      else if (windowID.equals("Wilt")){
        background(0);
        translate(300,300);
        noStroke();
        
        //petals
        fill(250*w,250*w,250*w); //fade white to black
        for (int i = 0; i < 10; i++) {
          ellipse(0*w, -80*w, 60*w, 200*w);
          rotate(radians(40));
        }
        fill(250*w,220*w,0); //fade yellow to black
        ellipse(0, 0, 70*w, 70*w);
        
        if (w>0){
          w-=.005; //shrink
        }
      } 
      
      else if (windowID.equals("Die")){
        for (int i = 0; i < 600; i += 1) {
          stroke(200-i/4, 200-i/5, 150);
          line(0, i, 600, i);
        }
        frameRate(30);
        stroke(#221B50);
        strokeWeight(5);
        if (b!=0){ //once the angle = 0, the tree will disappear
          if (b>0){ //shrink the angle
            b--;
          }
          theta = radians(b);
          // Start the tree from the bottom of the screen
          translate(width/2,height);
          // Draw a line 120 pixels
          line(0,0,0,-180);
          // Move to the end of that line
          translate(0,-180);
          // Start the recursive branching!
          branch(180);
        } else {
          fill(#221B50);
          ellipse(300,seedY,30,30);
          if (seedY<500){
            seedY+=10;
          }
        }
      } 
      else if (windowID.equals("Seed")){
      
        //black to blue-green gradient
        for (int i = 0; i < 600; i += 1) {
          stroke(50, i/5, i/4);
          line(0, i, 600, i);
        }
        text("Death becomes life,\nThe created becomes the creator.", 300, 300);
      }
  }

  void mousePressed() {
    println("mousePressed in secondary window");
      click++;
  }
  
  void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  //condition: when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // recursive call
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
  
  void exit() { //close the window
    dispose();
    win = null;
  }
}
