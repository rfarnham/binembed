#include <iostream>

extern float data_start, data_end;

int main(int argc, char* argv[]) {
  for (float *p = &data_start; p != &data_end; p++)
    std::cout << *p << " ";

  std::cout << std::endl;

  return 0;
}
