precision highp float;
varying vec3 bgColor;

void main() {
  gl_FragColor = vec4(bgColor, 1.0);
}