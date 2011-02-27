ArrayList actors;

void setup () {
  size(800, 500);
  smooth();
  noStroke();
  
  actors = new ArrayList();
}


void draw () {
  background(255);
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


void mouseClicked () {
  color actor_color = color(int(random(0,255)), int(random(0, 255)), int(random(0, 255)), int(random(0, 100)));
  Actor actor = new Actor(mouseX, mouseY, int(random(50, 200)), actor_color);
  actors.add(actor);
  //println("New actor, " + actors.size() + " total");
}


class Actor {

  public static final int ALIVE = 0;
  public static final int DEAD = 1;

  protected int x;
  protected int y;
  protected int status;
  protected color main_color;
  protected int main_size;

  Actor (int x, int y, int main_size, color main_color) {
    this.moveTo(x, y);
    this.main_color = main_color;
    this.main_size = main_size;
    this.status = Actor.ALIVE;
  }

  void moveTo (int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void update () {
    int alpha = ((this.main_color >> 24) & 0xFF);
    if (alpha == 0) {
      this.status = Actor.DEAD;
    } else {
      this.main_color = (this.main_color & ~(0xFF << 24)) | ((alpha - 1) << 24);
    }
  }

  void draw () {
    fill(this.main_color);
    ellipseMode(CENTER);
    ellipse(this.x, this.y, this.main_size, this.main_size);
  }
}

