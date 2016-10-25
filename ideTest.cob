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
       01  cq  PIC 99.

       PROCEDURE DIVISION.
       Begin.
           DISPLAY "Hello world"
           IF n > 1
             DISPLAY "Let's troll :-D"
           END-IF
           STOP RUN.

       ContinueOrQuit.
           DISPLAY "Press 'c' to continue entering another book or 'q'"
                   " to quit: " WITH NO ADVANCING
           ACCEPT cq
           EVALUATE cq
             WHEN "c" DISPLAY " "
             WHEN "v" DISPLAY "OK, I'll show you your records now."
             WHEN OTHER
           DISPLAY "That's not a 'c' or a 'q'. Try again."
           PERFORM ContinueOrQuit
           END-EVALUATE.

       END PROGRAM YOUR-PROGRAM-NAME.
