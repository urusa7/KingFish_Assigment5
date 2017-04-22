/*----------------------------------------------------------------------------
---------------------------------M A I N -------------------------------------
----------------------------------------------------------------------------*/

import processing.opengl.PGraphicsOpenGL;
import controlP5.*;

ControlP5 controlP5;
Button playButton;

float pondX=0, pondY=0, pondW=800, pondH=600;

Texts txt = new Texts();
int score = 0;
int lives = 5;
int sklives = 3;
int timer;


boolean win = false;
boolean gameStart = false;
boolean gameOver = false;
boolean playerMove = false;
boolean intro = true;

int count = 25;
int numKingFish = 1;


ArrayList fishs = new ArrayList();
Enemy [] Enemies = new Enemy [numKingFish];

AvatarKingFish avtKingFish;
Enemy enemy;

/*----------------------------------------------------------------------------
---------------------------------C O N T R O L -------------------------------
----------------------------------------------------------------------------*/

boolean downKey, upKey, leftKey, rightKey;
void keyPressed() {
  if (key == CODED && keyCode == RIGHT) rightKey = true;
  if (key == CODED && keyCode == LEFT) leftKey = true;
  if (key == CODED && keyCode == UP) upKey = true;
  if (key == CODED && keyCode ==DOWN) downKey = true;
  playerMove = true;
    if (keyCode == ENTER) {
    if(intro == true && gameOver == false)
    {
      intro = false;
      win = false;
    } 
    else if (intro == false && gameOver == true) {
      intro = true; 
      gameOver = false;
      win = false;
    }
  
}
}
void keyReleased() {
  if (key == CODED && keyCode == RIGHT) rightKey = false;
  if (key == CODED && keyCode == LEFT) leftKey = false;
  if (key == CODED && keyCode == UP) upKey = false;
  if (key == CODED && keyCode ==DOWN) downKey = false;
}

/*----------------------------------------------------------------------------
------------------ R E S P A W N     K I N G F I S H -------------------------
----------------------------------------------------------------------------*/

//method respawn: respawn self at randome location
AvatarKingFish respawn() {
  return new AvatarKingFish(width/2, height/2, 4, 4, 20);
}

Enemy erespawn() {
  return new Enemy(width/2, height/2, 4, 4, 20);
}

//Processing callbacks
void setup() {
  size(800, 600, OPENGL);
  smooth();
  
  for(int i=0; i<numKingFish; i++ ){
    Enemies[i] = new Enemy(random(width),random(height), random(-1,1),random(-1,1),random(12,36));
  }
  
  for (int i=0; i<count; i++) {
    fishs.add(new KingFish(random(width), random(height), random(-1, 1), random(-1, 1), random(12, 36)));
  }

   
  avtKingFish = respawn();

  
  controlP5 = new ControlP5(this);
  playButton = controlP5.addButton("Replay", 0, 370, 100, 60, 25);
  playButton.setColorLabel(color(0));
  playButton.setColorBackground(color(0, 255, 0));


}




void draw() {
  background(255);  //call background to redraw background
  fill(0, 0, 255);
  rect (pondX, pondY, pondW, pondH);  //draw pond

  if (gameOver) {
    txt.gameOver();
    controlP5.controller("Replay").show();
  }
  
    else if (intro) {
    score = 0;
    txt. intro();
    controlP5.controller("Replay").hide();
  }
  
    else if (win) {
    txt.win();
    controlP5.controller("Replay").show();
  }
  
  else {
    playGame();
    txt.headsUpDisplay();
    
    if(avtKingFish.countDown() >=0){
      txt.countDownDisplay(avtKingFish.countDown());
    }
     
    controlP5.controller("Replay").hide();
  }
}

void playGame() {
  //move avatar based on keypressed
  if (rightKey) avtKingFish.moveRigtht();  // Right Key to move avatar right
  if (leftKey) avtKingFish.moveLeft();    // Left Key to move avatar left
  if (upKey) avtKingFish.moveUp();        // Up Key to move avatar up
  if (downKey) avtKingFish.moveDown();      // Down Key to move avatar up

  avtKingFish.detectBound();

  avtKingFish.drawKingFish();
  
  
  
/*----------------------------------------------------------------------------
---------------------------- S H A R K   C O D E -----------------------------
----------------------------------------------------------------------------*/

    for(int i=0; i<numKingFish; i++){
    
    //move wave  
    Enemies[i].moveEnemy();
    //bound
    Enemies[i].respawnEnemy(); 
    
     if(sklives == 3) 
               
       {
         Enemies[i].alive = true; 
         Enemies[i].respawnEnemy();  
       }
    
      for (int k = 0; k < numKingFish; k++) {
        
         if(avtKingFish.detectCollision(Enemies[k]) && avtKingFish.checkTailOn(Enemies[k]) && Enemies[k].alive) {
     
         if(frameCount > timer || timer == 0) {
       
 
           if(sklives >= 1) {
              sklives -= 1;
              timer= frameCount+30;
             }
             
        
            if(sklives < 1) {
            Enemies[k].alive = false;
            score += 400;
            lives += 1;
             }
     
      }
    }
        
        
      if(Enemies[k].alive && avtKingFish.detectCollision(Enemies[k]) && avtKingFish.checkHeadOn(Enemies[k])) {
        
               avtKingFish = respawn();

      }
      //This statement can be understood as:
      //If bug "i" and bug "k" are alive and touching at their edges
      //or intersecting each other AND bug "i" is not bug "k"
      if(Enemies[i].alive && Enemies[k].alive && i != k) {
        
              
        if(Enemies[i].detectCollision(Enemies[k])) {
        Enemies[i].bounce(Enemies[k]);
        }
 
      }
       
       
      
          
 
    }
    Enemies[i].drawEnemy();
    }
  
  
/*----------------------------------------------------------------------------
---------------------------- S H A R K   C O D E -----------------------------
----------------------------------------------------------------------------*/
  
  
  
  
  
  
  //Loop through the array to draw and move the fishs one by one
  for (int i=0; i<fishs.size(); i++) {
    KingFish fishi = (KingFish) fishs.get(i);

    //change its position with randomized speed
    fishi.update();

    //Here we will check to see if our fish "i" hits the wall
    fishi.detectBound();

    //This loop will loop over every fish, here is where we check for a collision
    for (int k = 0; k < fishs.size(); k++) {
      KingFish fishk = (KingFish) fishs.get(k);

      if (playerMove && fishk.alive && avtKingFish.detectCollision(fishk) && avtKingFish.checkHeadOn(fishk)) {

        avtKingFish.eat(fishk);
        //If the avatar fish is dead, respawn
        if (!avtKingFish.alive) {
          lives--;
          if (lives <= 0) lives = 0;
          if (lives == 0) {
            gameOver = true;
          }
          else {
            avtKingFish = respawn();
            playerMove = false;
          }
        }
        

     if (score > 600) {
        win = true;
     }
        
/*----------------------------------------------------------------------------
---------------------- D I F F E R N T   S C O R E ---------------------------
----------------------------------------------------------------------------*/
                
        else if(fishk.bSize/avtKingFish.bSize >= 0.95 && fishk.bSize/avtKingFish.bSize <= 1) 
        {
           score += 40;
        }
        
        else if(fishk.bSize/avtKingFish.bSize >= 0.5 && fishk.bSize/avtKingFish.bSize < 0.95) 
        {
          score += 20;
        }
          
       else if(fishk.bSize/avtKingFish.bSize < 0.5) 
       {
          score += 10;
       }    
        
     
        
      }
      //This statement can be understood as:
      //If fish "i" and fish "k" are alive and touching at their edges
      //or intersecting each other AND fish "i" is not fish "k"
      if (fishi.alive && fishk.alive && i != k) {
        if (fishi.detectCollision(fishk)) {
          fishi.bounce(fishk);
        }
      }
    }
    fishi.drawKingFish();
  }
}


 
   
void controlEvent(ControlEvent theEvent){
  if(theEvent.controller().name() == "Replay"){
    score = 0;
    lives = 5;
    sklives = 3;
    intro = false;
    gameOver = false;
    playerMove = false;
    win = false;
    avtKingFish = respawn();

    

    
  }
      
}

