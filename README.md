# Tesis

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
