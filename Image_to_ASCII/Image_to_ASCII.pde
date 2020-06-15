PImage image, image2;
PFont font;
char[] chars = {'█','█','▓','▒','░','#','≡','%','$','@','&'};
int resolution = 5;

void setup(){
  size(800, 400);
  font = createFont("Courier", resolution + 3);
  image = loadImage("image.jpg");
  image2 = loadImage("image.jpg");
}

void draw(){
  image(image, 0, 0);
  ascii();
  image(image2, 0, 0);
}

void ascii() {
  image.loadPixels();
  image.filter(GRAY);
  textFont(font,resolution+3);
  for (int i = 0; i < image.width; i+=resolution) {
    for (int j = 0; j < image.height; j+=resolution) {
      color c = image.get(i, j);
      fill(c);
      text(chars[int(brightness(c)/25.5)], i+400, j);
    }
  }
}
