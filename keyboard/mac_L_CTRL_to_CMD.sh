#!/bin/bash

#
# Remaps Left control to be Command
# https://apple.stackexchange.com/questions/283252/how-do-i-remap-a-key-in-macos-sierra-e-g-right-alt-to-right-control
#
# L_Ctrl  = 0xE0  = 0x7000000e0
# L_Alt   = 0xE2  = 0x7000000e2
# L_GUI   = 0xE3  = 0x7000000e3 (Windows Key, Mac Command)

hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x7000000e0,"HIDKeyboardModifierMappingDst":0x7000000e3}]}'
