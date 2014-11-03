int[][] slot;
boolean[][] flagSlot; // use for flag
int bombCount; 
int clickCount;
int flagCount; 
int nSlot; 
int totalSlots; 
final int SLOT_SIZE = 100; 

int sideLength; // SLOT_SIZE * nSlot
int ix; // (width - sideLength)/2
int iy; // (height - sideLength)/2

// game state
final int GAME_START = 1;
final int GAME_RUN = 2;
final int GAME_WIN = 3;
final int GAME_LOSE = 4;
int gameState;

// slot state for each slot
final int SLOT_OFF = 0;
final int SLOT_SAFE = 1;
final int SLOT_BOMB = 2;
final int SLOT_FLAG = 3;
final int SLOT_FLAG_BOMB = 4;
final int SLOT_DEAD = 5;

PImage bomb, flag, cross ,bg;

void setup(){
  size (640,480);
  textFont(createFont("font/Square_One.ttf", 20));
  bomb=loadImage("data/bomb.png");
  flag=loadImage("data/flag.png");
  cross=loadImage("data/cross.png");
  bg=loadImage("data/bg.png");

  nSlot = 4;
  totalSlots = nSlot*nSlot;
 
  slot = new int[nSlot][nSlot];
  
  sideLength = SLOT_SIZE * nSlot;
  ix = (width - sideLength)/2; // initial x
  iy = (height - sideLength)/2; // initial y
  
  gameState = GAME_START;
}

void draw(){
  switch (gameState){
    case GAME_START:
          background(180);
          image(bg,0,0,640,480);
          textSize(16);
          fill(0);
          text("Choose # of bombs to continue:",10,width/3-24);
          int spacing = width/9;
          for (int i=0; i<9; i++){
            fill(255);
            rect(i*spacing, width/3, spacing, 50);
            fill(0);
            text(i+1, i*spacing, width/3+24);
          }
          // check mouseClicked() to start the game
          break;
    case GAME_RUN:
          //---------------- put you code here ----
       /* 
             */
        
          // -----------------------------------
          break;
    case GAME_WIN:
          textSize(18);
          fill(0);
          text("YOU WIN !!",width/3,30);
          break;
    case GAME_LOSE:
          textSize(18);
          fill(0);
          text("YOU LOSE !!",width/3,30);
          
 /*         //===
if(gameState == GAME_WIN || gameState == GAME_LOSE){
 for(int col=0;col<4;col++){
   for(int row=0;row<4;row++){
     if(slot[col][row]==SLOT_FLAG &&  ) 
    
    
   }//end for row
 }//end for col

}
 */         //===
          
          break;
  }
}

int countNeighborBombs(int col,int row){
  // -------------- Requirement B ---------
  
   //
    int count = 0;
    if(col == 0){
      if(row == 0 ){
      for(int i=col ; i<(col+2);i++){
     for(int j=row ; j<(row+2);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
      }
      else if(row == 3){
      for(int i=col ; i<(col+2);i++){
     for(int j=row-1 ; j<(row+1);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
      }
      else{
      for(int i=col ; i<(col+2);i++){
     for(int j=row-1 ; j<(row+2);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
      }
    }//end of if col/row
    else if(col == 3){
      if(row == 0 ){
      for(int i=col-1 ; i<(col+1);i++){
     for(int j=row ; j<(row+2);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
      }
      else if(row == 3){
      for(int i=col-1 ; i<(col+1);i++){
     for(int j=row-1 ; j<(row+1);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
      }
      else{
      for(int i=col-1 ; i<(col+1);i++){
     for(int j=row-1 ; j<(row+2);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
      }
    }//end of if col/row
    else if(row==0 &&(col==1 || col==2)){
    for(int i=col-1 ; i<(col+2);i++){
     for(int j=row ; j<(row+2);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
    }
    else if(row==3 &&(col==1 || col==2)){
        for(int i=col-1 ; i<(col+2);i++){
     for(int j=row-1 ; j<(row+1);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
    }
    else{
   for(int i=col-1 ; i<(col+2);i++){
     for(int j=row-1 ; j<(row+2);j++){
       if(slot[i][j] == SLOT_BOMB){
       count++;
       
       }else{count = count ;}
     }
   }
    }//end else
   return count;
  
}

void setBombs(){
  // initial slot
  for (int col=0; col < nSlot; col++){
    for (int row=0; row < nSlot; row++){
      slot[col][row] = SLOT_OFF;
    }
  }
  // -------------- put your code here ---------
  // randomly set bombs
  for(int i =0 ;i < bombCount ; i++){
    int rcol = int(random(4));
    int rrow = int(random(4));
    slot[rcol][rrow] = SLOT_BOMB;
     //secrectly remember the bombs' location 
   /* ==
    if(slot[rcol][rrow] == SLOT_BOMB){//maybe the bomb duplicated assign
     rcol = int(random(5));
     rrow = int(random(5));
    } */  
      
   //   println(rcol,rrow);
    
  }
 
  // ---------------------------------------
}

void drawEmptySlots(){
  background(180);
  image(bg,0,0,640,480);
  for (int col=0; col < nSlot; col++){
    for (int row=0; row < nSlot; row++){
        showSlot(col, row, SLOT_OFF);
    }
  }
}

void showSlot(int col, int row, int slotState){
  int x = ix + col*SLOT_SIZE;
  int y = iy + row*SLOT_SIZE;
  switch (slotState){
    case SLOT_OFF:
         fill(222,119,15);
         stroke(0);
         rect(x, y, SLOT_SIZE, SLOT_SIZE);
         break;
    case SLOT_BOMB:
          fill(255);
          rect(x,y,SLOT_SIZE,SLOT_SIZE);
          image(bomb,x,y,SLOT_SIZE, SLOT_SIZE);
          break;
    case SLOT_SAFE:
          fill(255);
          rect(x,y,SLOT_SIZE,SLOT_SIZE);
          int count = countNeighborBombs(col,row);
          if (count != 0){
            fill(0);
            textSize(SLOT_SIZE*3/5);
            text( count, x+15, y+15+SLOT_SIZE*3/5);
          }
      //     println(count);//
          break;
    case SLOT_FLAG:
          image(flag,x,y,SLOT_SIZE,SLOT_SIZE);
          break;
    case SLOT_FLAG_BOMB:
          image(cross,x,y,SLOT_SIZE,SLOT_SIZE);
          break;
    case SLOT_DEAD:
          fill(255,0,0);
          rect(x,y,SLOT_SIZE,SLOT_SIZE);
          image(bomb,x,y,SLOT_SIZE,SLOT_SIZE);
          break;
  }
}

// select num of bombs
void mouseClicked(){
  if ( gameState == GAME_START &&
       mouseY > width/3 && mouseY < width/3+50){
       // select 1~9
       //int num = int(mouseX / (float)width*9) + 1;
       int num = (int)map(mouseX, 0, width, 0, 9) + 1;
       // println (num);
       bombCount = num;
       
       // start the game
       clickCount = 0;
       flagCount = 0;
       setBombs();
       drawEmptySlots();
       gameState = GAME_RUN;
  }
}

void mousePressed(){
  if ( gameState == GAME_RUN &&
       mouseX >= ix && mouseX <= ix+sideLength && 
       mouseY >= iy && mouseY <= iy+sideLength){
    
    // --------------- put you code here ------- 
    for(int col=0; col < 4 ; col++){    
    if(mouseX >= (ix+ col*SLOT_SIZE) && mouseX <= ix+(col+1)*SLOT_SIZE){
      for(int row=0; row < 4 ; row++){
      if(mouseY >= (iy+ row*SLOT_SIZE) && mouseY <= iy+(row+1)*SLOT_SIZE){
   
        if(mouseButton == LEFT){
         /*
          for(int col=0;col<4;col++){
          for(int row=0;row<4;row++){
          if(slot[col][row]!=SLOT_BOMB){
          if(slot[col][row]!=SLOT_SAFE){
            if(clickCount>16){}
          }
          }
          }
          }
          */
          
         if((slot[col][row] != SLOT_BOMB) && (slot[col][row] != SLOT_SAFE)){           
            showSlot(col,row,SLOT_SAFE);           
            clickCount++;
              if(clickCount == (totalSlots-bombCount)){
              gameState = GAME_WIN;
              }
           
          }
          else if(slot[col][row] == SLOT_BOMB){
            showSlot(col,row,SLOT_DEAD);
            gameState = GAME_LOSE;
          }
          
         
         
       //  slot[n][k] = SLOT_SAFE ;
         //end of if(slot[n][k] == SLOT_BOMB)
      //showSlot(n,k,int(random(3)));
        }
    
     else if(mouseButton == RIGHT && (slot[col][row] != SLOT_SAFE ||  slot[col][row]== SLOT_BOMB)){
            if((flagCount < bombCount)&& slot[col][row] != SLOT_FLAG){
            showSlot(col,row,SLOT_FLAG);
            flagCount++;
           // println(flagCount);
            }else if(slot[col][row] == SLOT_FLAG){
              showSlot(col,row,SLOT_OFF);
              flagCount--;
            }          
            }   
 
   
    /*  
        if(slotState == SLOT_OFF){  
      //  showSlot(n,k,);}
     */
    }//end y if  
      }//end k for
    }//end x if
  
    }//end n for
    
    // -------------------------
    
  }
}

// press enter to start
void keyPressed(){
  if(key==ENTER && (gameState == GAME_WIN || 
                    gameState == GAME_LOSE)){
     gameState = GAME_START;
  }
}

/*
void showEnd(){
  if(slotState == SLOT_OFF){//only when game_lose
  
  }
}
*/
