//@ charon-args=--skip-borrowck

struct Pair {
    a: i32,
    b: i32,
}

fn id1(x: &mut {mut b} Pair) -> &mut {mut b} Pair {
    x
}

fn must_compile(mut x: Pair) {
    let r: &mut {mut b} Pair = &mut x;

    let r = id1(r);

    let a_copied: i32 = x.a;

    r.b = 3;

}
