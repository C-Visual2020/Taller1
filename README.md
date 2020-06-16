# Taller 1

El siguiente documento es el desarrollo del taller 1 de la materia Computacion Visual, desarrollado por [Luis Fernando Rodriguez](https://github.com/luifrodriguezroj) y [Miguel Angel Gómez](https://github.com/miagomezch).

## PROPOSITO



## Grayscale

En este proyecto se busco tomar una imagen y mediante un manejo de los pixeles de la imagen se realiza una conversion mediante los formatos _RGB_ y [_Luma_](https://en.wikipedia.org/wiki/Luma_(video))

### RGB

```RGB
void rgb() {
  image2.loadPixels();
  for (int i = 0; i < image2.width * image2.height; i++) {
    color c = image2.pixels[i];
    float bw=(red(c)+green(c)+blue(c))/3.0;
    image2.pixels[i] = color(bw);
  }
  image2.updatePixels();
}
```

  
![RGB](https://trello-attachments.s3.amazonaws.com/5ee6e14304b99266b4ddb1f4/803x428/4ce9fd985408eddb50217a074b6e70e3/RGB.png)

![RGBH](https://trello-attachments.s3.amazonaws.com/5ee6e14304b99266b4ddb1f4/805x428/0e2a9d48f3d0102097e39d4f9bc70ea8/RGBH.png)



### Luma

```Luma
void luma() {
  image2.loadPixels();
  for (int i = 0; i < image2.width * image2.height; i++) {
    color c = image2.pixels[i];
    float bw = red(c) * 0.299 + green(c) * 0.587 + blue(c) * 0.114;
    image2.pixels[i] = color(bw);
  }
  image2.updatePixels();
}
```

![Luma](https://trello-attachments.s3.amazonaws.com/5ee6e14304b99266b4ddb1f4/803x428/57e557c07435f8cbb9ceb7ad520e6e95/Luma.png)

![LumaH](https://trello-attachments.s3.amazonaws.com/5ee6e14304b99266b4ddb1f4/805x428/76e44ada99828e1ba28e8ddff6ca1aee/LumaH.png)

## Convolution Masks

Para este proyecto, se busca tomar una imagen y mediante el manejo de una [matriz de convolucion](https://en.wikipedia.org/wiki/Kernel_(image_processing)) realizar una transformacion a la imagen original.

```Mascara
void conv() {
  image2.loadPixels();
  for (int x = 0; x < image.width; x++) {
    for (int y = 0; y < image.height; y++ ) {
      color c = convolution(x, y, Matriz, 3, image);
      int loc = x + y*image.width;
      image2.pixels[loc] = c;
    }
  }
  image2.updatePixels();
}
```
### Sharpen

```Sharpen
float[][] Sharpen = { { 0, -1, 0 },
                     { -1,  5, -1 },
                     { 0, -1, 0 } };

```

![Sharpen](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/19b68160883fbfec1b984362fbbe362f/Sharpen.png)

![SharpenH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/805x429/1d7e5142c95315ee1d99cd7a1d9fe31a/SharpenH.png)

### Edge

```Edge
float[][] Edge = { { -1, -1, -1 },
                   { -1,  8, -1 },
                   { -1, -1, -1 } };  

```
![Edge](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/804x428/6cf459e004c19db9b9ab297aed828be3/Edge.png)

![EdgeH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/447a56b5357b043ef248f90ffd0ed7d9/EdgeH.png)

### Box

```Box
float[][] Box = { { 0.11111, 0.11111, 0.11111 },
                   { 0.11111, 0.11111, 0.11111 },
                   { 0.11111, 0.11111, 0.11111 } };  

```
![Box](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/3eab0616297765a9b133652090fcde87/Box.png)

![BoxH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/d97e101b37e33c0fe8e8e19de7cc5599/BoxH.png)

### Gauss

```Gauss
float[][] Gaussian = { { 0.0625, 0.125, 0.0625 },
                       { 0.125,  0.25, 0.125 },
                       { 0.0625, 0.125, 0.0625 } };

```

![Gauss](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/c3f087716e8331c7aa5b6b1b83cf774d/Gauss.png)

![GaussH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/804x429/aa8e78694b77a7219423cb1f52640ae9/GaussH.png)

### Dark 

```Dark
float[][] Dark = { { 0, 0, 0 },
                   { 0, 0.2, 0 },
                   { 0, 0, 0 } };

```

![Dark](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/6e7ee5228356c8fa2a73e1048b8fb29d/Dark.png)

![DarkH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/a522127abf18f023554a19edab5cd584/DarkH.png)

## Image To Ascii

Para el siguiente proyecto, se busca tomar una imagen y realizar un proceso de transformacion, de cada uno de los pixeles, con caracteres previamente establecidas.

```ImageToAscii
PImage image, image2;
PFont font;
char[] chars = {'█','█','▓','▒','░','#','≡','%','$','@','&'};
int resolution = 4;

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

```

![Ascii](https://trello-attachments.s3.amazonaws.com/5ee6f7d526fb9e66a4bc5647/803x428/e875339f0fe82a219792d5e76864e035/Ascii.png)


## Video To Ascii

Al igual que el punto anterios, se busca el procesamiento pero esta vez de un video, tomando cada frame y transformandolo en arte ascii

```VideoToAscii
import processing.video.*;

Movie movie;
PFont font, f;
char[] chars = {'█','█','▓','▒','░','#','≡','%','$','@','&'};
int resolution = 5;

void setup(){
  frameRate(30);
  size(1280, 360);
  font = createFont("Courier", resolution + 3);
  f = createFont("Arial",16,true);
  movie = new Movie(this, "video.mp4");
  movie.loop();
}

void movieEvent(Movie movie) {  
  movie.read();
}

void draw(){
  image(movie,0,0);
  ascii();
  image(movie,640,0);
  textFont(f,18);
  fill(255);
  text("FPS: " + nf(frameRate, 0, 2), 545, 20);
  text("FPS: " + nf(frameRate, 0, 2), 1190, 20);
}

void ascii() {
  background(0);
  movie.loadPixels();
  textFont(font,resolution+3);
  for (int i = 0; i < movie.width; i+=resolution) {
    for (int j = 0; j < movie.height; j+=resolution) {
      color c = movie.pixels[i + j*movie.width];
      c = color((red(c)+green(c)+blue(c))/3.0);
      fill(c);
      text(chars[int(brightness(c)/25.5)], i, j);
    }
  }
}

```

<p align="center">
  
<a href="https://trello-attachments.s3.amazonaws.com/5ee6e107b924617fcd231a57/5ee6fb41f064b71c09803ac3/d6ed0200a375cfe64be09fe29408d459/Vide.gif">Video</a>

</p>


## Camera To Ascii

Para este punto se busca tomar imagen en vivo y al igual que la transformacion de un video, se busca convertir la imagen en codigo ascii. 

```CameraToAscii
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
  size(1280, 480);
  font = createFont("Courier", resolution + 3);
  f = createFont("Arial",16,true);
  // Step 3. Initialize Capture object.
  video = new Capture(this, 640, 480);
  
  // Step 4. Start the capturing process.
  video.start();
}


void draw(){
  image(video,0,0);
  ascii();
  image(video,640,0);
  textFont(f,18);
  fill(255);
  text("FPS: " + nf(frameRate, 0, 2), 545, 20);
  text("FPS: " + nf(frameRate, 0, 2), 1190, 20);
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

```
