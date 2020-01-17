 class Flower {
  float xSpeed=  random(-10, 10);
  float ySpeed=  random(-10, 10);
  // Variables
  float ballX;
  float ballY;


  float r;       // radius of the flower petal
  int n_petals;  // number of petals 
  float x;       // x-position of the center of the flower
  float y;       // y-position of the center of the flower
  int petalColor;//hexadecimal number for the color of petals
  
 Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {
    r=temp_r;
    n_petals = temp_n_petals;
    x=temp_x;
    y=temp_y;
    petalColor=temp_petalColor;
  }

  void display () {


    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      //  ballX=width/2 + r*cos(i);
      //  ballY=height/2 + r*sin(i);
      ballX=x + r*cos(i);
      ballY=y + r*sin(i);
      ellipse(ballX, ballY, r, r);
    }
    fill(200, 0, 0);
    ellipse(x, y, r*1.2, r*1.2);
  }
  void move () {
    x += xSpeed;
    y += ySpeed;
  }
  void bounce() {
    if (x >= width-r || x<=0+r) {
      xSpeed *=-1;
    }

    if (y > height-r || y<0+r) {
      ySpeed *= -1;
    }
  }

  void coll(Flower other) {
    float d = dist(x, y, other.x, other.y);
    if (d < r*2 + other.r) {
      xSpeed *= -1;
      ySpeed *= -1;
      petalColor = int (random(#000000, #FFFFFF));
      //println("The current d is: " + d);
    }
  }
      void coll(square other) {
    float d = dist(x, y, other.x, other.y);
    if (d < r*2 + other.ex) {
      xSpeed *= -1;
      ySpeed *= -1;
      petalColor = int (random(#000000, #FFFFFF));
      //println("The current d is: " + d);
    }
  }
}
