.data
    quebra_linha: .asciiz "\n"
    zero: .float 0.0

.text
main:

    li $v0 5
    syscall
    move $a0, $v0 #numero de termos

    move $a1,$zero #contador

    lwc1 $f12,zero #media
    lwc1 $f5,zero #usado pra somar 0
    lwc1 $f6,zero # soma dos pesos

loop:  
    beq $a1,$a0,fim

    li $v0 6
    syscall
    add.s $f1,$f5,$f0

    add.s $f6,$f6,$f1

    li $v0 6
    syscall
    add.s $f3,$f5,$f0

    mul.s $f4,$f1,$f3
    add.s $f7,$f7,$f4

    addi $a1,$a1,1
    j loop

fim:
    div.s $f12, $f7, $f6
    li $v0 2
    syscall

    li $v0 4
    la $a0,quebra_linha
    syscall

    li $v0 10
    syscall