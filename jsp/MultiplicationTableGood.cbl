      ******************************************************************
      * Author: M.A. Jackson
      * Date: seventies
      * Purpose: example of good program structure
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
       PTable.
           PERFORM PLine VARYING lineNo FROM 1 BY 1
                   UNTIL lineNo > 10
           STOP RUN.

       PLine.
           MOVE SPACES TO printLine
           PERFORM PNum VARYING colNo FROM 1 BY 1
                   UNTIL colNo > lineNo
           DISPLAY printLine.

       PNum.
           MULTIPLY lineNo BY colNo GIVING num (colNo).

       END PROGRAM MultiplicationTableBad.
