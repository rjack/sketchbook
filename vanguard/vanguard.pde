ArrayList actors;
Chronograph chrono;


void setup () {
  size(640, 480, P2D);
  smooth();
  noStroke();
  noCursor();
  actors = new ArrayList();
  actors.add(new Player(mouseX, mouseY, 30, color(255,0,0,255)));
  chrono = new Chronograph();
}


void draw () {
  background(0);
  if (chrono.partial() > 1000) {
    actors.add(createEnemy());
    chrono.reset();
  }
  Iterator i = actors.iterator();
  while (i.hasNext()) {
    Actor actor = (Actor)i.next();
    actor.update();
    if (actor.status == Actor.ALIVE) {
      actor.draw();
    } else {
      i.remove();
      //println("Actor died!");
    }
  }
}


Enemy createEnemy () {
  Enemy enemy = new Enemy(int(random(0, width)),  // x
                          -100,                   // y
                          int(random(50, 100)),   // main_size
                          color(random(0,255), random(0,255), random(0,255)),
                          int(random(-2, 2)),     // dx
                          int(random(1, 5)));    // dy
  return enemy;
}


class Chronograph {
  private int partial[];

  Chronograph () {
    this.partial = new int[2];
    this.reset();
  }

  int read () {
    return this.partial[1] - this.partial[0];
  }

  int partial () {
    this.partial[1] = millis();
    return this.read();
  }

  void reset () {
    this.partial[0] = millis();
  }
}
