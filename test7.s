.extern ll_puts ll_strcat
.data
        .globl  toofew
toofew:
        .asciz  "argc < 3"
        .data
        .globl  toomany
toomany:
        .asciz  "argc > 3"
        .text
        .globl  main
main:
        pushq   %rbp
        movq    %rsp, %rbp
        addq    $-96, %rsp
        movq    $0, -8(%rbp)
        pushq   %rax
        movq    %rdi, %rax
        cmpq    $3, %rax
        setl    -8(%rbp)
        popq    %rax
        pushq   %r15
        movq    $1, %r15
        cmpq    -8(%rbp), %r15
        popq    %r15
        je      main.few
        jmp     main.else
        .text
main.few:
        pushq   %rax
        pushq   %rbx
        leaq    toofew(%rip), %rax
        movq    $0, %rbx
        imulq   $0, %rbx
        addq    %rbx, %rax
        movq    $0, %rbx
        imulq   $0, %rbx
        addq    %rbx, %rax
        popq    %rbx
        movq    %rax, -16(%rbp)
        popq    %rax
        pushq   %rax
        pushq   %rdi
        pushq   -16(%rbp)
        popq    %rdi
        callq   ll_puts
        popq    %rdi
        movq    %rax, -24(%rbp)
        popq    %rax
        movq    $0, %rax
        movq    %rbp, %rsp
        popq    %rbp
        retq
        .text
main.else:
        movq    $0, -32(%rbp)
        pushq   %rax
        movq    %rdi, %rax
        cmpq    $3, %rax
        setg    -32(%rbp)
        popq    %rax
        pushq   %r15
        movq    $1, %r15
        cmpq    -32(%rbp), %r15
        popq    %r15
        je      main.many
        jmp     main.right
        .text
main.many:
        pushq   %rax
        pushq   %rbx
        leaq    toomany(%rip), %rax
        movq    $0, %rbx
        imulq   $0, %rbx
        addq    %rbx, %rax
        movq    $0, %rbx
        imulq   $0, %rbx
        addq    %rbx, %rax
        popq    %rbx
        movq    %rax, -40(%rbp)
        popq    %rax
        pushq   %rax
        pushq   %rdi
        pushq   -40(%rbp)
        popq    %rdi
        callq   ll_puts
        popq    %rdi
        movq    %rax, -48(%rbp)
        popq    %rax
        movq    $0, %rax
        movq    %rbp, %rsp
        popq    %rbp
        retq
        .text
main.right:
        pushq   %rax
        pushq   %rbx
        movq    %rsi, %rax
        movq    $1, %rbx
        imulq   $8, %rbx
        addq    %rbx, %rax
        popq    %rbx
        movq    %rax, -56(%rbp)
        popq    %rax
        pushq   %r14
        pushq   %r15
        leaq    -56(%rbp), %r14
        leaq    -64(%rbp), %r15
        pushq   %rax
        pushq   %r13
        movq    (%r14), %rax
        movq    (%rax), %r13
        movq    %r13, (%r15)
        popq    %r13
        popq    %rax
        popq    %r15
        popq    %r14
        pushq   %rax
        pushq   %rbx
        movq    %rsi, %rax
        movq    $2, %rbx
        imulq   $8, %rbx
        addq    %rbx, %rax
        popq    %rbx
        movq    %rax, -72(%rbp)
        popq    %rax
        pushq   %r14
        pushq   %r15
        leaq    -72(%rbp), %r14
        leaq    -80(%rbp), %r15
        pushq   %rax
        pushq   %r13
        movq    (%r14), %rax
        movq    (%rax), %r13
        movq    %r13, (%r15)
        popq    %r13
        popq    %rax
        popq    %r15
        popq    %r14
        pushq   %rax
        pushq   %rdi
        pushq   %rsi
        pushq   -64(%rbp)
        pushq   -80(%rbp)
        popq    %rsi
        popq    %rdi
        callq   ll_strcat
        popq    %rsi
        popq    %rdi
        movq    %rax, -88(%rbp)
        popq    %rax
        pushq   %rax
        pushq   %rdi
        pushq   -88(%rbp)
        popq    %rdi
        callq   ll_puts
        popq    %rdi
        movq    %rax, -96(%rbp)
        popq    %rax
        movq    $0, %rax
        movq    %rbp, %rsp
        popq    %rbp
        retq