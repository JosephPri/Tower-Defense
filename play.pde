//This function draws the PLAY screen
int waveCount = 1;
int mobCount = 0;
int mobSpawn;
int mobx = 0;
int map = 0;
int multiplier = 1;

void play() {
  drawMaps();
  animateThings();
  drawPlayInterface();
  speedButtons();
  transactions();
  lives();
  mapSelect();
}


void drawMaps() {
  if (map == 1) {
    drawMap1();
  }
  if (map == 2) {
    drawMap2();
  }
}

void drawPlayInterface() {
  sidebar();
  waveButton();
  buildButton();
  buildATowerText();
}

void mapSelect() {
  if (map == 0) {
    fill(#324c53);
    stroke(#2a4346);
    strokeWeight(15);
    rect(width/2, height/2, 1000, 800);
    map1Button.show();
    fill(white);
    textSize(125);
    text("MAP 1", 250, 600);
    if (map1Button.clicked) {
      map = 1;
    }
    map2Button.show();
    textSize(125);
    fill(white);
    text("MAP 2", 750, 600);
    if (map2Button.clicked) {
      map = 2;
    }
  }
}

void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      cashmoney = cashmoney + 25;
    } else {
      i++;
    }
  }

  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    myTower.act();
    myTower.show();
    i++;
  }
}

void sidebar() {
  strokeWeight(15);
  fill(#324c53);
  stroke(#2a4346);
  rect(900, 400, 185, 785);
  fill(white);
  textSize(20);
  text("Next Wave: "+waveCount, 900, 200);
  text("Money: $"+cashmoney, 900, 225);
}

void drawMap1() {
  background(grassgreen);
  //Path
  stroke(#6ed8b7);
  strokeWeight(30);
  line(0, 525, 175, 525);
  line(175, 525, 300, 650);
  line(300, 650, 475, 650);
  line(475, 650, 475, 350);
  line(475, 350, 475, 350);
  line(475, 350, 475, 175);
  line(475, 175, 300, 175);
  line(300, 175, 300, 350);
  line(300, 350, 475, 350);
  line(475, 350, 650, 350);
  line(650, 350, 650, 525);
  line(650, 525, 800, 525);

  //Rocks
  fill(rockgreyl);
  stroke(rockgreyd);
  strokeWeight(10);
  rect(100, 60, 175, 75, 10, 50, 30, 60);
  rect(125, 115, 75, 65, 50, 15, 40, 20);

  rect(615, 65, 75, 65, 60, 20, 15, 40);
  rect(680, 35, 175, 75, 10, 50, 30, 60);
  rect(650, 75, 75, 65, 60, 20, 15, 40);

  rect(570, 740, 65, 45, 15, 25, 10, 20);
}

void drawMap2() {
  background(grassgreen);
  //Path
  stroke(#6ed8b7);
  strokeWeight(30);
  line(-50, 250, 0, 250);

  line(0, 250, 175, 250);
  line(175, 250, 175, 425);
  line(175, 425, 350, 425);
  line(350, 425, 350, 600);
  line(350, 600, 525, 600);
  line(525, 600, 700, 425);
  line(700, 425, 850, 425);

  //Rocks
  fill(rockgreyl);
  stroke(rockgreyd);
  strokeWeight(10);
  rect(100, 60, 175, 75, 10, 50, 30, 60);
  rect(125, 115, 75, 65, 50, 15, 40, 20);

  rect(615, 65, 75, 65, 60, 20, 15, 40);
  rect(680, 35, 175, 75, 10, 50, 30, 60);
  rect(650, 75, 75, 65, 60, 20, 15, 40);

  rect(570, 740, 65, 45, 15, 25, 10, 20);
}

void waveButton() {
  waveButton.show();
  if (waveButton.clicked && mobs.size() == 0 && towers.size() > 0) {
    waveCount = waveCount + 1;
    mobCount = mobCount + 1;
    mobSpawn = mobCount;
    int i = 0;
    while (i < towers.size()) {
      Tower myTower = towers.get(i);
      myTower.cooldown = int(random(15, 70));
      i++;
    }
  } else if (waveButton.clicked && towers.size() == 0 ) {
    k = 80;
    insfundtexthue = 0;
  }
  if (map == 1) {
    if (waveCount < 5) {
      if (mobSpawn > mobs.size()) {
        mobs.add(new Mob(mobx, 525, 1, 0, 0));
        mobx = mobx - 55;
      } else {
        mobSpawn = 0;
        mobx = 0;
      }
    }
    if (waveCount > 4 && waveCount < 6) {
      if (mobSpawn > mobs.size()) {
        mobs.add(new Mob(mobx, 525, 1, 0, 1));
        mobx = mobx - 55;
      } else {
        mobSpawn = 0;
        mobx = 0;
      }
    }
    if (waveCount > 5) {
      if (mobSpawn > mobs.size()) {
        mobs.add(new Mob(mobx, 525, 1, 0, int(random(0, 3))));
        mobx = mobx - 55;
      } else {
        mobSpawn = 0;
        mobx = 0;
      }
    }
  }

  if (map == 2) {
    if (waveCount < 5) {
      if (mobSpawn > mobs.size()) {
        mobs.add(new Mob(mobx, 250, 1, 0, 0));
        mobx = mobx - 55;
      } else {
        mobSpawn = 0;
        mobx = 0;
      }
    }
    if (waveCount > 4 && waveCount < 6) {
      if (mobSpawn > mobs.size()) {
        mobs.add(new Mob(mobx, 250, 1, 0, 1));
        mobx = mobx - 55;
      } else {
        mobSpawn = 0;
        mobx = 0;
      }
    }
    if (waveCount > 5) {
      if (mobSpawn > mobs.size()) {
        mobs.add(new Mob(mobx, 250, 1, 0, int(random(0, 3))));
        mobx = mobx - 55;
      } else {
        mobSpawn = 0;
        mobx = 0;
      }
    }
  }
}

void buildButton() {
  buildButton.show();
  fill(white);
  textSize(150/4);
  text("BUILD", 900, 330);
  if (buildButton.clicked && mobs.size() == 0) {
    mode = BUILD;
    k = 0;
  }
}

void buildATowerText() {
  if (k > 0) {
    textSize(50);
    fill(foxredl, insfundtexthue);
    text("BUILD A TOWER!", 400, 400);
    k--;
  }
  if (k > 60 && k != 80) {
    insfundtexthue = insfundtexthue +25;
  }
  if (k < 20 && k > 0) {
    insfundtexthue = insfundtexthue -25;
  }
}

void lives() {
  fill(white);
  textSize(40);
  text("LIVES: "+lives, 400, 50);

  if (lives == 0) {
    mode = GAMEOVER;
  }
}

void speedButtons() {
  speed1xButton.show();
  fill(white);
  textSize(60);
  text("1X", 900, 500);
  textSize(18);
  text("SPEED", 900, 540);

  if (speed1xButton.clicked) {
    multiplier = 1;
  }
  speed2xButton.show();
  fill(white);
  textSize(60);
  text("2X", 900, 675);
  textSize(18);
  text("SPEED", 900, 715);

  if (speed2xButton.clicked) {
    multiplier = 2;
  }
}
