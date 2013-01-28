import controlP5.*;
ControlP5 cp5;
int steps = 100;

color[] wiz = {#f6ab00, #fccc00, #0f9e87, #2db4a3};
int wid = 500; 
int hig = 500;
int x = 0;
int y = 0;

int[] xr = {0, -1, 1, 3, -3, 13, -13};

int rx = xr[int(random(0, xr.length))];
int ry = rx - int(random(0, 2*x));

void setup(){
  size(500, 500);
  background(220);
  // smooth();
  rectMode(CENTER);

  cp5 = new ControlP5(this);
  cp5.addSlider("steps", 7, 1500, 100, 20, 460, 440, 20);
  cp5.addButton("generate", 1, 225, 420, 47, 20);

  cp5.controller("steps").setColorBackground(#cccccc);
  cp5.controller("steps").setColorForeground(#bebebe);
  cp5.controller("steps").setColorActive(#b3b3b3);
  cp5.controller("steps").setColorLabel(#7f7f7f);
  cp5.controller("steps").setColorValue(#7f7f7f);

  cp5.controller("generate").setColorBackground(#cccccc);
  cp5.controller("generate").setColorForeground(#bebebe);
  cp5.controller("generate").setColorActive(#b3b3b3);
  cp5.controller("generate").setColorLabel(#7f7f7f);
  cp5.controller("generate").setColorValue(#7f7f7f);

  


}

void draw(){
  // background(220);
  // saveFrame("####.png");
}

void controlEvent(ControlEvent theEvent) {

  if(theEvent.controller().name()=="generate") {
    background(220);
    idm();
    }



}

void idm(){
  pushMatrix();
  translate(wid/2, hig/2.5);
  
  for( int e = 0; e < 1; e++){
    background(220);
    for( int i = 0; i < steps; i++){

      // stroke(wiz[int( random(0, 4) )], 100);
      stroke(30, 20);
      
      line(x, y, x + rx, y + ry);
      if( random(1) > 0.95 ){
        noStroke();
        fill(int( random(100, 200) ));
        rect(x, y, 1, 2);
      }

      x = x + rx;
      y = y + ry;

      rx = xr[int(random(0, xr.length))];
      int[] yr = {rx, -rx, 0}; 
      ry = yr[int( random(0, 3) )] ;

      if( x + rx <-wid/2 || x + rx > wid/2 ){
        rx = - rx;
      }

      if (y + ry < -hig/2  || y + ry > hig/2 ){
        ry = - ry;
      }
    }
    x = 0;
    y = 0;
    popMatrix();
  }
}
