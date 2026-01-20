//@ charon-args=--skip-borrowck
struct Pair {
    x: usize,
    y: usize,
}

fn shared_fileds1(p: Pair) {
    fn g(a: &mut {mut x} Pair, b: &mut {mut y} Pair) {}
    g(&mut {mut x} p, &mut {mut y} p);
}
