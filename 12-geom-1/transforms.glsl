precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;


vec4 transformPoint(mat4 transform, vec4 point) {
  return transform * point;
}

void main() {
  //TODO: Apply the model-view-projection matrix to `position`
  vec4 tempPos = transformPoint(model, vec4(position, 1.0) );
  tempPos = transformPoint(view, tempPos);
  tempPos = transformPoint(projection, tempPos );

  gl_Position = tempPos;
}