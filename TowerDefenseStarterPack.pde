//Tower Defense Game
//Joseph Priatel
//Programming 12
// ================ GLOBAL VARIABLES =================
final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;

int mode;
int lives = 3;
int cashmoney = 100;
float textsize;
float angle;


//Pallette
color white = #ffffff;
color black = #000000;
color grassgreen = #168564;
color rockgreyl = #324c53;
color rockgreyd = #2a4346;
color foxredl = #e84c5f;
color foxredd = #983b3c;

//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button waveButton;
Button buildButton;
Button playButton;
Button buyGunTowerButton;
Button buyAoeTowerButton;
Button buyLaserTowerButton;
Button map1Button;
Button map2Button;
Button speed1xButton;
Button speed2xButton;

//Collections of objects
Node[] nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
Gif introAnimation;
PImage playb;
PImage map1;
PImage map2;

//Fonts
PFont retroica;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  frameRate(60);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  textsize = 100;
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introAnimation = new Gif("fox", 77, 1, width/2, height/2, width, height);
  playb = loadImage("Images/play.png");
  map1 = loadImage("Images/map1rounded.png");
  map2 = loadImage("Images/map2rounded.png");
  //Load Fonts
  retroica = createFont("Fonts/IntegralCF-Medium.ttf", 175); //Font
  //Create Collections of Objects
  mobs = new ArrayList<Mob>(0);
  mobCount = mobs.size();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
}

void makeButtons() {
  //INTRO - Start
  start = new Button("PLAY", 500, 575, 400, 200, #6bd6b5, #e9fffa);

  //PLAY - Next Wave, To Build Mode
  waveButton = new Button(playb, 900, 100, 150, 150, #7BCAB2, #94E3CC);
  buildButton = new Button("", 900, 330, 150, 150, #7BCAB2, #94E3CC);
  speed1xButton = new Button("", 900, 505, 150, 150, #7BCAB2, #94E3CC);
  speed2xButton = new Button("", 900, 680, 150, 150, #7BCAB2, #94E3CC);
  
  map1Button = new Button(map1, 250, 300, 400, 400, #7BCAB2, #94E3CC);
  map2Button = new Button(map2, 750, 300, 400, 400, #7BCAB2, #94E3CC);

  //BUILD - To play mode, Buy Laser, Buy Gun, Buy AoE
  playButton = new Button("", 900, 100, 150, 150, #7BCAB2, #94E3CC);
  buyGunTowerButton = new Button("", 900, 330, 150, 150, #7BCAB2, #94E3CC);
  buyAoeTowerButton = new Button("", 900, 505, 150, 150, #7BCAB2, #94E3CC);
  buyLaserTowerButton = new Button("", 900, 680, 150, 150, #7BCAB2, #94E3CC);

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[14];
  //Map 1
  nodes[0] = new Node(175, 525, 0.70711, 0.70711, 45, 1);
  nodes[1] = new Node(300, 650, 1, 0, 0, 1);
  nodes[2] = new Node(475, 650, 0, -1, 270, 1);
  nodes[3] = new Node(475, 175, -1, 0, 180, 1);
  nodes[4] = new Node(300, 175, 0, 1, 90, 1);
  nodes[5] = new Node(300, 350, 1, 0, 0, 1);
  nodes[6] = new Node(650, 350, 0, 1, 90, 1);
  nodes[7] = new Node(650, 525, 1, 0, 0, 1);

  //Map 2
  nodes[8] = new Node(175, 250, 0, 1, 90, 2);
  nodes[9] = new Node(175, 425, 1, 0, 0, 2);
  nodes[10] = new Node(350, 425, 0, 1, 90, 2);
  nodes[11] = new Node(350, 600, 1, 0, 0, 2);
  nodes[12] = new Node(525, 600, 0.70711, -0.70711, -45, 2);
  nodes[13] = new Node(700, 425, 1, 0, 0, 2);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
//  fill(white);
//  textSize(20);
//  text(mouseX + ", " + mouseY, mouseX+40, mouseY-20);
}
