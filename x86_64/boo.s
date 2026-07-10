.global _start
.text

_start:
    # geteuid()
    push $107                # SYS_geteuid
    pop  %rax
    syscall

    # Skip if EUID != 0
    test %eax, %eax
    jne 1f

    # write(1, msg, 10)
    inc  %eax                # SYS_write (0 -> 1)
    push $1
    pop  %rdi                # fd = stdout
    lea  msg(%rip), %rsi
    push $9
    pop  %rdx                # message length
    syscall

1:
    # exit(0)
    push $60                 # SYS_exit
    pop  %rax
    xor  %edi, %edi          # status = 0
    syscall

msg:
    .ascii "AHHHH!!!\n"
