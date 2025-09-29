.extern _ll_puts _ll_strcat
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
_main:
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
        callq   _ll_puts
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
        callq   _ll_puts
        popq    %rdi
        movq    %rax, -48(%rbp)
        popq    %rax
        movq    $0, %rax
        movq    %rbp, %rsp
        popq    %rbp
        retq
        .text
main.right:
        # --- Save registers used for calculation ---
        pushq   %rax
        pushq   %rbx
        
        # --- Compute first pointer ---
        movq    %rsi, %rax
        movq    $1, %rbx
        imulq   $8, %rbx
        addq    %rbx, %rax
        movq    %rax, -56(%rbp)
        
        # --- Dereference first pointer into -64(%rbp) ---
        pushq   %r14
        pushq   %r15
        pushq   %rax
        pushq   %r13
        movq    -56(%rbp), %rax
        movq    (%rax), %r13
        movq    %r13, -64(%rbp)
        popq    %r13
        popq    %rax
        popq    %r15
        popq    %r14
        
        # --- Compute second pointer ---
        pushq   %rax
        pushq   %rbx
        movq    %rsi, %rax
        movq    $2, %rbx
        imulq   $8, %rbx
        addq    %rbx, %rax
        movq    %rax, -72(%rbp)
        
        # --- Dereference second pointer into -80(%rbp) ---
        pushq   %r14
        pushq   %r15
        pushq   %rax
        pushq   %r13
        movq    -72(%rbp), %rax
        movq    (%rax), %r13
        movq    %r13, -80(%rbp)
        popq    %r13
        popq    %rax
        popq    %r15
        popq    %r14
        
        # --- Call ll_strcat ---
        movq    -64(%rbp), %rdi       # s1
        movq    -80(%rbp), %rsi       # s2
        
        subq    $8, %rsp              # align stack to 16-byte
        callq   _ll_strcat
        addq    $8, %rsp              # restore stack
        
        movq    %rax, -88(%rbp)       # store result
        
        # --- Call ll_puts ---
        movq    -88(%rbp), %rdi       # string argument

        subq    $8, %rsp
        callq   _ll_puts
        addq    $8, %rsp
        
        movq    %rax, -96(%rbp)       # store result of ll_puts if needed
        
        # --- Restore saved registers ---
        popq    %rbx
        popq    %rax
        
        # --- Return from function ---
        movq    $0, %rax
        movq    %rbp, %rsp
        popq    %rbp
        retq
