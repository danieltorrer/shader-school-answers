precision mediump float;

uniform mat4 model, view, projection;
uniform vec3 ambient;

void main() {
  gl_FragColor = vec4(ambient, 1.0) * vec4(1,1,1,1);
}