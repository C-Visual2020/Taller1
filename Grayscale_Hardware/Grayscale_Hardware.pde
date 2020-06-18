PImage img;
PShader basic, average, luma;
PShape original_sh, basic_sh, average_sh, luma_sh;
int counter = 0;

void setup(){
  size(1200, 400, P2D);
  img = loadImage("image.jpg"); // Load the original image
  
  original_sh = createShape(RECT, 0, 0, 400, 400);
  original_sh.setTexture(img);
  
  average_sh = createShape(RECT, 400, 0, 400, 400);
  average_sh.setTexture(img);
  
  luma_sh = createShape(RECT, 800, 0, 400, 400);
  luma_sh.setTexture(img);

  average = loadShader("average.glsl");
  luma = loadShader("luma.glsl");
}

void draw(){
  resetShader();
  shape(original_sh);
  
  shader(average);
  shape(average_sh);
  
  shader(luma);
  shape(luma_sh);
  
  histogram();
  histogram1();
}

void histogram() {
  int[] hist = new int[256];
  
  for (int i = 400; i < img.width+400; i++) {
    for (int j = 0; j < img.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
  int histMax = max(hist);

  stroke(0);
  
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < img.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, img.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, img.height, 0));
    line(i+400, img.height, i+400, y);
  }
}

void histogram1() {
  int[] hist = new int[256];
  
  for (int i = 800; i < img.width+800; i++) {
    for (int j = 0; j < img.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
  int histMax = max(hist);

  stroke(0);
  
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < img.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, img.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, img.height, 0));
    line(i+800, img.height, i+800, y);
  }
}
