IDENTIFICATION DIVISION.
PROGRAM-ID. MoveExamples.
AUTHOR. Job Sarneel.

DATA DIVISION.
WORKING-STORAGE SECTION.
*>01 Surname        PIC X(8)    VALUE "Sarneel".
01 Salesprice     PIC 9(4)V99 VALUE ZEROS.
01 NumOfEmployees PIC 999     VALUE ZEROS.
01 Salary         PIC 9999V99 VALUE ZEROS.
01 CountyName     PIC X(9)    VALUE ALL "@".

*> And a group (record):
01 StudentRec.
  02 StudentId    PIC 9(7).
  02 StudentName.
    03 Forename   PIC X(9).
    03 Surname    PIC X(12).
  02 DateOfBirth.
    03 YOB        PIC 9(4).
    03 MOB        PIC 99.
    03 DOB        PIC 99.
  02 CourseId     PIC X(5).
  02 GPA          PIC 9V99.


PROCEDURE DIVISION.

  DISPLAY "Variable 'Surname' has value: " Surname.
  DISPLAY "Now lets use a MOVE statement...".
  MOVE "Smith" TO Surname.
  DISPLAY "'Surname' value has changed to: " Surname.
  DISPLAY "Sweet. Long values get truncated, if we try to move 'Fitzwilliam' for intance...".
  MOVE "Fitzwilliam" TO Surname.
  DISPLAY "'Surname' value has changed to: " Surname.
  DISPLAY "Great. Now let's try some numeric values. We got a variable 'Salesprice' for that."
  DISPLAY "Variable 'Salesprice' has value: " Salesprice.
  DISPLAY "Let's alter the value to 25.5".
  MOVE 25.5 TO Salesprice.
  DISPLAY "'Salesprice' value has changed to: " Salesprice.
  MOVE 7.553 TO Salesprice.
  DISPLAY "'Salesprice' value has changed to: " Salesprice.
  MOVE 93425.158 TO Salesprice.
  DISPLAY "'Salesprice' value has changed to: " Salesprice.
  MOVE 128 TO Salesprice.
  DISPLAY "'Salesprice' value has changed to: " Salesprice.
  DISPLAY "'CountyName' is: " CountyName.

  MOVE "1205621William Fitzpatrick 19751021LM051385" TO StudentRec.
  DISPLAY "'StudentRec' is: " StudentRec.
  DISPLAY "'StudentId' is: " StudentId.
  DISPLAY "'StudentName' is: " StudentName.
  DISPLAY "'DateOfBirth' is: " DateOfBirth.
  DISPLAY "'CourseId' is: " CourseId.
  DISPLAY "'GPA' is: " GPA.

  MOVE SPACES TO StudentRec.
  DISPLAY "'StudentRec' is: " StudentRec.

  MOVE 5786 TO StudentId.
  MOVE "Rodriguez Gonzales" TO StudentName.
  MOVE 19850526 TO DateOfBirth.
  MOVE "LM5786" TO CourseId.
  MOVE 2.55 TO GPA.

  DISPLAY "'StudentRec' is: " StudentRec.
  DISPLAY "'Forename' is: " Forename.
  DISPLAY "Date of birth is: " DOB "/" MOB "/" YOB.
  DISPLAY "Studen name is: " Surname "," SPACE Forename.




  
  STOP RUN. 
