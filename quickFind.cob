      ******************************************************************
      * Author: Job Sarneel
      * Date: 26-10-2016
      * Purpose: practice
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. QuickFind.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  structure.
           02 v            PIC 99      OCCURS 10 TIMES.

       01  i               PIC 99      VALUE 1.

       PROCEDURE DIVISION.
       Begin.
           DISPLAY "So, this is to be our QuickFind program, let's "
                   "see if we can get it to work."
           *> We'll start with populating the array with values
           *> identical to their indexes.
           PERFORM Populate

           STOP RUN.

       Populate.
           PERFORM UNTIL i > 10
             MOVE i TO v(i)
             ADD 1 to i
           END-PERFORM.

       END PROGRAM QuickFind.
