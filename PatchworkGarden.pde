/* Megan Imperato
   A3: Patchwork Garden
   
   credit: user colouredmirrorball, https://discourse.processing.org/t/closing-a-second-window/381
   credit: Recursive Tree by Daniel Shiffman, https://processing.org/examples/tree.html
   credit: Coding Challenge #3 Rain Effect by Barney, https://www.youtube.com/watch?v=dD9CwuvsBXc
   Goals: explore non-linear story telling through the cyclical nature of a garden, 
   create an interactive space where the user can explore the narritive out of order,
   play with the binary of life and death, show the transition from created to creator,
   use a variety of methods to illustrate a point in a story: annimation, poetry, symbolism, etc.
*/

//initialize variables
HerGarden win; //variable for 2nd window
String windowID="None"; 

//variabels for drawing rectangles on main window
float rw;
float rh;
float rxy[][]= new float[7][2];

int blinkTimer=0;

PFont font; //font

//animation variables
float click=0;
int size=0;

//tree variables
float theta;   
float a;
float b;
float w;

int rad;

int seedY;



PImage imgs[]= new PImage[8];

public void settings() {
  fullScreen();
  imgs[0]=loadImage("rose.jpg");
  imgs[1]=loadImage("mary.jpg");
  imgs[2]=loadImage("patchworkgirl.jpg");
  imgs[3]=loadImage("flowers.jpg");
  imgs[4]=loadImage("magazine.jpg");
  imgs[5]=loadImage("tools.jpg");
  imgs[6]=loadImage("garden.jpg");
  imgs[7]=loadImage("mary2.jpg");
  
}

void setup() {  
 image(imgs[0],2*(width/5),0,width/2.5,height/2);
 image(imgs[1],width/2,height/2,width/2,height/2);
 image(imgs[2],0,height/2,width/3,height/2);
 image(imgs[3],width/3,height/2,width/5,height/2);
 image(imgs[4],width-width/5,0,width/5,height/2);
 image(imgs[5],0,0,width/5,height/2);
 image(imgs[6],width/5,0,width/5,height/2);
 
 //intialize rectangles based on screen dimensions
 rw=width*.12;
 rh=height*.12;
 
 rxy[0][0]=width/2;
 rxy[0][1]=height/2-width*.15 +20;
 
 rxy[1][0]=width/2-width*.2;
 rxy[1][1]=height/2+20;
 
 rxy[2][0]=width/2;
 rxy[2][1]=height/2+20;
 
 rxy[3][0]=width/2+width*.2;
 rxy[3][1]=height/2+20;
 
 rxy[4][0]=width/2-width*.3;
 rxy[4][1]=height/2+width*.15+20;
 
 rxy[5][0]=width/2;
 rxy[5][1]=height/2+width*.15+20;
 
 rxy[6][0]=width/2+width*.3;
 rxy[6][1]=height/2+width*.15+20;
 
}

void draw() { 
  
  if (blinkTimer%35==0 || (blinkTimer-1)%35==0 || (blinkTimer-2)%35==0){
     image(imgs[7],width/2,height/2,width/2,height/2);
   } else { //blink
     image(imgs[1],width/2,height/2,width/2,height/2);
   }
   blinkTimer++;
  
  stroke(0);
  strokeWeight(10);
  rectMode(CENTER); // draw using point in center
  String label[]={"Plant", "Grow", "Blossom", "Joy", "Wilt", "Die", "Seed"};
 
  //draw connections between rectangles
  for (int i=1; i<7; i++){
     line(rxy[i-1][0],rxy[i-1][1],rxy[i][0],rxy[i][1]); 
  }
  
  noFill();
  arc(width*.55,height*.75,height,height,-PI/2,0); //connect "seed" to "plant"
  
  font = createFont("Georgia", 72);
  textFont(font);
  textAlign(CENTER);
  for (int i=0; i<7; i++){ //draw rectangles and labels
    fill(#ffffff);
    if (label[i].equals(windowID)){ //highlight recently clicked
      fill(#FFF3AF);
    }
    rect(rxy[i][0], rxy[i][1], rw, rh);
    fill(#000000);
    text(label[i],rxy[i][0],rxy[i][1]);
  } 
}

void mousePressed() {
  //which rectangle was clicked?
  if (mouseX>(rxy[0][0]-rw/2)&&mouseX<(rxy[0][0]+rw/2)&&mouseY>(rxy[0][1]-rh/2)&&mouseY<(rxy[0][1]+rh/2)){ 
    windowID="Plant";
  } else if (mouseX>(rxy[1][0]-rw/2)&&mouseX<(rxy[1][0]+rw/2)&&mouseY>(rxy[1][1]-rh/2)&&mouseY<(rxy[1][1]+rh/2)){ 
    windowID="Grow";
  } else if (mouseX>(rxy[2][0]-rw/2)&&mouseX<(rxy[2][0]+rw/2)&&mouseY>(rxy[2][1]-rh/2)&&mouseY<(rxy[2][1]+rh/2)){ 
    windowID="Blossom";
  } else if (mouseX>(rxy[3][0]-rw/2)&&mouseX<(rxy[3][0]+rw/2)&&mouseY>(rxy[3][1]-rh/2)&&mouseY<(rxy[3][1]+rh/2)){ 
    windowID="Joy";
  } else if (mouseX>(rxy[4][0]-rw/2)&&mouseX<(rxy[4][0]+rw/2)&&mouseY>(rxy[4][1]-rh/2)&&mouseY<(rxy[4][1]+rh/2)){ 
    windowID="Wilt";
  } else if (mouseX>(rxy[5][0]-rw/2)&&mouseX<(rxy[5][0]+rw/2)&&mouseY>(rxy[5][1]-rh/2)&&mouseY<(rxy[5][1]+rh/2)){ 
    windowID="Die";
  } else if (mouseX>(rxy[6][0]-rw/2)&&mouseX<(rxy[6][0]+rw/2)&&mouseY>(rxy[6][1]-rh/2)&&mouseY<(rxy[6][1]+rh/2)){ 
    windowID="Seed";
  } else {
    windowID="None";
  }
  
  //only open new window if valid area was clicked
  if(win == null && !windowID.equals("None")){
    //println(windowID);
    win = new HerGarden();
  }
} 
