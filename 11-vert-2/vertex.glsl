precision highp float;

attribute vec4 position;
attribute vec3 color;
varying vec3 bgColor;

void main() {
  bgColor = color;
  gl_Position = position;
}
