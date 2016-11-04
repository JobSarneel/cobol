      ******************************************************************
      * Author: Job Sarneel
      * Date: 28-10-2016
      * Purpose: Beleggingsplan maken
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Beleggen.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01  maand                  PIC 999             VALUE 0.
       01  maandEP                PIC ZZ9.

       01  inleg                  PIC 9(4)V99         VALUE 0100.00.
       01  inlegEP                PIC $,999.99.

       01  dividend               PIC 99V9999         VALUE 0.012.
       01  dividendEP             PIC BBBB9.99.

       01  koersstijging          PIC 99V9999         VALUE 0.015.
       01  koersstijgingEP        PIC BBBB9.99.

       01  vermogen               PIC 9(7)V99         VALUE 0.
       01  vermogenEP             PIC $,$$$,$$9.99.

       01  quotient               PIC 99.
       01  rem                    PIC 9.
       01  dividenFactor          PIC 99V99.
       01  koersstijgingFactor    PIC 99V99.

       PROCEDURE DIVISION.
       Begin.
           DISPLAY "We gaan uitrekenen hoe snel we vermogen op kunnen "
                    "bouwen."
           MOVE inleg TO inlegEP
           DISPLAY "Inleg per maand:            " inlegEP
           MULTIPLY dividend BY 100 GIVING dividendEP
           DISPLAY "Dividend per kwartaal:      " dividendEP " %"
           MULTIPLY koersstijging BY 100 GIVING koersstijgingEP
           DISPLAY "Koersstijging per kwartaal: " koersstijgingEP " %"
           DISPLAY "**************************************"
           DISPLAY" "

           ADD 1.00 to dividend GIVING dividenFactor
           Add 1.00 to koersstijging GIVING koersstijgingFactor

           PERFORM UNTIL maand > 360
             DIVIDE maand by 3 GIVING quotient REMAINDER rem
             IF (rem EQUALS 0)
               MULTIPLY vermogen BY dividenFactor GIVING vermogen
               MULTIPLY vermogen BY koersstijgingFactor GIVING vermogen
             END-IF

             MOVE maand TO maandEP
             MOVE vermogen TO vermogenEP
             DISPLAY "Vermogen na maand " maandEP " : " vermogenEP
             ADD inleg TO vermogen
             ADD 1 TO maand
           END-PERFORM


           STOP RUN.
       END PROGRAM Beleggen.
