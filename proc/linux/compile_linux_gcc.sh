#!bin/sh

rm -rf bin
mkdir bin
cd bin

proj_root_dir=$(pwd)/../

flags=(
	-std=gnu99 -Wl,--no-as-needed -ldl -lGL -lX11 -pthread -lXi
)

# Include directories
inc=(
	-I ../third_party/include/gunslinger/	# Gunslinger includes
	-I ../include/							# SandSim includes
)

# Source files
src=(
	../source/main.c
	../source/render_passes/*.c
)

lib_dirs=(
	-L ../third_party/libs/linux/
)

libs=(
	-lgunslinger
)

# Build
gcc -O3 ${inc[*]} ${src[*]} ${flags[*]} ${lib_dirs[*]} ${libs[*]} -lm -o ParticleSim

cd ..



