IDENTIFICATION DIVISION.
PROGRAM-ID.  Listing4-2.
AUTHOR.  Michael Coughlan.
*> Accepts two numbers from the user, multiplies them together
*> and then displays the result. 

DATA DIVISION.
WORKING-STORAGE SECTION.
01  Num1           PIC 9       VALUE 5.
01  Num2           PIC 9       VALUE 4.
01  Result         PIC --99.99 VALUE ZEROS.
01  Operator       PIC X       VALUE "-".
  88 ValidOperator VALUES "*", "/", "+", "-".
  
PROCEDURE DIVISION.
CalculateResult.
  DISPLAY "Enter a single digit number: " WITH NO ADVANCING
  ACCEPT Num1
  DISPLAY "Enter a single digit number: " WITH NO ADVANCING
  ACCEPT Num2 
  DISPLAY "Enter an operator (-, +, / or *): " WITH NO ADVANCING
  ACCEPT Operator

  DISPLAY "Num1 is: " Num1
  DISPLAY "Num2 is: " Num2

  EVALUATE Operator
    WHEN   "-" SUBTRACT Num2 FROM Num1 GIVING Result
    WHEN   "+" ADD      Num2 TO   Num1 GIVING Result
    WHEN   "/" DIVIDE   Num1 BY   Num2 GIVING Result ROUNDED
    WHEN   "*" MULTIPLY Num2 BY   Num1 GIVING Result
    WHEN   OTHER 
      DISPLAY Operator " is not a valid operator. Program will terminate."
      STOP RUN
  END-EVALUATE

  DISPLAY "Result is: " Result

  STOP RUN.
