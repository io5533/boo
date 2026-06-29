.global _start

.section .text
_start:
    mov     x8, #175 // sys_fork (또는 sys_clone)
    svc     #0

    cbnz    x0, 1f  // 부모 프로세스라면 종료 라벨(1:)로 점프

    mov     x0, #1  // stdout
    adr     x1, msg
    mov     x2, #10
    mov     x8, #64 // sys_write
    svc     #0

1:
    mov     x8, #93 // sys_exit
    mov     x0, #0       
    svc     #0

msg:
    .ascii  "AHHHH!!!!\n"
