# boo

A tiny Linux assembly program that screams only when run as root.

Inspired by **sudo boo**.

```console
$ boo
$ boo
$ sudo boo
[sudo] password for ghost:
AHHHH!!!
$
```

## Features

* Written entirely in assembly
* Direct Linux syscalls (no libc)
* Tiny statically linked binary
* Supports:

  * x86_64 (amd64)
  * AArch64 (arm64)

## Build

### x86_64

```sh
cd x86_64
./assemble.sh
```

### AArch64

```sh
cd aarch64
./assemble.sh
```

## How it works

`boo` calls `geteuid()` directly via a Linux syscall.

* If the effective UID is **0** (root), it writes:

```
AHHHH!!!
```

* Otherwise, it exits silently.

## License

MIT
