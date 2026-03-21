//@ charon-args=--skip-borrowck
struct Pair {
    x: usize,
    y: usize,
}

fn f(x: &mut Pair) {
    fn g0(x: &mut {x, mut y} Pair) -> &usize { &x.x }
    let x0: &usize = g0(x);
}
