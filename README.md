# xtensor Numpy Examples

## Introduction

In some use cases, we would like to load and save Numpy files in C++ applications. This repository provides examples to load and save Numpy files using the xtensor library.

## Usages

### Build Docker Image

To build the Docker image, please run the following command.

```bash
docker build -f docker/xtensor.Dockerfile --tag xtensor:24.04 .
```

### Run Docker Container

To run the Docker container, please run the following command.

```bash
docker run -it --rm -v $(pwd):/mnt -w /mnt xtensor:24.04
```

### Build and Run Examples

To build the examples, please run the following commands.

```bash
$ cmake -B build
$ cmake --build build --config Release --parallel
```

To run the examples, please run the following commands.

```bash
$ mkdir -p data

# Save npy file from Python
$ python python/save_npy.py --npy_file_path data/npy_data_from_python.npy
# Verify npy file from Python
$ python python/load_npy.py --npy_file_path data/npy_data_from_python.npy
# Verify npy file from C++
$ ./build/src/load_npy data/npy_data_from_python.npy

# Save npy file from C++
$ ./build/src/save_npy data/npy_data_from_cpp.npy
# Verify npy file from Python
$ python python/load_npy.py --npy_file_path data/npy_data_from_cpp.npy
# Verify npy file from C++
$ ./build/src/load_npy data/npy_data_from_cpp.npy
```

## References

- [C++ Load and Save Npy File Load Using xtensor](https://leimao.github.io/blog/CPP-Npy-Load-Save-xtensor/)
