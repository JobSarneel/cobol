IDENTIFICATION DIVISION.
PROGRAM-ID. Stars.
AUTHOR. Job Sarneel.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 Stars      PIC *****.
01 NumOfStars PIC 9.

PROCEDURE DIVISION.
Begin.
  PERFORM VARYING NumOfStars FROM 0 BY 1 UNTIL NumOfStars > 5
    COMPUTE Stars = 10 ** (4 - NumOfStars)
    INSPECT Stars CONVERTING "10" TO SPACES
    DISPLAY NumOfStars " = " Stars
  END-PERFORM
  STOP RUN.