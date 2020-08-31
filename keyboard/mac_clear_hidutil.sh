#!/bin/bash

#
# Remaps Left control to be Command
# https://apple.stackexchange.com/questions/283252/how-do-i-remap-a-key-in-macos-sierra-e-g-right-alt-to-right-control
#

hidutil property --set \
'{"UserKeyMapping":
  [
  ]
}'

# /usr/bin/env python3
#
# def convert(val):
#     int_val = int(val, 16)
#     int_ref = 0x700000000
#     return hex(int_ref | int_val)
# l_ctrl = '0x0E'
# print(convert(l_ctrl))
