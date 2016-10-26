IDENTIFICATION DIVISION.
PROGRAM-ID. LinearSystem.
AUTHOR. Job Sarneel.
*> An attempt to write a program that solves linear systems.
*> Example:
*>  x + 2y + 3z = 39
*>  x + 3y + 2z = 34
*> 3x + 2y +  z = 26
*>
*> Has a unique solution at x = 2,75; y = 4,25; and z = 9,25.
*> The idea is that a system like this can be represented in a
*> two-dimensional array, which COBOL supports.
*> The idea is two write a program that processes the matrix,
*> yielding whether the system has any real solutions, and if so,
*> return those.
*> We'll start with something specifically for systems with three
*> equations and three unknowns. If we can get that to work we'll 
*> try to come up with a general solution forlinear systems of any 
*> size.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 matrix.
<<<<<<< HEAD
  02 equationCursor 			       	OCCURS 3 TIMES.
    03 element		   PIC S99V99		OCCURS 4 TIMES.

01 tempMatrix.
  02 tempEquation 				      	OCCURS 3 TIMES.
    03 tempElement	 PIC S99V99		OCCURS 4 TIMES.
=======
  02 equation        						  OCCURS 3 TIMES.
    03 element		PIC S99V99		  OCCURS 4 TIMES.

01 tempMatrix.
  02 tempEquation 	      				OCCURS 3 TIMES.
    03 tempElement	PIC S99V99		OCCURS 4 TIMES.
>>>>>>> efbfc8d1879cfe77f3ba5d104a0fbc0545bff8d7

01 equationIndex	   PIC 9			  VALUE 1.
01 elementIndex		   PIC 9			  VALUE 1.

01 equationCursor	   PIC 9			  VALUE 1.
01 elementCursor	   PIC 9        VALUE 1.

01 factor			       PIC S99V99.
01 product			     PIC S99V99.
01 populator		     PIC 99       VALUE 0.

PROCEDURE DIVISION.
Begin.
  *> Awesome. We've got some kind of a structure declared, now let's see if we can populate
  *> it with the data from our example. We'll do the populatin in a separate paragraph.
  PERFORM Populate
  
  *> Ok. We got a thing to populate or matrix. Now we want to display it. 'Display' is a 
  *> reserved word, so we'll call the paragraph 'Show' instead.
  DISPLAY "This should be your matrix:"
  PERFORM Show

  *> That's our matrix. Now we need to actually implent the algorithm to transform our
  *> matrix into reduced row echelon form. That's not trivial... We start with defining
  *> a cursor element, and from there a couple of steps has to be taken.
  *> 1.) If the cursor entry is 0, swap the cursor row with some row below to make the 
  *>     cursor entry nonzero.
  *> 2.) Divide the cursor row by the cursor entry, to make the cursor entry 1.
  *> 3.) Eliminate all other entries in the cursorcolumn by subtracting suitable multiples
  *>     of the cursor row from other rows.
  *> 4.) Move the cursor diagonally down-right, if this entry, and all below it, are zero,
  *>     move to the right in the same row. Return to step 1.
  *> So, we start at:

  MOVE 1 TO equationCursor
  MOVE 1 TO elementCursor

  IF element(equationCursor, elementCursor) EQUAL TO 0
    DISPLAY "Element(1,1) is equal to 0, so row 1 should be swapt with first row n where "
            "element(n,1) is not equal to 0."
    PERFORM Swap
  END-IF

  *> Ok... this wil need some generalization, but in principle the swapping works.
  *> Let's carry on with step two, that is, divide the whole row by the cursor-entry,
  *> so as to make the cursor-entry 1. Should not be hard.
  
  DISPLAY "This should be your matrix with the first row normalized:"
  PERFORM CursorTo1

  *> Hmm.. that kinda works too. Now step 3, that is, make evrything below or cursor 0.
  *> We'll call this routine 'ZerosUnder'.

  DISPLAY "This should be your matrix with zeros under your firs leading 1:"
  PERFORM ZerosUnder

  *> Cool. Our third step completed succesfully. That means we go to our final step now --
  *> apart from some refactoring, we got most of the code now!
  *> For step four we need to find our next cursor.

  ADD 1 TO equationCursor GIVING equationCursor
  ADD 1 TO elementCursor GIVING elementCursor

  *> Test wheter our new cursor porsition is non-zero (which it is in the working example), 
  *> wheter it's 1 (it is in the example), and then go to step 3 again

  IF element(equationCursor, elementCursor) EQUAL TO 0
    *> To be implemented, not needed now..   
    DISPLAY ""
  END-IF

  IF element(equationCursor, elementCursor) NOT EQUAL TO 1
    *> To be implemented, not needed now..   
    DISPLAY ""
  END-IF

  DISPLAY "This should be your matrix with zeros under your second leading 1:"
  PERFORM ZerosUnder

  DISPLAY "Congrats. You seem to have your matrix in RREF!"
  DISPLAY "The result suggests the solution to this system of equations is a line..."
  DISPLAY "Although I'm not absolutely positive, it seems the "


  STOP RUN.

ZerosUnder.
  ADD 1 TO equationCursor GIVING equationIndex
  MOVE elementCursor TO elementIndex
  PERFORM UNTIL equationIndex > 3
    IF element(equationIndex, elementIndex) NOT EQUAL TO 0
    MOVE element(equationIndex, elementIndex) TO factor
      PERFORM UNTIL elementIndex > 4        
        MULTIPLY factor BY element(equationCursor, elementIndex) 
          GIVING product
        SUBTRACT product FROM element(equationIndex, elementIndex) 
          GIVING tempElement(equationIndex, elementIndex)
        ADD 1 TO elementIndex
      END-PERFORM
      MOVE tempEquation(equationIndex) TO Equation(equationIndex)
    END-IF
    ADD 1 TO equationIndex
  END-PERFORM
  PERFORM Show.

CursorTo1.
  MOVE elementCursor TO elementIndex
  PERFORM UNTIL elementIndex > 4
    DIVIDE element(equationCursor, elementIndex) BY element(equationCursor, elementCursor) 
      GIVING TempElement(equationCursor, elementIndex) ROUNDED
    ADD 1 TO elementIndex GIVING elementIndex
  END-PERFORM
  MOVE tempEquation(equationCursor) TO Equation(equationCursor)
  PERFORM Show.

Swap.
  IF element(equationCursor + 1, elementCursor) NOT EQUAL TO 0
    MOVE equation(equationCursor) TO tempEquation(equationCursor)
    MOVE equation(equationCursor + 1) TO Equation(equationCursor)
    MOVE tempEquation(equationCursor) TO Equation(equationCursor + 1)
  END-IF
  PERFORM Show.


Show.
  MOVE 1 TO equationIndex
  MOVE 1 TO elementIndex
  PERFORM UNTIL equationIndex > 3
    PERFORM UNTIL elementIndex > 4
      DISPLAY "[" element(equationIndex, elementIndex) "]" WITH NO ADVANCING      
      ADD 1 TO elementIndex GIVING elementIndex      
    END-PERFORM
    DISPLAY ""
    MOVE 1 TO elementIndex
    ADD 1 TO equationIndex GIVING equationIndex
  END-PERFORM.


Populate.
  MOVE 1 TO equationIndex
  MOVE 1 TO elementIndex
  PERFORM UNTIL equationIndex > 3
    PERFORM UNTIL elementIndex > 4
      MOVE populator TO element(equationIndex, elementIndex)
      ADD 1 TO elementIndex GIVING elementIndex
      ADD 1 TO populator GIVING populator
    END-PERFORM
    MOVE 1 TO elementIndex
    ADD 1 TO equationIndex GIVING equationIndex
  END-PERFORM.

