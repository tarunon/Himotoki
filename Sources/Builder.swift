//
//  Builder.swift
//  Himotoki
//
//  Created by Syo Ikeda on 5/11/15.
//  Copyright (c) 2015 Syo Ikeda. All rights reserved.
//

// MARK: Builder

public func build<A, Value>(create: (A) throws -> Value)(_ a: A) rethrows -> Value {
    return try create(a)
}

public func build<A, B, Value>(create: (A, B) throws -> Value)(_ a: A, _ b: B) rethrows -> Value {
    return try create(a, b)
}

public func build<A, B, C, Value>(create: (A, B, C) throws -> Value)(_ a: A, _ b: B, _ c: C) rethrows -> Value {
    return try create(a, b, c)
}

public func build<A, B, C, D, Value>(create: (A, B, C, D) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D) rethrows -> Value {
    return try create(a, b, c, d)
}

public func build<A, B, C, D, E, Value>(create: (A, B, C, D, E) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) rethrows -> Value {
    return try create(a, b, c, d, e)
}

public func build<A, B, C, D, E, F, Value>(create: (A, B, C, D, E, F) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) rethrows -> Value {
    return try create(a, b, c, d, e, f)
}

public func build<A, B, C, D, E, F, G, Value>(create: (A, B, C, D, E, F, G) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G) rethrows -> Value {
    return try create(a, b, c, d, e, f, g)
}

public func build<A, B, C, D, E, F, G, H, Value>(create: (A, B, C, D, E, F, G, H) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h)
}

public func build<A, B, C, D, E, F, G, H, I, Value>(create: (A, B, C, D, E, F, G, H, I) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i)
}

public func build<A, B, C, D, E, F, G, H, I, J, Value>(create: (A, B, C, D, E, F, G, H, I, J) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, Value>(create: (A, B, C, D, E, F, G, H, I, J, K) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T, _ u: U) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T, _ u: U, _ v: V) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T, _ u: U, _ v: V, _ w: W) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T, _ u: U, _ v: V, _ w: W, _ x: X) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T, _ u: U, _ v: V, _ w: W, _ x: X, _ y: Y) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y)
}

public func build<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, Value>(create: (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z) throws -> Value)(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J, _ k: K, _ l: L, _ m: M, _ n: N, _ o: O, _ p: P, _ q: Q, _ r: R, _ s: S, _ t: T, _ u: U, _ v: V, _ w: W, _ x: X, _ y: Y, _ z: Z) rethrows -> Value {
    return try create(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z)
}
