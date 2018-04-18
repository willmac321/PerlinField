float inc=0.1;
int scl =10;
int cols,rows;
float zoff=0;
int length=1000;
PVector[] flowfield;

Particle[] particles=new Particle[length];

void setup(){
   size(600,600);
   cols=floor(width/scl);
   rows=floor(height/scl);
   for (int i=0; i<particles.length; i++){
      particles[i]= new Particle();
   }
   flowfield=new PVector[cols*rows+cols];
   background(0);
}

void draw(){
float yoff=0;

  for (int x=0;x<=rows;x++){
     float  xoff=0;
    for (int y=0;y<=cols;y++){
       int index= x+y*(cols-1);
      
       float angle=noise(xoff,yoff,zoff)*TWO_PI*4;
       
       PVector v =PVector.fromAngle(angle);
       v.setMag(5);
       flowfield[index]=v;
       xoff+=inc;
       stroke(0,50);
       //pushMatrix();
       //translate(x*scl,y*scl);
       //rotate(v.heading());
       //strokeWeight(2);
       //line(0,0,scl,0);
       //popMatrix();
       //rect(x*scl,y*scl,scl,scl);
    }
    yoff+=inc;
    zoff+=0.0003;
  }
  
   for (int i=0; i<particles.length; i++){
      particles[i].follow(flowfield);
      particles[i].update();
      particles[i].show();
    
   }
   
  //noiseDetail(1);
}
