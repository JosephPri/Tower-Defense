//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {

  float x, y, vx, vy, d, hp, vhp, mhp;
  float rotation;
  color fill, stroke, healthbar, healthbarStroke;
  float speed; //=1
  int mobType;

  Mob (float _x, float _y, float _vx, float _vy, int _mobType) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    mobType = _mobType;
    d = 40;
    mhp = hp;
    rotation = 0;
    healthbar = #21CE22;
    healthbarStroke = #1aa51b;

    if (mobType == 0) {
      hp = 3;
      mhp = hp;
      speed = 1;
    }

    if (mobType == 1) {
      hp = 2;
      mhp = hp;
      speed = 2;
    }

    if (mobType == 2) {
      hp = 8;
      mhp = hp;
      speed = 0.75;
    }
  }

  void show() {
    vhp = hp*10;
    pushMatrix();
    //fill(fill);
    //stroke(stroke);
    strokeWeight(5);
    if (rotation == 0) {
      translate(x, y);
    }

    if (rotation != 0) {
      translate(x, y);
      rotate(radians(rotation));
    }
    if (mobType == 0) {
      fill(foxredl);
      stroke(foxredd);
      circle(0, 0, d);
      strokeWeight(0);
      fill(black);
      circle(0+15, 0-7, d-30);
      circle(0+15, 0+7, d-30);
    }

    if (mobType == 1) {
      fill( #0096FF);
      stroke(#0047AB);
      circle(0, 0, d);
      strokeWeight(0);
      fill(black);
      circle(0+15, 0-7, d-30);
      circle(0+15, 0+7, d-30);
    }

    if (mobType == 2) {
      d = 50;
      fill(#ffff66);
      stroke(#cccc52);
      circle(0, 0, d);
      strokeWeight(0);
      fill(black);
      circle(0+15, 0-7, d-40);
      circle(0+15, 0+7, d-40);
    }
    popMatrix();

    strokeWeight(2);
    stroke(healthbarStroke);
    fill(healthbar);
    rect(x, y+d-15, vhp, 5, 3);
  }

  void act() {
    x = x + vx*speed*multiplier;
    y = y + vy*speed*multiplier;
    if (x > 815) {
      hp = 0;
      lives = lives - 1;
    }

    if (hp <= mhp/3*2) {
      healthbar = #FFA500;
      healthbarStroke = #e69500;
    }
    if (hp <= mhp/3) {
      healthbar = #FF3639;
      healthbarStroke = #e63133;
    }

    if (map == 1) {
      int i = 0;
      while (i < nodes.length) {
        if (dist(nodes[i].x, nodes[i].y, x, y) < 4 && nodes[i].m == 1) {
          vx = nodes[i].dx;
          vy = nodes[i].dy;
          rotation = nodes[i].angle;
        }
        i++;
      }
    }

    if (map == 2) {
      int i = 0;
      while (i < nodes.length) {
        if (dist(nodes[i].x, nodes[i].y, x, y) < 4 && nodes[i].m == 2) {
          vx = nodes[i].dx;
          vy = nodes[i].dy;
          rotation = nodes[i].angle;
        }
        i++;
      }
    }

    int i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (myBullet.bulletType == 0) {
        if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
          hp = hp -1;
          vhp = vhp -10;
          myBullet.hp = myBullet.hp - 1;
        }
      }
      if (myBullet.bulletType == 1) {
        if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.p/2) {
          if (multiplier == 1) {
          hp = hp - 0.04;
          vhp = vhp - 0.4;
          }
          if (multiplier == 2) {
          hp = hp - 0.05;
          vhp = vhp - 0.5;
          }
        }
      }
      if (myBullet.bulletType == 2) {
        Mob myMob = mobs.get(0);
        myMob.hp = myMob.hp - 0.008;
      }
      i++;
    }
  }
}
