precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vNormal;
varying vec3 vEyeDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  vNormal = (vec4(normal, 0.0) * inverseModel * inverseView).xyz;
  vEyeDirection = normalize(viewPosition.xyz);

  gl_Position = projection * view * model * vec4(position, 1);
}