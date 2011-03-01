class Enemy extends Actor {
  protected int dx, dy;
  
  Enemy (int x, int y, int main_size, int main_color, int dx, int dy) {
    super(x, y, main_size, main_color);
    this.dx = dx;
    this.dy = dy;
  }
  
  void update () {
    this.moveTo(this.x + this.dx, this.y + this.dy);
    if (this.y > height ) {
      this.status = Actor.DEAD;
    }
  }
  
  void draw () {
    fill(this.main_color);
    ellipseMode(CENTER);
    ellipse(this.x, this.y, this.main_size, this.main_size);
  }
}
