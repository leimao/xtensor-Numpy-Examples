#include <cassert>
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

    // Load the 4D array from the npy file.
    xt::xarray<float> const float_array{xt::load_npy<float>(npy_file_path)};

    // Get the shape of the array.
    auto const shape = float_array.shape();
    assert(shape.size() == 4);
    assert(shape[0] == 2);
    assert(shape[1] == 3);
    assert(shape[2] == 4);
    assert(shape[3] == 5);

    // Access the elements of the array using a pointer.
    float const* const ptr{float_array.data()};
    for (size_t i{0}; i < float_array.size(); ++i)
    {
        assert(ptr[i] == static_cast<float>(i));
    }

    bool data_type_mismatch{false};
    try
    {
        xt::xarray<int> const int_array{xt::load_npy<int>(npy_file_path)};
    }
    catch (std::runtime_error const& e)
    {
        data_type_mismatch = true;
    }
    assert(data_type_mismatch);

    return 0;
}
