# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /tmp/tmp.MCUjEvz52g

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /tmp/tmp.MCUjEvz52g/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/libvirt_c_clion_remote_dev.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/libvirt_c_clion_remote_dev.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/libvirt_c_clion_remote_dev.dir/flags.make

CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o: CMakeFiles/libvirt_c_clion_remote_dev.dir/flags.make
CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o: ../main.c
	$(CMAKE_COMMAND) -E cmake_progress_report /tmp/tmp.MCUjEvz52g/cmake-build-debug/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o   -c /tmp/tmp.MCUjEvz52g/main.c

CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /tmp/tmp.MCUjEvz52g/main.c > CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.i

CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /tmp/tmp.MCUjEvz52g/main.c -o CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.s

CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.requires:
.PHONY : CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.requires

CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.provides: CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/libvirt_c_clion_remote_dev.dir/build.make CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.provides.build
.PHONY : CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.provides

CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.provides.build: CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o

# Object files for target libvirt_c_clion_remote_dev
libvirt_c_clion_remote_dev_OBJECTS = \
"CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o"

# External object files for target libvirt_c_clion_remote_dev
libvirt_c_clion_remote_dev_EXTERNAL_OBJECTS =

libvirt_c_clion_remote_dev: CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o
libvirt_c_clion_remote_dev: CMakeFiles/libvirt_c_clion_remote_dev.dir/build.make
libvirt_c_clion_remote_dev: CMakeFiles/libvirt_c_clion_remote_dev.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable libvirt_c_clion_remote_dev"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/libvirt_c_clion_remote_dev.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/libvirt_c_clion_remote_dev.dir/build: libvirt_c_clion_remote_dev
.PHONY : CMakeFiles/libvirt_c_clion_remote_dev.dir/build

CMakeFiles/libvirt_c_clion_remote_dev.dir/requires: CMakeFiles/libvirt_c_clion_remote_dev.dir/main.c.o.requires
.PHONY : CMakeFiles/libvirt_c_clion_remote_dev.dir/requires

CMakeFiles/libvirt_c_clion_remote_dev.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/libvirt_c_clion_remote_dev.dir/cmake_clean.cmake
.PHONY : CMakeFiles/libvirt_c_clion_remote_dev.dir/clean

CMakeFiles/libvirt_c_clion_remote_dev.dir/depend:
	cd /tmp/tmp.MCUjEvz52g/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /tmp/tmp.MCUjEvz52g /tmp/tmp.MCUjEvz52g /tmp/tmp.MCUjEvz52g/cmake-build-debug /tmp/tmp.MCUjEvz52g/cmake-build-debug /tmp/tmp.MCUjEvz52g/cmake-build-debug/CMakeFiles/libvirt_c_clion_remote_dev.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/libvirt_c_clion_remote_dev.dir/depend
