      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  n   PIC 99      VALUE 2.
       01  cq  PIC X.

       PROCEDURE DIVISION.
       Begin.
           DISPLAY "Hello world"
           IF n > 1
             DISPLAY "Let's troll :-D"
           END-IF

           PERFORM ContinueOrQuit
           DISPLAY "Ok, so you want to continue? Too bad, this is all "
                   "there is.."
           STOP RUN.

       ContinueOrQuit.
           DISPLAY "Press 'c' to continue or 'q'"
                   " to quit: " WITH NO ADVANCING
           ACCEPT cq
           EVALUATE cq
             WHEN "c" DISPLAY " "
             WHEN "q"
               DISPLAY "OK, we'll stop the program now."
               STOP RUN
             WHEN OTHER
               DISPLAY "That's not a 'c' or a 'q'. Try again."
               PERFORM ContinueOrQuit
           END-EVALUATE.

       END PROGRAM YOUR-PROGRAM-NAME.
