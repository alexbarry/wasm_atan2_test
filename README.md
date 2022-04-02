# WASM atan2 test

This is a simple example page to calculate `atan2` from both:
* JS `Math.atan2(y,x)` and
* using the C standard library (`math.h`) `atan2(float y, float x)`, compiled to WASM.

Try it here: https://alexbarry.github.io/wasm_atan2_test/

The expected answers are:
* atan(y= 1, x=0) is +pi/2 ( 1.57...)
* atan(y=-1, x=0) is -pi/2 (-1.57...)

Which I receive on Firefox desktop, and Chrome on Android.

But on Firefox for Android, I received positive pi/2 for both.
