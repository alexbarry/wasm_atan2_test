# WASM atan2 test

**Update**: This is now fixed, and the current version of Firefox for Android in the Google play store has the fix! I raised [this bug in the Firefox for Android github repo](https://github.com/mozilla-mobile/fenix/issues/24565), which resulted in [this GeckoView bug being raised](https://bugzilla.mozilla.org/show_bug.cgi?id=1762899). And from [comment 3](https://bugzilla.mozilla.org/show_bug.cgi?id=1762899#c3), it looks like my copysign investigation helped. 

It looks like the fix made it into Firefox for Android version 99.

I'm super impressed that they were able to fix the bug right away, and that it made it to the play store within 2 weeks. (I guess it was actually 10 days?)

## Original description

This is a simple example page to calculate `atan2` from both:
* JS `Math.atan2(y,x)` and
* using the C standard library (`math.h`) `atan2(float y, float x)`, compiled to WASM.

Try it here: https://alexbarry.github.io/wasm_atan2_test/

The expected answers are:
* atan(y= 1, x=0) is +pi/2 ( 1.57...)
* atan(y=-1, x=0) is -pi/2 (-1.57...)

Which I receive on Firefox desktop, and Chrome on Android.

But on Firefox for Android, I received positive pi/2 for both.

## f64copysign

I have narrowed the problem down to how a single instruction is handled, `f64.copysign`. But only when the second argument to it is the first argument to the function?

See: https://alexbarry.github.io/wasm_atan2_test/f64copysign

This shows three outputs from calling three separate wasm functions:
* calling f64.copysign with the first argument as a constant 1.570.. and the second argument is the parameter to this function, which I am setting to -1 in this example. **I think this should be returning -pi/2 (-1.570796...), which it is on chrome for android and firefox for windows/linux, but it is returning pi/2.**
* calling f64.copysign with both arguments as constants. This is working as expected.
* calling f64.copysign with both arguments as as function parameters. This is working as expected.
