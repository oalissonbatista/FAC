.data   
    quebra_linha: .asciiz "\n"
    menorNegativo: .word -2147483648
.text
main:   
    li $v0 5
    syscall

    move $t0, $v0 # $t0 = n

    move $t2, $zero # indices do laço

    #addi $v0, $zero,5
    #syscall
    li $v0 5
    syscall

    move $t3,$v0

    move $t1,$t3
    addi $t0,$t0,-1
loop: 
    beq $t2, $t0, imprimirResultado  #if $t2 = $t0 vá para imprimirResultado

    li $v0 5
    syscall

    move $t3,$v0

    bgt $t3,$t1, maior

    addi $t2,$t2,1 #i++
    j loop

maior:
    move $t1,$t3
    addi $t2,$t2,1 #i++
    j loop

imprimirResultado:
    li $v0 1
    move $a0, $t1
    syscall

    li $v0 4
    la $a0, quebra_linha
    syscall

    li $v0 10
    syscall