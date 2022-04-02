

#include<stdio.h>
#include<math.h>

float calc_atan2(float y, float x) {
	float val = atan2(y, x);
	printf("atan(%+f, %+f) = %+f\n", y, x, val);
	return val;
}


int main(void) {
	calc_atan2(-1.0, 0);
	calc_atan2( 1.0, 0);
}
