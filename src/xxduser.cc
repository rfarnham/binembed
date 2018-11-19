#include "xxd_data.h"
#include <iostream>

int main(int argc, char* argv[]) {
  for (float* p = (float*)data_bin; p != (float*)(data_bin + data_bin_len); p++)
    std::cout << *p << " ";

  std::cout << std::endl;
  
  return 0;
}
