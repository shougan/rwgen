import controlP5.*;

ControlP5 cp5;

// width and height
int wid = 500; 
int hig = 500;

//backgroung color
color bg = color(220);
// line color and opacity
color strk = color(30, 20);

// start drawing point coordinates
int curx = 0;
int cury = 0;

// possible steps for a walk
int[] xrange = {0, -1, 1, 3, -3, 13, -13};

// default steps slider value
int steps = 100;

// x step
int xstep;
// y step
int ystep;

void setup(){
  size(500, 500);
  background(bg);
  smooth();
  rectMode(CENTER);

  cp5 = new ControlP5(this);
// add slider for number of steps
  cp5.addSlider("steps", 7, 1500, 100, 20, 460, 440, 20);
// add button for image generation
  cp5.addButton("generate", 1, 225, 420, 47, 20);

// customize slider
  cp5.controller("steps").setColorBackground(#cccccc);
  cp5.controller("steps").setColorForeground(#bebebe);
  cp5.controller("steps").setColorActive(#b3b3b3);
  cp5.controller("steps").setColorLabel(#7f7f7f);
  cp5.controller("steps").setColorValue(#7f7f7f);
// customize button
  cp5.controller("generate").setColorBackground(#cccccc);
  cp5.controller("generate").setColorForeground(#bebebe);
  cp5.controller("generate").setColorActive(#b3b3b3);
  cp5.controller("generate").setColorLabel(#7f7f7f);
  cp5.controller("generate").setColorValue(#7f7f7f);
}

// keep updating canvas
void draw(){
}

// catch generate button event
void controlEvent(ControlEvent theEvent) {
  // if button event
  if(theEvent.controller().name()=="generate") {
    background(bg);
  // generate image
    drawImage();
    }
}

// image generation function
void drawImage(){
  
  pushMatrix();
  
  // move coordinate center
  translate(wid/2, hig/2.5);

  // for each step
  for( int i = 0; i < steps; i++){
    // DRAW LINES
    // pick random xstep from x range
    xstep = xrange[int(random(0, xrange.length))];

    // for y range assign x, -x, and 0 values, that's tricky part (-
    // since if xstep = 0, y will be 0 too, so there will be no vertical lines
    int[] yrange = {xstep, -xstep, 0}; 

    // pick random ystep from y range
    ystep = yrange[int( random(0, 3) )] ;

    // assign stroke color
    stroke(strk);
    
    // draw a line
    line(curx, cury, curx + xstep, cury + ystep);
    
    // DRAW RECTANGLES
    // rectangle color
    color rect_color = color( int( random(180, 200) ) );

    //recangle size 
    int rect_size  = int( random(2, 3));

    // with probability 4% 
    if( random(1) > 0.96){
      noStroke();
      fill(rect_color);

      //draw rectanlgle
      rect( curx, cury, rect_size, rect_size );
    }

    // updating current x and y
    curx = curx + xstep;
    cury = cury + ystep;

    // if our new coordinate goes out of sketch bounds
    if( curx + xstep <-wid/2 || curx + xstep > wid/2 ){
      // reverse x
      xstep = - xstep;
    }

    if (cury + ystep < -hig/2  || cury + ystep > hig/2 ){
      // reverse y
      ystep = - ystep;
    }
  }
  
  // reset current coordinates to 0
  curx = 0;
  cury = 0;
  popMatrix();
}

