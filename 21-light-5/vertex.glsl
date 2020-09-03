precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

varying vec3 lightDirection[4];
varying vec3 vNormal;
varying vec3 vEyeDirection;

uniform PointLight lights[4];

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  vNormal = (vec4(normal, 0.0) * inverseModel * inverseView).xyz;
  vEyeDirection = normalize(viewPosition.xyz);

  for(int i = 0; i < 4; i++) {
    vec4 viewLight = view * vec4(lights[i].position, 1.0) ;
    lightDirection[i] = normalize(viewLight.xyz - viewPosition.xyz);
  }

  gl_Position = projection * viewPosition;
}
