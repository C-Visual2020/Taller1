// Step 1. Import the video library.
import processing.video.*;

PFont font, f;
char[] chars = {'█','█','▓','▒','░','#','≡','%','$','@','&'};
int resolution = 5;

//Step 2. Declare a capture object.
Capture video;

// Step 5. Read from the camera when a new image is available!
void captureEvent(Capture video) {
  video.read();
}

void setup() {  
  frameRate(30);
  size(640, 480);
  font = createFont("Courier", resolution + 3);
  f = createFont("Arial",16,true);
  // Step 3. Initialize Capture object.
  video = new Capture(this, 640, 480);
  
  // Step 4. Start the capturing process.
  video.start();
}


void draw(){
  ascii();
  textFont(f,18);
  fill(255);
  text("FPS: " + nf(frameRate, 0, 2), 545, 20);
}

void ascii() {
  background(0);
  video.loadPixels();
  textFont(font,resolution+3);
  for (int i = 0; i < video.width; i+=resolution) {
    for (int j = 0; j < video.height; j+=resolution) {
      color c = video.pixels[i + j*video.width];
      c = color((red(c)+green(c)+blue(c))/3.0);
      fill(c);
      text(chars[int(brightness(c)/25.5)], i, j);
    }
  }
}
