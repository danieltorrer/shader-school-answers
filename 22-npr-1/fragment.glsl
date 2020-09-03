precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 viewNormal;

vec3 reflectedLight(
  vec3 normal,
  vec3 lightDirection,
  vec3 diffuse,
  float numBands
) {
  float brightness = dot(normal, lightDirection);
  float celIntensity = ceil(brightness * numBands) / numBands;
  return diffuse * max(celIntensity, 0.0);
}

void main() {
  vec3 lightColor = reflectedLight(viewNormal, lightDirection, diffuse, numBands);
  gl_FragColor = vec4(lightColor,1);
}