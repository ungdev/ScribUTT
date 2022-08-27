#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def square_and_multiply(x: int, exponent: int, modulus: int = None, Verbose: bool = False):
    """
    Square and Multiply Algorithm

        x: positive integer
        exponent: exponent integer
        modulus: module

    Returns: x**exponent or x**exponent mod modulus when modulus is given
    """
    b = bin(exponent).lstrip("0b")
    r = 1
    for i in b:

        rBuffer = r
        r = r ** 2
        
        if i == "1":
            r = r * x
        if modulus:
            r %= modulus
        
        if Verbose:
            print(f"{rBuffer}^2 = {r} mod {modulus}")
    
    return r