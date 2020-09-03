mat2 matrixPower(highp mat2 m, int n) {
  
  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //

  const int MAX_ITERATIONS = 16;
  mat2 r = mat2(1.0);

  for(int i = 0; i < MAX_ITERATIONS; i++) {
    if(i >= n) {
      break;
    }
    r = r * m;
  }

  return r;  
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)