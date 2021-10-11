// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    @KBD
    D=A
    @kbdadr
    M=D // keyboard addresses
(LOOP)
    @SCREEN
    D=A
    @idx
    M=D // index of memory address 

    @KBD
    D=M
    @BLACK
    D;JGT

    @color
    M=0
    @WRITE
    0;JMP

(BLACK)
    @color
    M=-1
    @WRITE
    0;JMP

(WRITE)
    @color
    D=M
    @idx
    A=M
    M=D

    @idx
    M=M+1
    D=M
    @kbdadr
    D=M-D
    @LOOP
    D;JEQ
    
    @WRITE
    0;JMP
@LOOP
0;JMP
