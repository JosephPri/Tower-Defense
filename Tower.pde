//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Laser Tower: These towers automatically target the first
//              mob no matter where they are on the scren.


class Tower {

  final int PLACING = 0;
  final int PLACED = 1;

  final int GUN = 2;
  final int AOE = 3;
  final int LASER = 4;

  float x, y;
  int cooldown, threshold, towerMode, towerType;

  Tower(float _x, float _y, int c, int th, int tt) { //add type variable
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
    towerType = tt;
  }
  void show() {
    if (towerType == GUN) {
      stroke(rockgreyd);
      strokeWeight(4);
      if (towerMode == PLACED) {
        fill(foxredd);
        rect(x, y, 59, 20);
        rect(x, y, 20, 59);
        fill(rockgreyl);
        rect(x, y, 45, 45, 7);
      } else if (towerMode == PLACING) {
        fill(rockgreyl);
        pushMatrix();
        translate(-mouseX/4, -mouseY/4);
        scale(1.25);
        fill(foxredd);
        fill(foxredd);
        rect(mouseX, mouseY, 59, 20);
        rect(mouseX, mouseY, 20, 59);
        fill(rockgreyl);
        rect(mouseX, mouseY, 45, 45, 7);
        popMatrix();
        if (mousePressed) {
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }
    if (towerType == AOE) {
      stroke(rockgreyd);
      strokeWeight(4);
      fill(0, 0, 255);
      if (towerMode == PLACED) {
        if (cooldown < 80 && cooldown > 13) { //cooldown between 0 and 13
          drawAoe();
        }
        if (mode == BUILD || mobs.size() == 0) {
          drawAoe();
        }
      } else if (towerMode == PLACING) {
        pushMatrix();
        translate(-mouseX/4, -mouseY/4);
        scale(1.25);
        fill(foxredd);
        triangle(mouseX+25, mouseY+25, mouseX+12, mouseY+22, mouseX+22, mouseY+12);
        triangle(mouseX+25, mouseY-25, mouseX+12, mouseY-22, mouseX+22, mouseY-12);
        triangle(mouseX-25, mouseY-25, mouseX-12, mouseY-22, mouseX-22, mouseY-12);
        triangle(mouseX-25, mouseY+25, mouseX-12, mouseY+22, mouseX-22, mouseY+12);
        fill(rockgreyl);
        circle(mouseX, mouseY, 50);
        popMatrix();
        if (mousePressed) {
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }
    if (towerType == LASER) {
      stroke(rockgreyd);
      strokeWeight(4);
      fill(foxredd);
      if (towerMode == PLACED) {
        fill(rockgreyl);
        circle(x, y, 50);
        circle(x, y, 15);
        fill(foxredd);
        circle(x, y, 12);
      } else if (towerMode == PLACING) {
        pushMatrix();
        translate(-mouseX/4, -mouseY/4);
        scale(1.25);
        fill(rockgreyl);
        circle(mouseX, mouseY, 50);
        circle(mouseX, mouseY, 15);
        fill(foxredd);
        circle(mouseX, mouseY, 12);
        popMatrix();
        if (mousePressed) {
          towerMode = PLACED;
          x = mouseX;
          y = mouseY;
        }
      }
    }
  }

  void act() {
    cooldown = cooldown + 1*multiplier;
    if (towerType == GUN) {
      if (cooldown >= threshold) {
        cooldown = 0;
        if (mobs.size() > 0) {
          bullets.add(new Bullet(x, y, 0, -10, 0)); //UP
          bullets.add(new Bullet(x, y, 0, 10, 0)); //DOWN
          bullets.add(new Bullet(x, y, -10, 0, 0)); //LEFT
          bullets.add(new Bullet(x, y, 10, 0, 0)); //RIGHT
        }
      }
    }
    if (towerType == AOE) {
      if (cooldown >= threshold) {
        cooldown = 0;
        if (mobs.size() > 0) {
          bullets.add(new Bullet(x, y, 10, 0, 1));
        }
      }
    }
    if (towerType == LASER) {
      if (cooldown >= threshold) {
        cooldown = 0;
        if (mobs.size() > 0) {
          bullets.add(new Bullet(x, y, 10, 0, 2));
        }
      }
    }
  }

  void drawAoe() {
    fill(foxredd);
    triangle(x+25, y+25, x+12, y+22, x+22, y+12);
    triangle(x+25, y-25, x+12, y-22, x+22, y-12);
    triangle(x-25, y-25, x-12, y-22, x-22, y-12);
    triangle(x-25, y+25, x-12, y+22, x-22, y+12);
    fill(rockgreyl);
    circle(x, y, 50);
  }
}
