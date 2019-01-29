//Variable Table
//text
PFont instructions;
String title = "Monster Maze"; //Title text
//Buttons
String instruction = "Instructions"; //Instructions text
String play = "Play Game"; //Play game text
String options = "Options"; //options text
//Instructions
String move = "Moving:"; //instructions: moving text
String left = "Left Key = Left";  //instructions: left text
String right = "Right Key = Right";  //instructions: right text
String up = "Up Key = Up";  //instructions: up text
String down = "Down Key = Down";  //instructions: down text
//Gameplay text
String score = "Score:"; //Score text
String lives = "Lives count:"; //Lives count text
String good = "GOOD JOB"; //Good job text
String next = "NEXT LEVEL"; //Next level
//colours
color red = color(255, 0, 0);
color green = color(0, 255, 0);
color blue = color(0, 0, 255);
color lblue = color(0, 255, 255);
color orange = color(255, 128, 0);
color white = color(255);
color black = color(0);
color grey = color(100);
//other
int stage = 0; //stage
PImage maze; //Level One
PImage maze2; //Level Two
PImage maze3; //Level Three
//Level 1
int x = 232; 
int y = 30;
//Level 2
int x1 = 252; 
int y1 = 40;
//Level 3
int x2 = 238; 
int y2 = 40;
int Score = 0; //score
int Lives = 0; //lives
void setup () 
{
  size(500, 500);
  //maze
  maze = loadImage("MazeLevel1.png"); //load image
  maze2 = loadImage("MazeLevel2.png"); //load image
  maze3 = loadImage("MazeLevel3.png"); //load image
  //text
  instructions = loadFont("MyriadWebPro-20.vlw");
}
void draw () 
{
  //main menu
  if(stage == 0) 
  {
    background(0);
    fill(100); //button colour
    rect(10, 420, 150, 70); //instructions button
    rect(170, 420, 160, 70); //play game button
    rect(340, 420, 150, 70); //options button
    fill(255); // white text colour
    textSize(40); //text size
    text(title, 110, 200); //title text
    textSize(20); //text size
    text(instruction, 25, 462); //instructions text
    text(play, 200, 462); //play game text
    text(options, 380, 462); //options text
  }
  //instructions 
  if(stage == 1) 
  {
    fill(0);
    rect(0, 0, 500, 500); 
    fill(255);
    textFont(instructions);
    text(move, 20, 20);
    text(left, 20, 40);
    text(right, 20, 60);
    text(up, 20, 80);
    text(down, 20, 100);
    fill(255, 0, 0);
    rect(480, 0, 20, 20);  
  }
  //options
  if(stage == 2) 
  {
    background(0);
    fill(red);
    rect(35, 100, 70, 70);
    fill(blue);
    rect(125, 100, 70, 70);
    fill(green);
    rect(215, 100, 70, 70);
    fill(orange);
    rect(305, 100, 70, 70);
    fill(lblue);
    rect(395, 100, 70, 70);
    fill(red);
    rect(480, 0, 20, 20);    
  }
  //play game(Level 1)
  if(stage == 3) 
  {
    //gameplay setup
    background(white); //white background
    fill(red); //red text of Score and Lives count
    textSize(15); //Text Size
    text(score, 130, 460); //Score text
    text(Score, 180, 460); //Score display
    text(lives, 300, 460); //Lives count text
    text(Lives, 390, 460); //Lives count display
    image(maze,50,30); //Maze 1 
    fill(red); //red colour of character
    strokeWeight(0); //no stroke for character and end rectangle
    float touch = red(get(x,y)); //touch
    ellipse(x,y,10,10); //character
    fill(100); //grey colour of end rectangle
    rect(253, 410, 32, 20); //end rectangle
    fill(red);
    rect(480, 0, 20, 20); 
    strokeWeight(2);
    //monsters
    //monster #1
    //monster #2
  if(touch == 0) //touching black wall
  {
    //restart position
    x = 232;
    y = 30;
    //add to lives count
    Lives = Lives + 1;
    //minus 10 points
    Score = Score - 10;
  }
  float touch1 = red(get(x,y)); //touch end rectangle
  if(touch1 == 100) //when character touches end rectangle
  {
    //character position after touching end rectangle
    x = 230;
    y = 425;
    Score = Score + 100; //add 100 to score 
  }
  if(y == 425)
  {
    //Good Job text
    fill(grey);
    rect(0, 190, 500, 70);
    fill(red);
    textSize(70); //text size
    text(good, 70, height*0.5); //Good Job text
    //Next Level Button
    fill(grey); //colour of next level button
    rect(150, 340, 200, 50); //next level button
    fill(black);  //colour of text
    textSize(30); //text size
    text(next, 165, 375); //Next Level Text    
  }
  }
 
 
}

void mousePressed () {
  //red exit box function
  if((mousePressed == true) && (mouseX >480 && mouseX <500 && mouseY >0 && mouseY <20))
    {
      stage = 0;
    }
  //instructions button function
  if((mousePressed == true) && (mouseX >10 && mouseX <160 && mouseY >420 && mouseY <490))
  {
    stage = 1;
  }
  //options button function
  if((mousePressed == true) && (mouseX >340 && mouseX <490 && mouseY >420 && mouseY <490))
  {
    stage = 2;
  }
  //play button function (Level 1)
  if((mousePressed == true) && (mouseX >170 && mouseX <330 && mouseY >420 && mouseY <490))
  {
    stage = 3;
  }
}

void keyPressed () //Controls
{
  if((key == CODED) && (keyCode == UP)) //UP
  {
    y=y-3;
  }
  if((key == CODED) && (keyCode == DOWN)) //DOWN
  {
    y=y+3;
  }
  if((key == CODED) && (keyCode == RIGHT)) //RIGHT
  {
    x=x+3;
  }
  if((key == CODED) && (keyCode == LEFT)) //LEFT
  {
    x=x-3;
  }
}
    