.data
message: .asciiz "Meu nome é Alisson\n"
.text
main:
     li $v0,4
     la $a0, message
     syscall

     li $v0,10
     syscall