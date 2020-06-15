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
