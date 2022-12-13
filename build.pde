//This function draws the BUILD screen
float buildmodetexthue;
float insfundtexthue = 0;
float angle2;

int draw100;
int draw200;
int draw300;
int k = 0;
int o = 0;

boolean deduct100;
boolean deduct200;
boolean deduct300;

void build() {
  drawMaps();
  animateThings();
  drawBuildInterface();
  transactions();
  insufficientFunds();
}

void drawBuildInterface() {
  sidebar();
  playButton();
  buildModeText();
  buyGunButton();
  buyAoeButton();
  buyLaserButton();
}

void playButton() {
  playButton.show();
  fill(white);
  textSize(150/4);
  text("PLAY", 900, 100);
  if (playButton.clicked) {
    mode = PLAY;
    k = 0;
  }
}

void buyGunButton() {
  buyGunTowerButton.show();
  textSize(150/4);
  fill(white);
  text("GUN", 900, 325);
  textSize(18);
  text("$100", 900, 355);

  if (buyGunTowerButton.clicked && cashmoney >= 100 && !deduct100) {
    deduct100 = true;
    draw100 = cashmoney - 100;
    towers.add(new Tower(0, 0, 0, 65, 2));
  } else if (buyGunTowerButton.clicked && cashmoney < 100) {
    k = 80;
    insfundtexthue = 0;
  }
}

void buyAoeButton() {
  buyAoeTowerButton.show();
  textSize(150/4);
  fill(white);
  text("aoe", 900, 500);
  textSize(18);
  text("$200", 900, 530);

  if (buyAoeTowerButton.clicked && cashmoney >= 200 && !deduct200) {
    deduct200 = true;
    draw200 = cashmoney - 200;
    towers.add(new Tower(0, 0, 0, 75, 3));
  } else if (buyAoeTowerButton.clicked && cashmoney < 200) {
    k = 80;
    insfundtexthue = 0;
  }
}

void buyLaserButton() {
  buyLaserTowerButton.show();
  textSize(150/4.5);
  fill(white);
  text("laser", 900, 675);
  textSize(18);
  text("$300", 900, 703);

  if (buyLaserTowerButton.clicked && cashmoney >= 300 && !deduct300) {
    deduct300 = true;
    draw300 = cashmoney - 300;
    towers.add(new Tower(0, 0, 0, 180, 4));
  } else if (buyLaserTowerButton.clicked && cashmoney < 300) {
    k = 80;
    insfundtexthue = 0;
  }
}

void buildModeText() {
  buildmodetexthue = sin(angle2)*250;
  angle2 = angle2 + 0.075;
  fill(255, 255, 255, buildmodetexthue);
  textSize(75);
  text("BUILD MODE", 400, 80);
}

void transactions() {
  if (deduct100) {
    if (cashmoney > draw100) {
      cashmoney = cashmoney - 1;
    } else deduct100 = false;
  } else deduct100 = false;

  if (deduct200) {
    if (cashmoney > draw200) {
      cashmoney = cashmoney -2;
    } else deduct200 = false;
  } else deduct200 = false;

  if (deduct300) {
    if (cashmoney > draw300) {
      cashmoney = cashmoney -3;
    } else deduct300 = false;
  } else deduct300 = false;
}

void insufficientFunds() {
  if (k > 0) {
    textSize(40);
    fill(foxredl, insfundtexthue);
    text("Insufficient", 400, 700);
    text("Funds", 400, 750);
    k--;
  }
  if (k > 60 && k != 80) {
    insfundtexthue = insfundtexthue +25;
  }
  if (k < 20 && k > 0) {
    insfundtexthue = insfundtexthue -25;
  }
}
