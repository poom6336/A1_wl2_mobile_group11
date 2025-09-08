//68-010126-1042-1
//A1_Bomb

//global variables

int x = int(random(0,width)); //random position of x
int y = 0;
int stage = 10;
int count = 0;

//setup canvas

void setup(){
    size(width,height);
}

//draw player

void draw_player(int x,int y){
    ellipse(x,y,100,100);
}

//draw enemy object

void draw_bomb(int x, int y){
    //global variables
    // x : for position of the bomb to make the bomb appear in random location
    // y : for position of the bomb to make the bomb fall 
    ellipse(x,y,50,50);
}

//calculate distance between two position

float cal_distance(int x1,int y1,int x2,int y2){
    //global variables
    // x and y of the bomb
    // posx and posy of player
    int diffx=abs(x1-x2);
    int diffy=abs(y1-y2);
    return sqrt((diffx*diffx)+(diffy*diffy)); //return distance
}

//draw score

void draw_score(int score){
  //global variable
  //count : count score for each bomb player had dodge
  int i = 0;
  int x = 10;
  while (i<score){
    line(x,20,x,40);
    x+=10;
    i+=1;
  }
}

//main game

void draw(){
    background(200);
    
    //local variables
    int posx = mouseX; 
    int posy = height-50;
    
    draw_score(count);       //draw score for each bomb player had dodge
    draw_player(posx, posy); //draw player
    draw_bomb(x, y);         //draw bomb to fall from random position
    y = y + stage;           //make the bomb fall faster for each one player dodge
    
    if(y > height){          //when bomb fall to the bottom
        count+=1;
        x = int(random(0,width)); //random position for the bomb
        if(stage < 100){      //make the bomb fall faster
            stage+=5;
        }
        y = 0;               //reset the bomb to the top
    }
    
    if (cal_distance(posx,posy,x,y) <= 75){ //if player touch bomb
        count-=1;            //reduce score
        stage-=5;            //reduce bomb's falls speed
        
        if (count < 0){      //score can't reduce to below zero
            count = 0;
        }
        
        if (stage < 5){      //stage can't reduce to below 2
            stage = 5;
        }
        
        x = int(random(0,width));  //random x position for bomb when spawn new bomb
        y = 0;               //reset bomb y position to the top
    }
}
