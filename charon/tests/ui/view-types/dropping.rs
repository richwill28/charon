//@ charon-args=--skip-borrowck
struct Pair {
    a: String,
    b: String,
}

fn read(_: &String) {}

fn must_compile(mut x: Pair) {
    let xr: &{b} Pair = &x;

    drop(x.a);

    read(&xr.b);
}
