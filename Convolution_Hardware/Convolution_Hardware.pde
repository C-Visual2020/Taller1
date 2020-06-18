PImage imagen;
PShader kernel;
PShape frame, original;
int counter = 0;

final String[] k_variables = {"scalar", "k0", "k1", "k2", "k3", "k4", "k5", "k6", "k7", "k8"};

final float[] Saturation = { 1.0, 
                            1, 1, 1, 
                            1, 1, 1, 
                            1, 1, 1 }; 

final float[] Sharpen = { 1.0, 
                          0, -1, 0, 
                         -1, 5, -1, 
                          0, -1, 0 }; 

final float[] Edge = { 1.0, 
                      -1, -1, -1, 
                      -1, 8, -1,
                      -1, -1, -1 };  

final float[] Box ={ 1.0, 
                     0.11111, 0.11111, 0.11111, 
                     0.11111, 0.11111, 0.11111, 
                     0.11111, 0.11111, 0.11111 }; 
                   
final float[] Gaussian = { 1.0, 
                           0.0625, 0.125, 0.0625,
                           0.125, 0.25, 0.125, 
                           0.0625, 0.125, 0.0625 };

final float[] Dark ={ 1.0, 
                      0, 0, 0, 
                      0, 0.2, 0, 
                      0, 0, 0 }; 
 
final float[] Repujado ={ 1.0, 
                          -2, -1, 0, 
                          -1, 1, 1, 
                          0, 1, 2 }; 
                      
void setup(){
  size(800, 400, P2D);
  imagen = loadImage("image.jpg"); // Load the original image
  
  original = createShape(RECT, 0, 0, 400, 400);
  original.setTexture(imagen);
  
  frame = createShape(RECT, 400, 0, 400, 400);
  frame.setTexture(imagen);
  
  kernel = loadShader("kernel.glsl");
}

void draw(){
  float[] matrix;
  switch (counter % 5) {
    case 0:
      matrix = Sharpen;
    break;  
    case 1:
      matrix = Edge;
    break;  
    case 2:
      matrix = Box;
    break;  
    case 3:
      matrix = Gaussian;
    break;  
    case 4:
      matrix = Dark;
    break;  
    case 5:
      matrix = Repujado;
    break;
    default:
      matrix = new float[0];
    break;
  }

  for(int i = 0; i < k_variables.length; i++)
    kernel.set(k_variables[i], matrix[i]);
  
  shader(kernel);
  shape(frame);
  
  resetShader();
  shape(original);
  
  histogram();
}

void mousePressed(){
  counter++;
}

void histogram() {
  int[] hist = new int[256];
  
  for (int i = 400; i < imagen.width+400; i++) {
    for (int j = 0; j < imagen.height; j++) {
      int bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
  int histMax = max(hist);

  stroke(255);
  
  // Draw half of the histogram (skip every second value)
  for (int i = 0; i < imagen.width; i += 2) {
    // Map i (from 0..img.width) to a location in the histogram (0..255)
    int which = int(map(i, 0, imagen.width, 0, 255));
    // Convert the histogram value to a location between 
    // the bottom and the top of the picture
    int y = int(map(hist[which], 0, histMax, imagen.height, 0));
    line(i+400, imagen.height, i+400, y);
  }
}
