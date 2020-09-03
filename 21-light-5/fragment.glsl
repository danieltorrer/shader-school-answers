precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

varying vec3 lightDirection[4];
varying vec3 vNormal;
varying vec3 vEyeDirection;

uniform PointLight lights[4];


float phongWeight(
  vec3 lightDirection,
  vec3 surfaceNormal,
  vec3 eyeDirection,
  float shininess
) {
  //First reflect light by surface normal
  vec3 rlight = reflect(lightDirection, surfaceNormal);

  //Next find the projected length of the reflected
  //light vector in the view direction
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);

  //Finally exponentiate by the shininess factor
  return pow(eyeLight, shininess);
}

vec3 reflectedLight(
  vec3 normal,
  vec3 lightDirection,
  vec3 diffuse
) {
  float brightness = dot(normal, lightDirection);
  return diffuse * max(brightness, 0.0);
}


void main() {
  float phong;
  vec3 lambert;
  vec3 fColor = ambient;

  for(int i = 0; i < 4; i++) {
    phong = phongWeight(
      lightDirection[i], 
      normalize(vNormal), 
      normalize(vEyeDirection), 
      lights[i].shininess
    );
    lambert = reflectedLight(normalize(vNormal), lightDirection[i], lights[i].diffuse);
    fColor += lambert + lights[i].specular * phong;

  }

  gl_FragColor = vec4(fColor, 1.0);
}