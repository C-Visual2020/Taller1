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
