// tp3
// https://youtu.be/_5_s2gP_Aog
//valentin san roman

// Variables de configuración de la cuadrícula y colore
color colorBase = color(100, 200, 200);
color colorAlterno = color(255, 0, 0);
int cantidadColumnas = 15;
int cantidadFilas = 10;
int tamañoCelda = 25;

// Variable para la imagen
PImage miImagen;
int posicionImagenX = 20;
int posicionImagenY = 50;

void setup() {
  size(800, 400); // Resolución 800x400
  miImagen = loadImage("nombre_de_tu_imagen.png"); // Carga tu imagen aquí

  // Si la imagen se carga, ajusta su tamaño
  if (miImagen != null) {
    miImagen.resize(250, 300); // Tamaño de la imagen
  }
}

void draw() {
  background(255); // Fondo blanco

  // Dibuja la imagen
  if (miImagen != null) {
    image(miImagen, posicionImagenX, posicionImagenY);
  }

  // Define la posición de la cuadrícula
  int cuadrillaOffsetX = 300;
  int cuadrillaOffsetY = 50;

  // Llama a la función que dibuja la cuadrícula (NO retorna valor)
  dibujarCuadrilla(cantidadColumnas, cantidadFilas, cuadrillaOffsetX, cuadrillaOffsetY);
}

// Función propia con parámetros que NO retorna un valor
void dibujarCuadrilla(int cols, int rows, int offsetX, int offsetY) {
  for (int y = 0; y < rows; y++) { // Ciclo FOR anidado
    for (int x = 0; x < cols; x++) {
      float centroX = offsetX + x * tamañoCelda + tamañoCelda / 2;
      float centroY = offsetY + y * tamañoCelda + tamañoCelda / 2;

      // Llama a la función que decide el color (SÍ retorna valor)
      color c = obtenerColorCelda(mouseX, mouseY, centroX, centroY);
      fill(c);
      stroke(0);
      ellipse(centroX, centroY, tamañoCelda * 0.8, tamañoCelda * 0.8);
    }
  }
}

// Función propia con parámetros que RETORNA un valor
color obtenerColorCelda(float mouseXActual, float mouseYActual, float celdaX, float celdaY) {
  // dist() - Función matemática
  float distancia = dist(mouseXActual, mouseYActual, celdaX, celdaY);

  // Condicional (if - else)
  if (distancia < 50) {
    return colorAlterno;
  } else {
    return colorBase;
  }
}

// Evento de teclado: modificación de variables (colores)
void keyPressed() {
  // random() - Función matemática
  if (key == 'r' || key == 'R') { // Reiniciar el programa: volver variables a estado original
    colorBase = color(100, 200, 200);
    colorAlterno = color(255, 0, 0);
  } else if (key == 'c' || key == 'C') {
    colorBase = color(random(255), random(255), random(255));
    colorAlterno = color(random(255), random(255), random(255));
  }
}
