// subclass of KingFish
class Enemy extends KingFish {

  
  
  Enemy(float x, float y, float chgX, float chgY, float sz) {
    super(x, y, chgX, chgY, sz);
    
    }

 


  boolean checkHeadOn(KingFish otherKingFish) {
    if(changeX*otherKingFish.changeX < 0 && abs(fishY-otherKingFish.fishY)< max(bSize/8,otherKingFish.fishY/8)) {
      return true;
    }
    return false;
  }
  
  //Methods for move left, rigth, up & down
   void moveEnemy() {
    wave+=waveSpeed;
    fishX += changeX;
    fishY += changeY+sin(wave)*amp;
  }
  
    
    void respawnEnemy() {
    //Here we will check to see if our bug "i" hits the wall
    if (fishX+bSize/2 > width ) {
      //If it did, we will reset it's position to the wall and reverse it's direction
      fishX = random(700, 800)-bSize/2;
      fishY = random(0, 600);
      changeX *= -1;
    }
    if (fishX-bSize < 0 && alive) {
      fishX = random(0, 00)+bSize;
      fishY = random(0, 600);
      changeX *= -1;
    }
    if (fishY+bSize/2> height && alive) {
      fishY = height-bSize/2;
      changeY *= -1;
    }
    if (fishY-bSize/2 < 0 && alive) {
      fishY = bSize/2;
      changeY *= -1;
    }
  }
  
  
  //Override parent's drawKingFish method
  void drawEnemy() {
    
 
    //call parent's drawKingFish() method to draw a regular KingFish
    super.drawKingFish();
    //Draw a center bigger dot on top of parent's version 
    pushMatrix();  //save the current coordinate system 
    translate(fishX, fishY);
    if(alive) {    //if the KingFish is alive draw it as a normal KingFish
      //make the KingFish rotate
      if( changeX <0 ) {
        rotateY(PI);
      } 

  bSize = 100;


  //-----Tail----- 
  fill(0,0,0);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.40, -bSize*0.80, 0, -bSize*1.10, bSize*0.40);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.30, -bSize*0.80, 0, -bSize*1.10, bSize*0.30);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.20, -bSize*0.80, 0, -bSize*1.10, bSize*0.20);
  line(-bSize*0.80, 0, bSize*0.06, 0); 

 
  //-----Fins-----
  //Upper 
  fill(0,0,0);
  curve(bSize*0.10, bSize*3.50, 0, -bSize*0.20, bSize*0.40, -bSize*0.20, bSize*0.10, bSize*0.10);

  //LowerBody

  curve(bSize*0.10, -bSize*3, 0, bSize*0.20, bSize*0.35, bSize*0.20, bSize*0.10, -bSize*0.10);

 //-----Body Parts-----

  //mouth
  fill(0,0,0);
  rect(bSize*0.6, bSize*0.2, bSize*0.35, bSize*0.1);
  
  //body
  ellipse(0, 0, bSize*1.1, bSize*0.7);
  
  //head
  curve(bSize*0.15, bSize*4, bSize*0.25, 0, bSize*1.2, 0, bSize*0.15, bSize*0.10);
  curve(bSize*0.15, -bSize*4, bSize*0.25, 0, bSize*1.2, 0, bSize*0.15, -bSize*0.10);

  //Fish Eye and Nose
  fill(255);
  ellipse(bSize*0.70, -bSize*0.05, bSize*0.30, bSize*0.30);
  ellipse(bSize*0.80, 0, bSize*0.03, bSize*0.03);
  fill(0);
  ellipse(bSize*0.75, -bSize*0.05, bSize*0.15, bSize*0.15);   
 
             
     


    }
    popMatrix();  //restore the coordinate system to previous state
  }
}

