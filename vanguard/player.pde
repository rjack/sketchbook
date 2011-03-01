class Player extends Actor {
  Player (int x, int y, int main_size, int main_color) {
    super(x, y, main_size, main_color);
  }
  
  void update () {
    this.moveTo(mouseX, mouseY);
    // TODO collision
  }


  void draw () {
    fill(this.main_color);
    ellipseMode(CENTER);
    ellipse(this.x, this.y, this.main_size, this.main_size);
  }
}
