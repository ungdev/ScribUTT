#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def zfill_b(byteA, n: int):
    """
    Fill byte till length n.

    Output: bytes
    """

    if not isinstance(byteA, bytearray):
        byteA = bytearray(byteA)

    while n > len(byteA):
        byteA.insert(0, 0)

    return bytes(byteA)