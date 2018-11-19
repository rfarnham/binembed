#include <vector>
#include <fstream>
#include <cassert>

int main(int argc, char* argv[]) {
  std::ofstream file("data.bin", std::ios::binary | std::ios::out | std::ios::trunc);
  assert(file.good());

  std::vector<float> v;
  for (size_t i = 0; i < 10; i++)
    v.push_back(i * 1.1);

  file.write((char*) v.data(), v.size() * sizeof(float));
  
  file.close();

  return 0;
}
