# Taller 1

El siguiente documento es el desarrollo del taller 1 de la materia Computacion Visual, desarrollado por [Luis Fernando Rodriguez](https://github.com/luifrodriguezroj) y [Miguel Angel Gómez](https://github.com/miagomezch).

## Grayscale

En este proyecto se busco tomar una imagen y mediante un manejo de los pixeles de la imagen se realiza una conversion mediante los formatos _RGB_ y _Luma_

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
<center>
  
![RGB](https://trello-attachments.s3.amazonaws.com/5ee6e14304b99266b4ddb1f4/803x428/4ce9fd985408eddb50217a074b6e70e3/RGB.png)

![RGBH](https://trello-attachments.s3.amazonaws.com/5ee6e14304b99266b4ddb1f4/805x428/0e2a9d48f3d0102097e39d4f9bc70ea8/RGBH.png)

</center>

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

```Luma
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

![Sharpen](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/19b68160883fbfec1b984362fbbe362f/Sharpen.png)

![SharpenH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/805x429/1d7e5142c95315ee1d99cd7a1d9fe31a/SharpenH.png)

### Edge

![Edge](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/804x428/6cf459e004c19db9b9ab297aed828be3/Edge.png)

![EdgeH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/447a56b5357b043ef248f90ffd0ed7d9/EdgeH.png)

### Box

![Box](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/3eab0616297765a9b133652090fcde87/Box.png)

![BoxH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/d97e101b37e33c0fe8e8e19de7cc5599/BoxH.png)

### Gauss

![Gauss](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/c3f087716e8331c7aa5b6b1b83cf774d/Gauss.png)

![GaussH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/804x429/aa8e78694b77a7219423cb1f52640ae9/GaussH.png)

### Dark 

![Dark](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/6e7ee5228356c8fa2a73e1048b8fb29d/Dark.png)

![DarkH](https://trello-attachments.s3.amazonaws.com/5ee6f0e9f530155846a83a62/803x428/a522127abf18f023554a19edab5cd584/DarkH.png)

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/C-Visual2020/Taller1/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://help.github.com/categories/github-pages-basics/) or [contact support](https://github.com/contact) and we’ll help you sort it out.
