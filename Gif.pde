//This class loads and shows an animated GIF.

class Gif {

  PImage[] frames;
  int numFrames;
  int speed;
  int currentFrame;
  float x, y, w, h;

  Gif(String p, int n, int s, float _x, float _y) {
    frames = new PImage[n];
    numFrames = n;
    speed = s;
    currentFrame = 0;
    x = _x;
    y = _y;

    int i = 0;
    while (i < numFrames) {
      frames[i] = loadImage("GIFs/"+p+"/frame_("+i+")_"+p+".gif");
      i++;
    }

    w = frames[0].width;
    h = frames[0].height;
  }

  Gif(String p, int n, int s, float _x, float _y, float _w, float _h) {
    this(p, n, s, _x, _y);
    w = _w;
    h = _h;
  }

  void show() {
    if (currentFrame == numFrames) currentFrame = 0; //loop gif if we're at the end
    image(frames[currentFrame], x, y, w, h); //show current frame
    if (frameCount % speed == 0) currentFrame++; //advance to next frame if it's time
  }
}
