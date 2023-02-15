.data
    impar: .asciiz "O numero é ímpar.\n"
    par: .asciiz "O numero é par\n"
    quebra_linha: .asciiz "\n"
.text
main:
    li $v0, 5
    syscall

    move $t0,$v0

    move $t1,$zero

    addi $t2,$zero,2

    div $t0,$t2

    mfhi $s0

    beq $s0,$t1,ehPar

ehImpar:

    li $v0 4
    la $a0, impar
    syscall

    j fim

ehPar:

    li $v0 4
    la $a0, par
    syscall

fim:
    li$v0 10
    syscall
