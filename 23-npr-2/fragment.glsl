precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 viewNormal;

vec3 reflectedLight(
  vec3 normal,
  vec3 lightDirection,
  vec3 ambient,
  vec3 diffuse
) {
  float brightness = dot(normal, lightDirection);
  return ambient + diffuse * max(brightness, 0.0);
}

float goochWeight(vec3 normal, vec3 lightDirection) {
  return 0.5 * (1.0 + dot(normal, lightDirection));
}

vec3 goochColor(vec3 cool, vec3 warm, float weight) {
  return (1.0 - weight) * cool + weight * warm;
}

void main() {
  float gw = goochWeight(viewNormal, lightDirection);
  vec3 gc = goochColor(cool, warm, gw);
  // vec3 lightColor = reflectedLight(viewNormal, lightDirection, warm, cool);
  gl_FragColor = vec4(gc,1);
}