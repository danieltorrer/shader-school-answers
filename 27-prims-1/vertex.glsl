precision highp float;

attribute vec3 position, color;
attribute float size;

uniform mat4 model, view, projection;

varying vec3 bgColor;

void main() {
  bgColor = color;
  gl_PointSize = size;
  gl_Position = projection * view * model * vec4(position, 1.0);
}
