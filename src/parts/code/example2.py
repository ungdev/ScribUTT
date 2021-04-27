#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import ressources.utils as ut


def inv(a: int, m: int, Verbose: bool = False):
    """
    Returns inverse of a mod m.

    If a and m are prime to each other, then there is an a^(-1) such that a^(-1) * a is congruent to 1 mod m.
    """

    # Error raising

    if ut.euclid(a, m) != 1:
        if Verbose:
            print(f"gcd({a}, {m}) = {ut.euclid(a, m)} != 1 thus you cannot get an invert of {a}.")
        raise ValueError(f"gcd({a}, {m}) != 1 thus you cannot get an invert of {a}.")
        # a modular multiplicative inverse can be found directly

    if a == 0:
        if Verbose:
            print("a = 0 and 0 cannot have multiplicative inverse ( 0 * nothing = 1 ) .")
        raise ValueError("0 cannot have multiplicative inverse.")

    # Next

    if ut.millerRabin(m) and m % a != 0:
        # A simple consequence of Fermat's little theorem is that if p is prime and does not divide a
        # then a^−1 congruent to a^(p − 2) (mod p) is the multiplicative
        if Verbose:
            print(f"From Fermat's little theorem, because {m} is prime and does not divide {a} so: {a}^-1 = {a}^({m}-2) mod {m}")
        u = ut.square_and_multiply(a, m - 2, m)

    elif ut.coprime(a, m) and m < (1 << 20):
        # From Euler's theorem, if a and n are coprime, then a^−1  congruent to a^(phi(n) − 1) (mod n).
        if Verbose:
            print(f"From Euler's theorem, because {a} and {m} are coprime -> {a}^-1 = {a}^(phi({m})-1) mod {m}")

        u = ut.square_and_multiply(a, phi(m, 1, 1, Verbose) - 1, m)

    else:
        if Verbose:
            print("Modular inverse u solves the given equation: a.u+m.v=1.\n Let's use the euclid extended algorithm tho.")

        # Modular inverse u solves the given equation: a.u+m.v=1
        # n number of iterations
        _, u, _, _, _ = ut.euclid_ext(a, m, Verbose)

        if u < 0:
            u += m

    if Verbose:
        return u, f"u = {u} + {m}k, k in Z"

    return u