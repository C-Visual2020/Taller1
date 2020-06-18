import processing.video.*;

Movie mov;
PShader ascii;
PShape original, frame;
int image_size = 640;

void setup(){
  size(1280, 360, P3D);
  mov = new Movie(this, "video.mp4");
  mov.play();
  
  ascii = loadShader("ascii.glsl");
  ascii.set("iResolution", float(width), float(height));
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  resetShader();
  image(mov, 0, 0); 
  filter(GRAY);
  filter(ascii);
  image(mov, image_size, 0);
  text("FPS: " + nf(frameRate, 0, 2), 545, 20);
  text("FPS: " + nf(frameRate, 0, 2), 1190, 20);
}
