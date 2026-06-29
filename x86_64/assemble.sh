#!/usr/bin/env sh

clang -nostdlib -static -fno-pic -fno-pie -Wl,--build-id=none -Wl,-n -s boo.s -o boo
sstrip boo

# as boo.s -o boo.o
# ld -T link.ld -s --build-id=none -o boo boo.o
