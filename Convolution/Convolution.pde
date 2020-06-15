PImage image, image2;

float[][] Saturation = { { 1, 1, 1 },
                         { 1, 1, 1 },
                         { 1, 1, 1 } };

float[][] Sharpen = { { 0, -1, 0 },
                     { -1,  5, -1 },
                     { 0, -1, 0 } };
                     
float[][] Edge = { { -1, -1, -1 },
                   { -1,  8, -1 },
                   { -1, -1, -1 } };                            

float[][] Box = { { 0.11111, 0.11111, 0.11111 },
                   { 0.11111, 0.11111, 0.11111 },
                   { 0.11111, 0.11111, 0.11111 } };      

float[][] Gaussian = { { 0.0625, 0.125, 0.0625 },
                       { 0.125,  0.25, 0.125 },
                       { 0.0625, 0.125, 0.0625 } };  

void setup(){
  size(800, 400);
  image = loadImage("image.jpg");
  image2 = loadImage("image.jpg");
}

void draw(){
  image(image, 0, 0);
  histogram_org();
  image(image2, 400, 0);
  conv();
  histogram();
}

void conv() {
  image2.loadPixels();
  for (int x = 0; x < image.width; x++) {
    for (int y = 0; y < image.height; y++ ) {
      color c = convolution(x, y, Sharpen, 3, image);
      int loc = x + y*image.width;
      image2.pixels[loc] = c;
    }
  }
  image2.updatePixels();
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}

void histogram_org() {
  int[] hist = new int[256];
  
  for (int i = 0; i < image.width; i++) {
    for (int j = 0; j < image.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
  int histMax = max(hist);

  stroke(255);
  
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < image.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, image.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, image.height, 0));
    line(i, image.height, i, y);
  }
}

void histogram() {
  int[] hist = new int[256];
  
  for (int i = 400; i < image2.width+400; i++) {
    for (int j = 0; j < image2.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
  int histMax = max(hist);

  stroke(255);
  
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < image2.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, image2.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, image2.height, 0));
    line(i+400, image2.height, i+400, y);
  }
}
