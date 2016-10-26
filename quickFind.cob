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
           02 v             PIC 99     OCCURS 10 TIMES.

       01  i                PIC 99     VALUE 1.
       01  p                PIC 99.
           88 pIsValid                 VALUE 1 THRU 10.
       01  q                PIC 99.
           88 qIsValid                 VALUE 1 THRU 10.
       01  vp               PIC 99.
       01  vq               PIC 99.

       01  cm               PIC X.

       PROCEDURE DIVISION.
       Begin.
           DISPLAY "So, this is to be our QuickFind program, let's "
                   "see if we can get it to work."
           *> We'll start with populating the array with values
           *> identical to their indexes.
           PERFORM Populate

           *> Should be populated now, but we need a way to check. Let's
           *> get a 'Show' routine.
           PERFORM Show
           DISPLAY "Good. This is our structure in initial position: "
                   "every v is idendital to its i, respresenting the "
           DISPLAY "config in which every node is only connected to "
                   "itself."

           *> The next thing to do then is implementing a method for
           *> making connections. It's called 'Union'.
           PERFORM Union
           DISPLAY "Back in main now."

           *> This is not going so bad: we can connect nodes and have
           *> a bit of a program flow going on.
           *> The next method we are going to implement is one to check
           *> whether p and q are in the same group.
           PERFORM PandQConnected

           STOP RUN.

       PandQConnected.
           DISPLAY "Here you can check wheter two nodes are in the"
                   " same group. Enter a p: "
                   WITH NO ADVANCING
           ACCEPT p

           DISPLAY "And a q: "
                   WITH NO ADVANCING
           ACCEPT q

           IF NOT (pIsValid AND qIsValid)
               DISPLAY "There is something wrong with your input. "
                       "Please only enter integers from range 1-10."
               DISPLAY "Method will restart now."
               PERFORM PandQConnected
             ELSE
               DISPLAY "Thank you. Your input is valid. The program "
                       "will now check whether your nodes are in the "
                       "same group."
               IF v(p) EQUALS v(q)
                 DISPLAY "Node " p " and node " q " are both in group "
                         v(p)
                ELSE
                 DISPLAY "Node " p " and node " q " are not connected. "
               END-IF
           END-IF.

       Union.
           DISPLAY "This is the method for unification. Please enter "
                   "the index of the node you want to connect: "
                   WITH NO ADVANCING
           ACCEPT p

           DISPLAY "Please enter the index of the node you want to "
                   "connect it with: "
                   WITH NO ADVANCING
           ACCEPT q

           IF NOT (pIsValid AND qIsValid)
               DISPLAY "There is something wrong with your input. "
                       "Please only enter integers from range 1-10."
               DISPLAY "Method will restart now."
               PERFORM Union
             ELSE
               DISPLAY "Thank you. Your input is valid. The program "
                       "will now make the required updates in the "
                       "array."

               MOVE v(p) to vp
               MOVE v(q) to vq

               MOVE 1 TO i
               PERFORM UNTIL i > 10
 	               IF (v(i) EQUALs vp)
                   MOVE vq TO v(i)
                 END-IF
                 ADD 1 TO i
               END-PERFORM

               PERFORM Show
               PERFORM UnionOrMain

           END-IF.

       UnionOrMain.
           DISPLAY "Please press 'c' to make another connection, "
                   "or 'm' to return to main program flow: "
                   WITH NO ADVANCING
           ACCEPT cm
           EVALUATE cm
             WHEN 'c' PERFORM Union
             WHEN 'm' PERFORM DISPLAY " " END-PERFORM
             WHEN OTHER
               DISPLAY "That's not a 'c' or an 'm', please try again."
               PERFORM UnionOrMain
           END-EVALUATE.

       Show.
           MOVE 1 TO i
           DISPLAY "[v] " WITH NO ADVANCING
           PERFORM UNTIL i > 9
             DISPLAY "[" v(i) "] " WITH NO ADVANCING
             ADD 1 TO i
           END-PERFORM
           DISPLAY "[" v(i) "]"

           MOVE 1 TO i
           DISPLAY "[i] " WITH NO ADVANCING
           PERFORM UNTIL i > 9
             DISPLAY "[" i "] " WITH NO ADVANCING
             ADD 1 TO i
           END-PERFORM
           DISPLAY "[" i "]".

       Populate.
           PERFORM UNTIL i > 10
             MOVE i TO v(i)
             ADD 1 to i
           END-PERFORM.

       END PROGRAM QuickFind.
