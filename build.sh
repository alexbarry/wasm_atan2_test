set -e
set -u
set -x

mkdir -p obj/

emcc \
	-Wall -Werror \
	-c test.c -o obj/test.o


emcc \
	-s EXTRA_EXPORTED_RUNTIME_METHODS="['ccall']" \
	-s EXPORTED_FUNCTIONS="['_calc_atan2']" \
	obj/test.o
