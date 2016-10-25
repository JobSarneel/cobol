IDENTIFICATION DIVISION.
PROGRAM-ID. Time.
AUTHOR. Job Sarneel.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 firstTime   				PIC 9(8).
01 secondTime  				PIC 9(8).
01 deltaTime   				PIC 9(8).
01 countdown   				PIC 99   	VALUE 10.

01 phrase      				PIC X(50) 	VALUE "De kat krabt de krullen van de trap.".
01 phraseIndex 				PIC 99		VALUE 1.
01 count-of-trailing-spaces PIC 99.
01 phraseLength				PIC 99.


PROCEDURE DIVISION.
Begin.
  ACCEPT firstTime FROM TIME
  DISPLAY "Variable 'firstTime' has value: " firstTime
  DISPLAY "Now we want a countdown, from ten to zero, printing a new line every second."

  PERFORM UNTIL countdown <= 0
    ACCEPT secondTime FROM TIME
    IF secondTime - firstTime > 100
      DISPLAY countdown
      MOVE secondTime TO firstTime
      SUBTRACT 1 FROM countdown GIVING countdown
    END-IF
  END-PERFORM

  DISPLAY "Great. The countdown works."
  DISPLAY "Now we should be able to print strings character by character too."

  *> First we need a string for displaying, let's call it 'phrase'.
  *> Then we'll check whether this 'reference modification' thing works:
  DISPLAY phrase(4:1)
  DISPLAY "A 'k' should show up."
  *> Nice. The 'k' did show up. Next we need a variable functioning as an index 
  *> traversing our string, and we need to get the length of our string. Let's see if this works:
  DISPLAY "The length of our string is: " FUNCTION LENGTH(phrase)
  *> HMPF. That just gives back 50, the amount of memory we declared for the string... We'll have
  *> to get rid of the unused memory to see how many characters our string actually has.
  MOVE ZERO TO count-of-trailing-spaces                                     

  INSPECT FUNCTION REVERSE(phrase)                       
    TALLYING count-of-trailing-spaces
    FOR LEADING SPACE

  SUBTRACT count-of-trailing-spaces                                     
    FROM FUNCTION LENGTH(phrase)
    GIVING phraseLength

  *> Let's see what that does.

  DISPLAY "Second try. The ACTUAL length of our phrase is: " phraseLength

  *> Exactly. 36. That's the length of our phrase. Now we're ready for our slowprint feature

  ACCEPT firstTime FROM TIME
  PERFORM UNTIL phraseIndex > phraseLength
    ACCEPT secondTime FROM TIME 
    IF secondTime - firstTime > 25
      DISPLAY phrase(phraseIndex:1)
      MOVE secondTime TO firstTime
      ADD 1 TO phraseIndex GIVING phraseIndex
    END-IF
  END-PERFORM

  *> That's a disappointment... Seems only to work if we have it print a character per line


    
  STOP RUN.
