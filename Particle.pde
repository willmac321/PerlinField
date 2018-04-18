public class Particle{
    
    PVector pos;
    PVector vel;
    PVector acc;
    int maxSpeed=2;
    PVector prevPos;

  public Particle(){
     pos = new PVector(random(width),random(height));
     vel = new PVector(0,0);
     acc = new PVector(0,0);  
  } 
  
  public void follow(PVector[] vectors ){
    int x = floor((pos.x)/scl);
    int y = floor((pos.y)/scl);
    
    int index= (x+y*(cols));
 //<>//
    PVector force = vectors[index];

    applyForce(force);
  }
  
  public void update(){
        vel.add(acc);
        vel.limit(maxSpeed);
        pos.add(vel);
        acc.mult(0);
        checkEdge();
  }
   
  public void applyForce(PVector force){
        acc.add(force); //<>//
  }
  
  public void show(){
        stroke(255,5);
        strokeWeight(2);
        point(pos.x,pos.y);   
  }
  
  public void checkEdge(){
    if(pos.x>width){
      pos.x=0;
      //updatePrev();
    }
    if(pos.x<0){
      pos.x=width-1;
      //updatePrev();
    }
    if(pos.y>height){
     pos.y=0;
     //updatePrev();
    }
    if(pos.y<0){
     pos.y=height-1; 
    // updatePrev();
    }
  }
}
