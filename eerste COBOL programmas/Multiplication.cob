IDENTIFICATION DIVISION.
PROGRAM-ID. Multiplication.
Author. Job Sarneel.
*> Accepts two numbers from the user, multiplies them, and shows the resul.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Num1      PIC 9 VALUE 5.
01 Num2      PIC 9 VALUE 7.
01 Result    PIC 9 VALUE ZEROS.

PROCEDURE DIVISION.
CalculateReslut.
  DISPLAY "Enter a single digit number: " WITH NO ADVANCING
  ACCEPT Num1
  DISPLAY "Enter another single digit number: " WITH NO ADVANCING
  ACCEPT Num2
  MULTIPLY Num1 BY Num2 GIVING Result
  DISPLAY "Result is: ", Result
  STOP RUN.
  