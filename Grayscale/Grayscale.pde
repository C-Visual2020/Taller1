PImage image, image2;

void setup(){
  size(800, 400);
  image = loadImage("image.jpg");
  image2 = loadImage("image.jpg");
}

void draw(){
  image(image, 0, 0);
  histogram_org();
  image(image2, 400, 0);
  //Escoger entre rgb y luma
  rgb();
  //luma();
  histogram();
}

void rgb() {
  image2.loadPixels();
  for (int i = 0; i < image2.width * image2.height; i++) {
    color c = image2.pixels[i];
    float bw=(red(c)+green(c)+blue(c))/3.0;
    image2.pixels[i] = color(bw);
  }
  image2.updatePixels();
}

void luma() {
  image2.loadPixels();
  for (int i = 0; i < image2.width * image2.height; i++) {
    color c = image2.pixels[i];
    float bw = red(c) * 0.299 + green(c) * 0.587 + blue(c) * 0.114;
    image2.pixels[i] = color(bw);
  }
  image2.updatePixels();
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
