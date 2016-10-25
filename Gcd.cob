IDENTIFICATION DIVISION.
PROGRAM-ID. GCD.
AUTHOR. Euclid.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 A   PIC 9(4).
01 B   PIC 9(4).
01 Hi  PIC 9(4).
01 Lo  PIC 9(4).
01 Res PIC 9(4).
01 Rem PIC 9(4).

PROCEDURE DIVISION.
Begin.
  DISPLAY "Please enter a first integer: " WITH NO ADVANCING
  ACCEPT A
  DISPLAY "Please enter a second integer: " WITH NO ADVANCING
  ACCEPT B

  IF A > B
    MOVE A TO Hi
    MOVE B TO Lo
   ELSE 
    MOVE B TO Hi
    MOVE A TO Lo
  END-IF

  DISPLAY "The biggest number you entered is:  " Hi
  DISPLAY "The smallest number you entered is: " Lo
  PERFORM Algorithm.  

Algorithm.
  IF Lo EQUALS 0 
    DISPLAY "The greatest common divider of " A " and " B " is: " Hi
    STOP RUN
   ELSE
    DIVIDE Hi BY Lo GIVING Res REMAINDER Rem
    MOVE Lo TO Hi
    MOVE Rem TO Lo
    PERFORM Algorithm
  END-IF.
