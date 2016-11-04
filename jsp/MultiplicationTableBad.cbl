      ******************************************************************
      * Author: M.A. Jackson
      * Date: seventies
      * Purpose: example of bad program structure
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MultiplicationTableBad.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77  lineNo                  PIC 99.
       77  colNo                   PIC 99.
       01  printLine.
           02 num      OCCURS 10   PIC ZZZ9.

       PROCEDURE DIVISION.
       PStart.
           MOVE SPACES TO printLine
           MOVE 1 TO lineNo
           MOVE 1 TO num(1)
           PERFORM PLine UNTIL lineNo = 10
           DISPLAY printLine
           STOP RUN.

       PLine.
           ADD 1 TO lineNo
           MOVE 0 TO colNo
           DISPLAY printLine
           PERFORM PNum UNTIL lineNo = colNo.

       PNum.
           ADD 1 TO colNo
           MULTIPLY lineNo by colNo GIVING num (colNo).

       END PROGRAM MultiplicationTableBad.
