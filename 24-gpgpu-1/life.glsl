precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

vec2 normalizeCoord(vec2 coord) {
  vec2 result = vec2(0.0);

  bvec2 topLeftLimit = lessThan(coord, vec2(0.0));
  bvec2 bottomRightLimit = greaterThan(coord, stateSize);

  if(any(topLeftLimit)) {
    result.x = topLeftLimit.x ? stateSize.x : coord.x; 
    result.y = topLeftLimit.y ?  stateSize.y : coord.y; 
  }
  
  if(any(bottomRightLimit)) {
    result.x = bottomRightLimit.x ? 0.0 : coord.x; 
    result.y = bottomRightLimit.y ? 0.0 : coord.y; 
  }

  return result;
}

float state(vec2 coord) {
  vec2 nCord = normalizeCoord(coord);
  return texture2D(prevState, fract(coord / stateSize)).r;
}

int getNumberOfNeightboors(vec2 coord) {
  int numberNeightboors = 0;

  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      if(i != 0 && j != 0) {
        if( state(coord - vec2(float(i),float(j))) >= 1.0 ){
          numberNeightboors++;
        }
      } 
    }
  }

  return numberNeightboors;
}

//TODO: Compute the next state for the cell at coord
void main() {
  vec2 coord = gl_FragCoord.xy;

  float s = state(coord);
  int numberNeightboors = getNumberOfNeightboors(coord);

  vec3 currentCell = vec3(0.0);
  if (numberNeightboors == 3 && s < 1.0) currentCell = vec3(1.0);
  if (s >= 1.0 && (numberNeightboors == 2 || numberNeightboors == 3)) currentCell = vec3(1.0);

  gl_FragColor = vec4(currentCell, 1.0);
}
