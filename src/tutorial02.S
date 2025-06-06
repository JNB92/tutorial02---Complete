.section .init0 // Places code at the top of programme memory

entry:
    ldi r16, 0xFF
    mov r1, r16
    ldi r22, 0x10
    ldi r16, 0xCC
    mov r4, r16

// DO NOT EDIT ABOVE THIS LINE //

    // WARNING:
    //   Do not modify the values in the following registers
    //   unless specified by the exercise:
    //     R1  (Ex 2.1)
    //     R4  (Ex 2.9)
    //     R20 (Ex 2.2)
    //     R22 (Ex 2.6)

    // Ex 2.0
    //
    // Write assembly code to add the numbers 53 and 34
    // together and store the result in register R0.
    //
    // Hint:
    //   Recall the "ldi" instruction is used to load a value into a register,
    //   and the "mov" instruction will copy a value between registers.

    ldi r17, 53
    ldi r18, 34
    add r0, r17
    add r0, r18
    // Write your code for Ex 2.0 above this line.
    mov r16, r0
    call avremu_r16out

    // Ex 2.1
    //
    // Using the "and" instruction, clear only bits 2, 3, and 7 of R1.

    ldi r17, 0x73
    and r1, r17
    // Write your code for Ex 2.1 above this line.
    mov r16, r1
    call avremu_r16out
    
    // Ex 2.2
    //
    // Using the "ori" instruction, set only bits 1, 3, and 5 of R20.

    ori r20, 0x2A
    // Write your code for Ex 2.2 above this line.
    mov r16, r20
    call avremu_r16out

    // Ex 2.3
    //
    // Using exactly one instruction, add 1 to the value of R0.
    //
    // Hint:
    //   You can find a full list of arithmetic instructions summarised in
    //   Table 5-2 of the AVR Instruction Set Manual.

    inc r0
    // Write your code for Ex 2.3 above this line.
    mov r16, r0
    call avremu_r16out

    // Ex 2.4
    //
    // Write assembly code to add 44 to 14685, storing the result
    // in register pair R30:R31 (low byte in R30).

    ldi r30, 0x5D
    ldi r31, 0x39
    ldi r16, 0x2C
    add r30, r16
    // Write your code for Ex 2.4 above this line.
    mov r16, r30
    call avremu_r16out
    mov r16, r31
    call avremu_r16out

    // Ex 2.5
    //
    // Follow the steps below to complete this exercise.
    //
    // Step 1: Encode the decimal value -4 as a two's complement, 8-bit number.
    // Step 2: Write down the result of Step 1 as a hexadecimal literal.
    // Step 3: Swap the two nibbles of the hexadecimal literal you wrote in Step 2.
    // Step 4: Load the result of Step 3 into register R21.

    ldi r21, 0xCF
    // Write your code for Ex 2.5 above this line.
    mov r16, r21
    call avremu_r16out

    // Ex 2.6
    //
    // Write assembly code to subtract the value in R22 from 91,
    // using the "add" instruction, storing the result in R23.

    ldi r17, 91
    neg r22
    add r23, r17
    add r23, r22
    // Write your code for Ex 2.6 above this line.
    mov r16, r23
    call avremu_r16out

    // Ex 2.7
    //
    // Write assembly code to multiply the number 20 by 2,
    // using the "lsl" instruction, storing the result in R2.

    ldi r16, 20
    mov r2, r16
    lsl r2
    // Write your code for Ex 2.7 above this line.
    mov r16, r2
    call avremu_r16out

    // Ex 2.8
    //
    // Write assembly code to divide the number -37 by 4,
    // using the "asr" instruction, storing the result in R3.

    ldi r16, 0xDB 
    mov r3, r16
    asr r3
    asr r3
    // Write your code for Ex 2.8 above this line.
    mov r16, r3
    call avremu_r16out

    // Ex 2.9
    //
    // Write assembly code to toggle the most significant bit, and
    // least significant 4 bits of R4.

    ldi r17, 0x8F
    eor r4, r17
    // Write your code for Ex 2.9 above this line.
    mov r16, r4
    call avremu_r16out

// END OF TUTORIAL02 EXERCISES //
// DO NOT EDIT BELOW THIS LINE //

    ldi r16, 0x22      // DISP_EN (PB1) | DISP_DP (PB5)
    sts 0x0420, r16    // Set as outputs
    sts 0x0424, r16    // Drive high

    break

    ldi r16, 0x20 // DISP_DP (PB5)
    ldi r17, 0x00

loop:
    // Delay
    com r17
    brne loop
    inc r18
    brne loop
    inc r19
    brne loop

    // Toggle DP LED
    sts 0x0427, r16

    rjmp loop // Loop indefinitely

// This procedure outputs the contents of R16 when using the emulator.
// Address 0x1500 is reserved in the memory map so this procedure has
// no effect when running on the ATtiny1626 hardware.
avremu_r16out:
    sts 0x1500, r16
    ret
