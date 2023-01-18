cmake_minimum_required(VERSION 3.16)
project(main)


include_directories(lib/)
ADD_SUBDIRECTORY(lib)


set(CMAKE_CXX_STANDARD 17)
add_executable(main main.cpp)



