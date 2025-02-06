#include <cassert>
#include <filesystem>
#include <iostream>
#include <string>

#include <xtensor/xarray.hpp>
#include <xtensor/xio.hpp>
#include <xtensor/xnpy.hpp>

int main(int argc, char* argv[])
{
    // Print the usage of the program.
    if (argc != 2)
    {
        std::cerr << "Usage: " << argv[0] << " <npy_file_path>" << std::endl;
        return 1;
    }
    std::string const npy_file_path{argv[1]};

    // Create a 4D array.
    auto const shape = xt::dynamic_shape<std::size_t>{2, 3, 4, 5};
    auto const volume = shape[0] * shape[1] * shape[2] * shape[3];
    xt::xarray<float> const float_array{
        xt::arange<float>(0, volume).reshape(shape)};
    xt::dump_npy(npy_file_path, float_array);
}