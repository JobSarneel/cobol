IDENTIFICATION DIVISION.
PROGRAM-ID. UserDefinedClass.
Author. Job Sarneel.
*> Takes user input and checks whether it belongs to a certain class. 
*> Two classes are implemented: Hex number and Real name.

ENVIRONMENT DIVISION.
CONFIGURATION SECTION.
SPECIAL-NAMES. 
  CLASS HexNumber IS "0" THRU "9", "A" THRU "F".
  CLASS RealName IS "a" THRU "z", "A" THRU "Z", "'", SPACE.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 NumIn     PIC X(4).
01 NameIn    PIC X(15).

PROCEDURE DIVISION.
  DISPLAY "Enter a hex number: " WITH NO ADVANCING
  ACCEPT NumIn.
  IF NumIn IS HexNumber THEN
     DISPLAY NumIn " is a hex number."
   ELSE
     DISPLAY NumIn " is not a hex number."
  END-IF.

  DISPLAY "Enter a name: " WITH NO ADVANCING
  ACCEPT NameIn.
  IF NameIn IS ALPHABETIC THEN
     DISPLAY NameIn " is alphabetic."
   ELSE
     DISPLAY NameIn " is not alphabetic."
  END-IF.

  IF NameIn IS RealName THEN
     DISPLAY NameIn " is a real name."
   ELSE
     DISPLAY NameIn " is not a real name."
  END-IF.

  STOP RUN.
