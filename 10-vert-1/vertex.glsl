precision highp float;

uniform float theta;

attribute vec2 position;

void main() {

  //TODO: rotate position by theta radians about the origin
  mat2 rotated = mat2(
    cos(theta), -sin(theta), 
    sin(theta), cos(theta)
  );

  gl_Position = vec4(position * rotated, 0, 1.0);
}
