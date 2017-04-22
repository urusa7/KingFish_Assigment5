// subclass of KingFish
class AvatarKingFish extends KingFish {
  int countDownTimer;
  int respawnTimer;
  int transparent;
  color fishFillColor;
  
  AvatarKingFish(float x, float y, float chgX, float chgY, float sz) {
    super(x, y, chgX, chgY, sz);
    alive = true;
    countDownTimer = 120;
    respawnTimer = 90;
    transparent = 255;
    
    fishFillColor = color(165,0,0);
  }
  
  int countDown(){
    if(countDownTimer > 0){
      countDownTimer --;
      return countDownTimer/30;
    }else{
      return -1;
    }
  }

  //method eat: eat the other fish if bigger otherwise kill itself
  void eat(KingFish otherKingFish) {
    if(bSize > otherKingFish.bSize) {
      //grow itself by 10%
      bSize *= 1.1;
    
      //kill the other fish
      //otherKingFish.alive = false;
      otherKingFish.destroy(fishs);
    }   
    else {
      this.alive = false;
      drawWaves();
    }
  }
  //method for drawing traces after avatar was killed
  void drawWaves() {
    stroke(200, 0, 0);
    noFill();
    for(int i=1; i<=2; i++) {
      ellipse(fishX, fishY, i*bSize, i*bSize);
    }
  }

  boolean checkHeadOn(KingFish otherKingFish) {
    if(changeX*otherKingFish.changeX < 0 && abs(fishY-otherKingFish.fishY) < max(bSize/8,otherKingFish.fishY/8)) {
      return true;
    }
    return false;
  }
  
    boolean checkTailOn(KingFish otherKingFish) {
    if(changeX*otherKingFish.changeX > 0 && dist(fishX, fishY, otherKingFish.fishX, otherKingFish.fishY) < (bSize + otherKingFish.bSize + 300))  {
      return true;
    }
    return false;
  }
  
  //Methods for move left, rigth, up & down
  void moveRigtht(){
    if(changeX < 0)changeX *= -1;
    fishX += changeX;
  }
  
  void moveLeft(){
    if(changeX > 0)changeX *= -1;
    fishX += changeX;
  }
  
  void moveUp(){
    fishY -= changeY;
  }
  void moveDown(){
    fishY += changeY;
  }
  
  //Override parent's drawKingFish method
  void drawKingFish() {
    
    if(countDownTimer <=0){
     
      if(respawnTimer >0){
        
        if(respawnTimer%10==0){
          transparent = 255;
          fishFillColor = color(165,0,0);
        }else{
          //transparent = 0;
          fishFillColor = color(30,178, 30);
        }
        respawnTimer --;
      }
    else{
      transparent = 255;
      fishFillColor = color(165,0,0);
    }
    }
    
    //call parent's drawKingFish() method to draw a regular fish
    super.drawKingFish();
    //Draw a center bigger dot on top of parent's version 
    pushMatrix();  //save the current coordinate system 
    translate(fishX, fishY);
    if(alive) {    //if the fish is alive draw it as a normal fish
      //make the fish rotate
      if( changeX <0 ) {
        rotateY(PI);
      } 
      
     
  //-----Tail----- 
 // fill(fColor);
  fill(fishFillColor, transparent);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.40, -bSize*0.80, 0, -bSize*1.10, bSize*0.40);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.30, -bSize*0.80, 0, -bSize*1.10, bSize*0.30);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.20, -bSize*0.80, 0, -bSize*1.10, bSize*0.20);
  line(-bSize*0.80, 0, bSize*0.06, 0); 

 
  //-----Fins-----
  //Upper 
//  fill(fColor);
  fill(fishFillColor, transparent);
  curve(bSize*0.10, bSize*3.50, 0, -bSize*0.20, bSize*0.40, -bSize*0.20, bSize*0.10, bSize*0.10);

  //LowerBody

  curve(bSize*0.10, -bSize*3, 0, bSize*0.20, bSize*0.35, bSize*0.20, bSize*0.10, -bSize*0.10);

 //-----Body Parts-----

  //mouth
  //fill(fColor);
  fill(fishFillColor, transparent);
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


