.data
  expVal23:    .asciiz  "Expected Value : 23  Your Value : "
  expVal21:    .asciiz  "Expected Value : 21  Your Value : "
  endl:        .asciiz  "\n"

.text
.globl main
# #
# int getDigit(int number);
# List Used Registers Here:
#
# #
getDigit:
    li  $t5, 10
    mul $t3,$t2,2
    sgt $t4,$t3,$t5
    beq $t4,1,Run
    add $t0,$t0,$t3
j return

Run:

    div $t3,$a1
    mfhi $t4
    add $t0,$t0,$t4
    div $t3,$a1
    mflo $t4
    add $t0,$t0,$t4
    
j return



##
# int sumOfDoubleEvenPlace(int number);
# List Used Registers Here:
# sum --> $s0
# digit --> $s1
# 
##
sumOfDoubleEvenPlace:

    li $t1,0
    li $a1,10
    li $a2,100
    div $t2,$a1
    mflo $t2
    
while:

    div $t2,$a1
    mfhi $t3
j getDigit

return:
    
    li $t3,0 
    div $t2,$a2
    mflo $t2
    slt $t4,$t2,$t3
    beq $t4,1, while
jr $ra
  

main:

  li $s0, 89744563  # int test1 = 89744563;
  li $s1, 98756421  # int test2 = 98756421;
  li $s2, 0         # int result1 = 0;
  li $s3, 0         # int result2 = 0;
  
  move $t1,$s0
  jal sumOfDoubleEvenPlace
  move $s2,$t0
  move $t1,$s1
  jal sumOfDoubleEvenPlace
  move $s3,$t0


  # code for first function call

  add $a0, $0, $s0
  jal sumOfDoubleEvenPlace
  add $s2, $0, $v0 

  la   $a0, expVal23     
  addi $v0, $0, 4     
  syscall             

  move $a0, $s2       
  addi $v0, $0, 1     
  syscall             

  la   $a0, endl      
  addi $v0, $0, 4     
  syscall

   # code for first function call

  add $a0, $0, $s1
  jal sumOfDoubleEvenPlace
  add $s3, $0, $v0 

  la   $a0, expVal21     
  addi $v0, $0, 4     
  syscall             

  move $a0, $s3       
  addi $v0, $0, 1     
  syscall             

  la   $a0, endl      
  addi $v0, $0, 4     
  syscall

  li $v0, 10
  syscall
