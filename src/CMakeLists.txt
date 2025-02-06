cmake_minimum_required(VERSION 3.28)

project(Numpy-IO-Examples VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(load_npy load_npy.cpp)
target_link_libraries(load_npy xtensor)

add_executable(save_npy save_npy.cpp)
target_link_libraries(save_npy xtensor)

