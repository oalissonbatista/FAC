.data
    espaco: .asciiz " "
    quebra_linha: .asciiz "\n"
.text
main:
    li $v0,5
    syscall

    move $a0,$v0 # multiplicando

    li $v0,5
    syscall

    move $a1,$v0 # multiplicador

    jal multfac
    j print

multfac:
    move $t1,$zero
    move $t3,$zero
    move $t0,$zero 
    mthi $zero 
    move $a2,$0
    move $s3,$zero   
    addi $t5,$zero,1
    addi $s4, $s4,31
    move $t7,$zero
    move $s7,$a0
    move $s8,$a1

    beq $a1, $0, fimDoLoop 
    beq $a0,$0, fimDoLoop


    blt $a0, $0, a0_negativo
    blt $a1, $0, a1_negativo
    j laco

    a0_negativo:
        sub $a0,$t7,$a0
        blt $a1, $0,os2_negativos
        bgt $a1,$0,hi

    a1_negativo:
        sub $a1,$t7,$a1
    hi:
        li $t3, 1
        j laco

    os2_negativos:
        sub $a1,$t7,$a1

    laco:

        andi $t2, $a0, 1       
        beq $t2, $0, deslocamentos 
        addu $t1, $t1, $a1 
        sltu $t2,$t1,$a1
        addu $t3,$t3,$t2
        addu $t3,$t3,$a2

    deslocamentos:
        srl $t2, $a1,31
        sll $a1, $a1, 1 
        sll $a2, $a2, 1 
        addu $a2,$a2,$t2

        srl $a0,$a0,1
        bne $a0,$0,laco

    fimDoLoop:
        beq $t3, $t5, ResultadoNegativo
        j fim

    ResultadoNegativo:
        sub $t1,$t7, $t1 
        sub $t3,$t7 ,$t3 

    fim:
        mult $s7,$s8
        mfhi $t0
        mtlo $t1
        mthi $t0

    jr $ra

print:
        
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0 4
    la $a0, espaco
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0,4
    la $a0, quebra_linha
    syscall