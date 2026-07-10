.global _start

.section .text
_start:
    mov     x8, #175 // sys_geteuid
    svc     #0

    cbnz    x0, 1f   // Exit if EUID is not 0 (non-root)

    mov     x0, #1   // stdout
    adr     x1, msg
    mov     x2, #10  // Message length
    mov     x8, #64  // sys_write
    svc     #0

1:
    mov     x8, #93  // sys_exit
    mov     x0, #0   // Exit status
    svc     #0

msg:
    .ascii  "AHHHH!!!!\n"
