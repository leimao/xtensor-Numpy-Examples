cmake_minimum_required(VERSION 3.28)

project(xtensor-Numpy-Examples VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find xtensor
find_package(xtensor REQUIRED)

add_subdirectory(src)