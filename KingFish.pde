class KingFish {
  float fishX, fishY, changeX, changeY; 
  float bSize;
  boolean alive;
  float wave, waveSpeed, amp;
  color fColor;
  

  KingFish(float x, float y, float chgX, float chgY, float sz) {
    fishX = x; 
    fishY = y; 
    changeX = chgX; 
    changeY = chgY; 
    bSize = sz; 
    alive = true;
    
    fColor = color(random(255), random(255), random(255));
    wave=random(TWO_PI);
    amp=random(1, 4);
    waveSpeed=random(0.1, 0.5);
  }

  void drawKingFish() {
    //Drawing the fish 'i'
    pushMatrix();  //save the current coordinate system 
    translate(fishX, fishY);
    if(alive) {    //if the fish is alive draw it as a normal fish
      //make the fish rotate
      if( changeX <0 ) {
        rotateY(PI);
      } 





  //-----Tail----- 
  fill(0, 200, 0);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.40, -bSize*0.80, 0, -bSize*1.10, bSize*0.40);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.30, -bSize*0.80, 0, -bSize*1.10, bSize*0.30);
  quad(-bSize*0.50, 0, -bSize*1.10, -bSize*0.20, -bSize*0.80, 0, -bSize*1.10, bSize*0.20);
  line(-bSize*0.80, 0, bSize*0.06, 0); 
  
  //-----Fins-----
  //Upper 
  curve(bSize*0.10, bSize*3.50, 0, -bSize*0.20, bSize*0.40, -bSize*0.20, bSize*0.10, bSize*0.10);

  //LowerBody
  curve(bSize*0.10, -bSize*3, 0, bSize*0.20, bSize*0.35, bSize*0.20, bSize*0.10, -bSize*0.10);

  //LowerBody2
  curve(bSize*0.10, -bSize*2, -bSize*0.20, bSize*0.15, 0, bSize*0.15, bSize*0.10, -bSize*0.10);


  //-----Body Parts-----
  //Mouth    
  rect(bSize*0.92, bSize*0.03, bSize*0.10, bSize*0.10); 

  //BodyPart6  
  curve(-bSize*0.30, bSize*1.50, -bSize*0.55, 0, -bSize*0.25, 0, -bSize*0.30, bSize*0.10);
  curve(-bSize*0.30, -bSize*1.50, -bSize*0.55, 0, -bSize*0.25, 0, -bSize*0.30, -bSize*0.10);
  
  //BodyPart5
  curve(-bSize*0.05, bSize*2.50, -bSize*0.40, 0, bSize*0.10, 0, -bSize*0.05, bSize*0.10);
  curve(-bSize*0.05, -bSize*2.50, -bSize*0.40, 0, bSize*0.10, 0, -bSize*0.05, -bSize*0.10);
     
  //BodyPart4  
  curve(bSize*0.15, bSize*3, -bSize*0.25, 0, bSize*0.35, 0, bSize*0.15, bSize*0.10);
  curve(bSize*0.15, -bSize*3, -bSize*0.25, 0, bSize*0.35, 0, bSize*0.15, -bSize*0.10);

  //BodyPart3
  curve(bSize*0.15, bSize*4, -bSize*0.10, 0, bSize*0.65, 0, bSize*0.15, bSize*0.10);
  curve(bSize*0.15, -bSize*4, -bSize*0.10, 0, bSize*0.65, 0, bSize*0.15, -bSize*0.10);
  
  //BodyPart2
  curve(bSize*0.15, bSize*3.50, bSize*0.10, 0, bSize*0.65, 0, bSize*0.15, bSize*0.10);
  curve(bSize*0.15, -bSize*3.50, bSize*0.10, 0, bSize*0.65, 0, bSize*0.15, -bSize*0.10);
   
  //BodyPart1 
  curve(bSize*0.15, bSize*3, bSize*0.25, 0, bSize*0.85, 0, bSize*0.15, bSize*0.10);
  curve(bSize*0.15, -bSize*3, bSize*0.25, 0, bSize*0.85, 0, bSize*0.15, -bSize*0.10);
  
  
  //-----Fish Strip-----
  stroke(200, 200, 0);
  {
    line(-bSize*0.36, -bSize*0.14, bSize*0.70, -bSize*0.14);
    line(-bSize*0.36, bSize*0.14, bSize*0.70, bSize*0.14);
    line(-bSize*0.55, 0, bSize*0.56, 0);
    line(-bSize*0.54, -bSize*0.07, bSize*0.57, -bSize*0.07);
    line(-bSize*0.54, bSize*0.07, bSize*0.57, bSize*0.07);
  }
      
  stroke(0, 0, 0);
  
  //Gill
  curve(bSize*0.15, bSize*1.50, bSize*0.40, 0, bSize*0.75, 0, bSize*0.15, bSize*0.10);
  curve(bSize*0.15, -bSize*1.50, bSize*0.40, 0, bSize*0.75, 0, bSize*0.15, -bSize*0.10);
   
  //Dots
  stroke(0, 0, 255);
  ellipse(bSize*0.50, bSize*0.05, bSize*0.05, bSize*0.05);
  ellipse(bSize*0.50, -bSize*0.05, bSize*0.05, bSize*0.05);
  stroke(0, 0, 0);

  //Head 
  curve(bSize*0.35, bSize*2.50, bSize*0.55, 0, bSize*1.06, 0, bSize*0.35, bSize*0.10);
  curve(bSize*0.35, -bSize*2.50, bSize*0.55, 0, bSize*1.06, 0, bSize*0.35, -bSize*0.10);
     
  //Fish Eye and Nose
  fill(255);
  ellipse(bSize*0.90, -bSize*0.05, bSize*0.10, bSize*0.10);
  ellipse(bSize*1.00, 0, bSize*0.03, bSize*0.03);
  fill(0);
  ellipse(bSize*0.92, -bSize*0.05, bSize*0.07, bSize*0.07);  




      //Show enclosing circle
      noFill();
      stroke(0);
      //ellipse(0, 0, bSize+bSize/4, bSize);
    }
    popMatrix();  //restore the coordinate system to previous state
  }
  void update() {
    //change its position with randomized speed
    /*
    fishX += changeX;
    fishY += changeY;
    */
    
    wave+=waveSpeed;
    fishX += changeX;
    fishY += changeY+sin(wave)*amp;
  }
  
  void detectBound() {
    //Here we will check to see if our fish "i" hits the wall
    if (fishX+bSize/2 > width ) {
      //If it did, we will reset it's position to the wall and reverse it's direction
      fishX = width-bSize/2;
      changeX *= -1;
    }
    if (fishX-bSize < 0 && alive) {
      fishX = bSize;
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

  boolean detectCollision(KingFish otherKingFish) {

    if ( abs(fishX-otherKingFish.fishX)<(bSize/2+otherKingFish.bSize/2) && abs(fishY-otherKingFish.fishY)<(bSize/2+otherKingFish.bSize/2)) {
      return true;
    }
    return false;
  }
  
  void bounce(KingFish otherKingFish) {
    float angle = atan2( fishY - otherKingFish.fishY, fishX - otherKingFish.fishX);
    changeX = 1 * cos(angle);
    changeY = 1 * sin(angle);
    //and send the otherKingFish away in the opposite direction of our angle
    otherKingFish.changeX = 1 * cos(angle - PI);
    otherKingFish.changeY = 1 * sin(angle - PI);
  }
  
  void destroy(ArrayList fishs){
    fishs.remove(this);
  }
  
  
}
