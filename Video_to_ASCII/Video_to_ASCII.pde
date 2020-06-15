import processing.video.*;

Movie movie;
PFont font, f;
char[] chars = {'█','█','▓','▒','░','#','≡','%','$','@','&'};
int resolution = 5;

void setup(){
  frameRate(30);
  size(640, 360);
  font = createFont("Courier", resolution + 3);
  f = createFont("Arial",16,true);
  movie = new Movie(this, "video.mp4");
  movie.loop();
}

void movieEvent(Movie movie) {  
  movie.read();
}

void draw(){
  ascii();
  textFont(f,18);
  fill(255);
  text("FPS: " + nf(frameRate, 0, 2), 545, 20);
}

void ascii() {
  background(0);
  movie.loadPixels();
  textFont(font,resolution+3);
  for (int i = 0; i < movie.width; i+=resolution) {
    for (int j = 0; j < movie.height; j+=resolution) {
      color c = movie.pixels[i + j*movie.width];
      //c = color((red(c)+green(c)+blue(c))/3.0);
      fill(c);
      text(chars[int(brightness(c)/25.5)], i, j);
    }
  }
}
