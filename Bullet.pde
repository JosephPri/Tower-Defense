//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.


class Bullet {
  float x, y, vx, vy, d, p, hp, aoehue;
  float towerangle = 0;
  int  bulletType;



  Bullet(float _x, float _y, float _vx, float _vy, int bt) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 18;
    hp = 1;
    p = 55;
    bulletType = bt;
    
    if (bulletType == 1) {
    aoehue = 255;
    }
    if (bulletType == 2) {
    aoehue = 0;
    }
  }
  void show() {
    if (bulletType == 0) {
      stroke(foxredd);
      strokeWeight(2);
      fill(foxredl);
      circle(x, y, d);
    }
    if (bulletType == 1) {
      if (aoehue > 0) {
        aoehue = aoehue - 19*multiplier;
      }
      strokeWeight(0);
      stroke(rockgreyd);
      fill(255, 255, 255, aoehue);
      circle(x, y, p);
      strokeWeight(4);
      pushMatrix();
      translate(x, y);
      rotate(radians(towerangle));
      fill(foxredd);
      triangle(25, 25, 12, 22, 22, 12);
      triangle(25, -25, 12, -22, 22, -12);
      triangle(-25, -25, -12, -22, -22, -12);
      triangle(-25, 25, -12, 22, -22, 12);
      fill(rockgreyl);
      circle(0, 0, 50);
      popMatrix();
    }
    if (bulletType == 2) {
      if (aoehue < 1000) {
        aoehue = aoehue + 1.5*multiplier;
      }
      if (mobs.size() > 0) {
        strokeWeight(6);
        Mob myMob = mobs.get(0);
        stroke(foxredd, aoehue);
        line(x, y, myMob.x, myMob.y);
      }
    }
    if (multiplier == 1|| multiplier == 2) {
      towerangle = towerangle + 14.5*multiplier;
    }
  }

  void act() {
    if (bulletType == 0) { //Gun bullets
      x = x + vx;
      y = y + vy;
    }

    if (bulletType == 1) { //Aoe bullets
      p = p + 15*multiplier;
    }

    if (bulletType == 2) { //Laser bullets
      p = p - 1;
      if (mobs.size() > 0) {
        Mob myMob = mobs.get(0);
        if (myMob.hp < 0.1) {
          hp = 0;
          myMob.hp = myMob.hp - 0.2;
        }
      }

      if (mobs.size() == 0) {
        hp = 0;
      }
    }
    if (x > 1050 || x < -50 || y > 850 || y < -50) {
      hp = hp - 1;
    }
    if (p > 240) {
      hp = hp - 1;
    }
    if (p < -180) {
      hp = hp - 1;
    }
  }
}
