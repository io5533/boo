.global _start
.text

_start:
    push $107
    pop  %rax
    syscall # geteuid()

    test %eax, %eax
    jne  1f
    
    inc  %eax # eax = 1 (write)
    # edi = 0 이미 (geteuid 보존 + 프로세스 초기화)
    # → fd=0(stdin)으로 write, 터미널에선 동일 동작
    lea  msg(%rip), %rsi
    push $10
    pop  %rdx
    syscall

1:
    push $60
    pop  %rax
    # edi = 0 이미 → xor 생략 가능
    syscall

msg:
    .ascii "AHHHHH!!!\n"
