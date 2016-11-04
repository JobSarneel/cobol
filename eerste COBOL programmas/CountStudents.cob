IDENTIFICATION DIVISION.
PROGRAM-ID. CountStudents.
AUTHOR. Job Sarneel.

ENVIRONMENT DIVISION. 
INPUT-OUTPUT SECTION. 
FILE-CONTROL. 
    SELECT Entrants ASSIGN TO "Entrants.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD Entrants.
01 StudentRecord.
   88 EndOfEntrantsFile  VALUE HIGH-VALUES.
   02 StudentId          PIC 9(8).
   02 CourseCode         PIC X(5).
   02 Gender             PIC X.

WORKING-STORAGE SECTION.
01 HeadingLine1          PIC X(31)    VALUE "    First year entrants summary".
01 HeadingLine2          PIC X(40)    VALUE "   Course code    Number of students".
01 CourseLine.
   02 FILLER             PIC X(5)     VALUE SPACES.
   02 PrnCourseCode      PIC X(5).
   02 FILLER             PIC X(10)    VALUE SPACES.
   02 PrnNmbrStudents    PIC 9(3).
01 FinalTotalLine        PIC X(31)    VALUE "   Total students: ".

01 CourseTotal           PIC 9(3).
01 FinalTotal            PIC 9(3).
01 PrevCourseCode        PIC X(5)     VALUE "LM050".

PROCEDURE DIVISION.
Begin.
  DISPLAY HeadingLine1
  DISPLAY HeadingLine2

  OPEN INPUT Entrants 
  READ Entrants 
    AT END SET EndOfEntrantsFile TO TRUE
  END-READ
  PERFORM UNTIL EndOfEntrantsFile 
  IF CourseCode EQUALS PrevCourseCode
    ADD 1 TO CourseTotal, FinalTotal
    READ Entrants 
      AT END SET EndOfEntrantsFile TO TRUE
    END-READ 
   ELSE
    MOVE CourseTotal    TO PrnNmbrStudents
    MOVE PrevCourseCode TO PrnCourseCode
    DISPLAY CourseLine
    MOVE CourseCode TO PrevCourseCode  
    MOVE ZEROS TO CourseTotal
    ADD 1 TO CourseTotal, FinalTotal
    READ Entrants
      AT END SET EndOfEntrantsFile TO TRUE
    END-READ 
  END-IF  
  END-PERFORM
  MOVE CourseTotal    TO PrnNmbrStudents
  MOVE PrevCourseCode TO PrnCourseCode
  DISPLAY CourseLine
  DISPLAY FinalTotalLine WITH NO ADVANCING
  DISPLAY FinalTotal
  CLOSE Entrants 
  STOP RUN.
