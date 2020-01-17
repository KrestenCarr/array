class square {
  float xSpeed=  random(-10, 10);
  float ySpeed=  random(-10, 10);
  // Variables


  float ex;       // extent of the squeare so the size
  float x;        // start x value of the squesre
  float y;        // start y value of the squesre
  int squareColor;  //a hex. number to define the color of thge square

  square(float _x, float _y, float _ex, int _squareColor) {
    x = _x;
    y = _y;
    ex= _ex;
    squareColor = _squareColor;
  }
  void display () {
    fill(squareColor);
    rect(x, y, ex, ex);
  }

  void move () {
    x += xSpeed;
    y += ySpeed;
  }
  void bounce() {
    if (x >= width-ex || x<=0+ex) {
      xSpeed *=-1;
    }

    if (y > height-ex || y<0+ex) {
      ySpeed *= -1;
    }
  }

  void coll(Flower other) {
    float d = dist(x, y, other.x, other.y);
    if (d < ex + other.r) {
      xSpeed *= -1;
      ySpeed *= -1;
      squareColor = int (random(#000000, #FFFFFF));
      //println("The current d is: " + d);
    }
  }
}
