highp mat4 reflection(highp vec3 n) {

  //TODO: Return a matrix that reflects all points about the plane passing through the origin with normal n

  n = normalize(n);
  return mat4(
    1.0 - 2.0 * n.x * n.x,     -2.0 * n.x * n.y,     -2.0 * n.x * n.z, 0,
        - 2.0 * n.y * n.x, 1.0 - 2.0 * n.y * n.y,    -2.0 * n.y * n.z, 0, 
        - 2.0 * n.z * n.x, 	   -2.0 * n.z * n.y, 1.0 -2.0 * n.z * n.z, 0,
    0, 			 0, 		  0, 1);
}

#pragma glslify: export(reflection)