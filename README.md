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

# f64copysign

I have narrowed the problem down to how a single instruction is handled, `f64.copysign`. But only when the second argument to it is the first argument to the function?

See: https://alexbarry.github.io/wasm_atan2_test/f64copysign

This shows three outputs from calling three separate wasm functions:
* calling f64.copysign with the first argument as a constant 1.570.. and the second argument is the parameter to this function, which I am setting to -1 in this example. **I think this should be returning -pi/2 (-1.570796...), which it is on chrome for android and firefox for windows/linux, but it is returning pi/2.**
* calling f64.copysign with both arguments as constants. This is working as expected.
* calling f64.copysign with both arguments as as function parameters. This is working as expected.
