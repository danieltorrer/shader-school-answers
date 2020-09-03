highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians

  n = normalize(n);
  return mat4(
    cos(theta) + n.x * n.x * ( 1.0 - cos(theta)),                 n.z * sin(theta) + n.x * n.y * (1.0-cos(theta)), -n.y * sin(theta) + n.x * n.z * (1.0-cos(theta)), 0,
                 n.x * n.y * ( 1.0 - cos(theta)) -n.z*sin(theta), cos(theta) + n.y * n.y * (1.0-cos(theta)), n.x * sin(theta)+n.y*n.z*(1.0-cos(theta)), 0, 
                 n.y * sin(theta) + n.x * n.z * (1.0-cos(theta)), -n.x*sin(theta)+n.y*n.z*(1.0-cos(theta)), cos(theta)+n.z*n.z*(1.0-cos(theta)), 0,
              0, 0, 0, 1);
}

#pragma glslify: export(rotation)