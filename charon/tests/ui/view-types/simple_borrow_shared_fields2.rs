//@ charon-args=--skip-borrowck
struct Pair {
    x: usize,
    y: usize,
}

fn shared_fileds1(p: Pair) {
    fn g(a: &{x} Pair, b: &{x, y} Pair) {}
    g(&{x} p, &{x, y} p);
}
