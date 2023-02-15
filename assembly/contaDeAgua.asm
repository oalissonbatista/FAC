.data
    quebra_linha: .asciiz "\n"

.text
main:
    li $v0, 5 
    syscall

    move $t1,$v0 # t1 = consumo de agua

    move $t2,$zero # t2 = 0 - valor a ser pago

    addi $t3,$zero,7 # t3 = 7 -  assinatura basica (7 reais)
    addi $t4,$zero,10 # t4 = 10
    addi $t5,$zero,30 # t5 = 30
    addi $t6,$zero,100 # t6 = 100
    addi $t0,$zero,2
    li $t8,5 

    #consumo entre 0-10m³
    ble $t1,$t4,assinaturaBasica

    #consumo maior que 10m³
    bgt $t1,$t4,intervalo1
    
assinaturaBasica:
    move $t2,$t3
    jal ImprimeValor

intervalo1:
    ble $t1,$t5,valor1
    bgt $t1,$t5,intervalo2

valor1:
    #1*(n-10))+7
    sub $t2,$t1,$t4
    addi $t2,$t2,7
    jal ImprimeValor

intervalo2:
    ble $t1,$t6,valor2
    bgt $t1,$t6,valor3
    
valor2:
    #20 + (2*(n-30))+7
    sub $t2,$t1,$t5
    mul $t2,$t2,$t0
    addi $t2,$t2,27
    jal ImprimeValor

valor3:
    #140+20+7 + (5*(n-100))
    sub $t2,$t1,$t6
    mul $t2,$t2,$t8
    addi $t2,$t2,167
ImprimeValor:

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0,4
    la $a0, quebra_linha
    syscall

    li $v0, 10
    syscall