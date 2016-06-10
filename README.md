# Tesis !(https://i.creativecommons.org/l/by-sa/4.0/88x31.png)

Este proyecto contiene los fuentes de la tesina de grado de Miguel Carbone y
José Nahuel Cuesta Luengo, alumnos de la Facultad de Informática de la
Universidad Nacional de La Plata, titulada *Rediseño de la nube de servicios de
la UNLP*.

Este proyecto puede utilizarse como base para otros tesinistas que estén
interesados en realizar su informe documental con LaTeX, intentando facilitar el
proceso de aprendizaje inicial y el de organización del proyecto.

## Licencia

Este proyecto se encuentra licenciado bajo una [Licencia Creative Commons
Atribución-CompartirIgual 4.0 Internacional](http://creativecommons.org/licenses/by-sa/4.0/).

## Generación del PDF de salida

Al generar la salida, el resultado queda en el directorio `pdf/`.

### Con Docker

Primero, descargar la imagen del container para ejecutar Latex:

```console
$ docker pull ncuesta/latex
```

> La descarga de la imagen se hace sólo la primera vez.

Luego, cada vez que querramos ejecutar Latex para generar la salida en PDF:

```console
$ run --rm -v "`pwd`:/latex" -i ncuesta/latex
```

### Con PdfLaTeX instalado localmente

Se puede usar el `Makefile` de este directorio:

```console
$ make
```
