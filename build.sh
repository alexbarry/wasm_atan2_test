set -e
set -u
set -x

mkdir -p out/obj

emcc \
	-Wall -Werror \
	-c test.c -o out/obj/test.o

cd out

emcc \
	-s EXTRA_EXPORTED_RUNTIME_METHODS="['ccall']" \
	-s EXPORTED_FUNCTIONS="['_calc_atan2']" \
	obj/test.o
