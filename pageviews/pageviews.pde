String[] pageNames;
HashMap sitePages;
String input;

void setup() {
  size(640, 480);
  String[] pageNames = { "home", "contact us", "about", "privacy", "terms of use", "catalog" };
  sitePages = new HashMap();
  for (int i = 0; i < pageNames.length; i++) {
    sitePages.put(pageNames[i], new Page(pageNames[i], 0));
  }
  input = "";
  println(pageNames);
}


void draw() {
}



void keyPressed() {
  if (key == ENTER || key == RETURN) {
    Page p = (Page)sitePages.get(input);
    if (p != null) {
      p.recordPageview(mouseX + mouseY);
      p.draw();
    } else {
      println(input + ": No such page");
    }
    input = "";
  } else if (key != CODED) {
    input = input + key;
  }
}


class Page {
  String name;
  int pageviews;
  float x, y;
  HashMap visitors;
  
  Page (String i_name, int i_pageviews) {
    name = i_name;
    visitors = new HashMap();
    pageviews = i_pageviews;
  }
  
  void moveTo (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void recordPageview (int visitor) {
    pageviews++;
    visitors.put(visitor, true);
  }
  
  void draw (int x, int y) {
    rect(x, y, visitors.size(), pageviews);
  }
}
