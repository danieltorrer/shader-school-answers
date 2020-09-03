precision highp float;

varying vec3  bgColor;

void main() {
  float r = 0.5;
  vec2 center = vec2(r, r);
  vec2 square = gl_PointCoord;
  
  if( (pow(square.x - center.x, 2.0) + pow(square.y - center.y, 2.0)) > pow(r, 2.0)) {
    discard;
  }


  gl_FragColor = vec4(bgColor,1);
}