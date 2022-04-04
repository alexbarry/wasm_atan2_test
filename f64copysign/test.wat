(module
	(func (export "copysign_w_2nd_arg")(param $p0 f64)(result f64)
        (f64.copysign
          (f64.const 0x1.921fb54442d18p+0 (;=1.5708;))
          (local.get $p0))
	)
	(func (export "copysign_w_consts")(result f64)
        (f64.copysign
          (f64.const 0x1.921fb54442d18p+0 (;=1.5708;))
          (f64.const -1))
	)
	(func (export "f64copysign")(param $lhs f64)(param $rhs f64)(result f64)
		(local.get $lhs)
		(local.get $rhs)
		(f64.copysign)
	)
)
