class Texts{
  PFont headFont;
  PFont overFont;
  PFont countFont;
  int oldCount, fontSize =24;
  
  Texts(){
    headFont = createFont("Arial", 31, true);
    overFont = createFont("Arial", 48, true);
    countFont = createFont("Helvetica", 48, true);
    oldCount = 0;
  }
  
  void headsUpDisplay(){
    textAlign(CENTER);
    fill(255);
    textFont(headFont);
    text("Score: " + score, 100, 50);
    text("Lives: " + lives, width/2, 50);
    text("Sharks: " + sklives, width/2+300, 50);
    
  }
  
  void intro() {
    background(0);
    textFont(headFont, 40);
    textAlign(CENTER);
    text("Shark Attack", width/2, height/2);
    textFont(headFont, 14);
    text("Survive by eating smaller fish", width/2, height/2 +30);
    text("Avoid being eaten by shark. Kill shark by biting its tail", width/2, height/2 + 60);
    text("Press ENTER to start", width/2, height/2 + 100); 
  }
  
  void gameOver(){
    background(0);
    textFont(overFont, 60);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textFont(overFont, 20);
    text("Final Score: " + score, width/2, height/2 + 30);
  }
  
    void win(){
    background(0);
    textFont(overFont, 60);
    fill(255);
    textAlign(CENTER);
    text("You Win", width/2, height/2);
    textFont(overFont, 20);
    text("Final Score: " + score, width/2, height/2 + 30);
  }
  
  void countDownDisplay(int timer){
    if(oldCount == timer){
      fontSize +=5;
    }else{
      oldCount = timer;
      fontSize = 28;
    }
    
    textFont(countFont, fontSize);
    textAlign(CENTER);
    if(timer>0){
      text(timer, width/2, height/2);
    }else{
      text("Start!", width/2, height/2);
    } 
  }
  
}
