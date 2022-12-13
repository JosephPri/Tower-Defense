//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to
//the node's instructions.

class Node {

  float x, y, dx, dy, angle, m;

  Node(float _x, float _y, float _dx, float _dy, float _angle, float _m) { //WHAT IS M?!?!?
    x = _x;
    y = _y;
    dx = _dx;
    dy = _dy;
    angle = _angle;
    m = _m;
  }
  void show() {
    fill(black);
    stroke(black);
    circle(x, y, 10);
    strokeWeight(5);
    line(x, y, x+dx*50, y+dy*50);
  }
}
