cmake_minimum_required(VERSION 2.8.4)
project(libvirt_c_clion_remote_dev C)
set(CMAKE_C_STANDARD 99)

link_libraries("/usr/lib64/libvirt.so")

add_executable(libvirt_c_clion_remote_dev main.c)