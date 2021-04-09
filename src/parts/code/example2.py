#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import ressources.tools as t
import socket
import struct

class TCP:
    """
    Represent a TCP packet.
    Nether case nor order are important.
    """
    
    def __init__(self, src_host:str, dst_host:str, src_port:str, dst_port:int, seq_num:int = 0, ack_num:int = 0, win_size:int = 8192, flags:str = "001011010", length:int = 612):
        """
        Constructor of TCP packet. 
        """
        self.src_host = src_host
        self.dst_host = dst_host
        self.src_port = src_port
        self.dst_port = dst_port
        self.seq_num = seq_num
        self.ack_num = ack_num
        self.win_size = win_size   
        self.flags = int(flags,2) # car 0b001011010 == 90
        self.length = length

    def build(self) -> bytes:
        packet = struct.pack(
            '!HHIIBBHHH',
            self.src_port,  # Source Port
            self.dst_port,  # Destination Port
            self.seq_num,              # Sequence Number
            self.ack_num,              # Acknoledgement Number
            5 << 4,         # Data Offset
            self.flags,     # Flags
            self.win_size,           # Window
            0,              # Checksum (initial value)
            0               # Urgent pointer
        )

        pseudo_hdr = struct.pack(
            '!4s4sHH',
            socket.inet_aton(self.src_host),    # Source Address
            socket.inet_aton(self.dst_host),    # Destination Address
            socket.IPPROTO_TCP,                 # PTCL = 6
            len(packet) + self.length           # TCP Length
        )

        packet += t.payload(self.length) # adding payload

        checksum = t.checksum(pseudo_hdr + packet)

        # calculate the checksum and insert it back into the packet

        packet = packet[:16] + struct.pack('H', checksum) + packet[18:]

        return packet