//@ charon-args=--skip-borrowck
struct Pair {
    x: i32,
    y: i32,
}

fn f1(mut x: Pair) {
    let r: &{mut x} Pair = &mut x;
    r.x = 5;
}
