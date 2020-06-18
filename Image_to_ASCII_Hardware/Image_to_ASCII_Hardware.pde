PImage img;
PShader ascii;
PShape original, frame;

void setup(){
  size(800, 400, P2D);
  img = loadImage("image.jpg");
  
  ascii = loadShader("ascii.glsl");
  ascii.set("iResolution", float(width), float(height));
}

void draw(){
  resetShader();
  image(img, 400, 0);
  filter(ascii);
  image(img, 0, 0);
}
