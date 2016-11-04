IDENTIFICATION DIVISION.
PROGRAM-ID. BookCollection. 
AUTHOR. Job Sarneel.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
   SELECT BookFile ASSIGN TO "Book.dat"
          ORGANIZATION IS SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD BookFile.
01 BookDetails.
   88  EndOfBookFile                    VALUE HIGH-VALUES.
   02  BSN                   PIC X(17). 
   02  BookAuthor.
       03 AuthSurname        PIC X(15).       
       03 AuthForename       PIC X(10).
       03 AuthMiddleInitials PIC X(6).
   02  BookTitle             PIC X(25).       
   02  BookPublisher         PIC X(35). 
   02  BookEdition           PIC X(2).  
   02  BookYearOfAppearance  PIC X(4).  

WORKING-STORAGE SECTION.
01 cv                        PIC X      VALUE ZERO.

PROCEDURE DIVISION.
Begin.
   OPEN EXTEND BookFile
   PERFORM GetBookData   
   CLOSE BookFile
   DISPLAY "************* End of Input ****************"

   OPEN INPUT BookFile     
   READ BookFile
     AT END SET EndOfBookFile TO TRUE
   END-READ
   PERFORM UNTIL EndOfBookFile
      DISPLAY BookDetails
      READ bookFile
        AT END SET EndOfBookFile TO TRUE
      END-READ
   END-PERFORM
   CLOSE BookFile
   STOP RUN.
   
GetBookData.
   DISPLAY "Enter ISBN:                     " WITH NO ADVANCING
   ACCEPT BSN	
   DISPLAY "Enter author's last name:       " WITH NO ADVANCING
   ACCEPT AuthSurname
   DISPLAY "Enter author's first name:      " WITH NO ADVANCING
   ACCEPT AuthForename              
   DISPLAY "Enter author's middle initials: " WITH NO ADVANCING
   ACCEPT AuthMiddleInitials
   DISPLAY "Enter book title:               " WITH NO ADVANCING
   ACCEPT BookTitle     
   DISPLAY "Enter book publisher:           " WITH NO ADVANCING
   ACCEPT BookPublisher   
   DISPLAY "Enter book edition:             " WITH NO ADVANCING
   ACCEPT BookEdition        
   DISPLAY "Enter book year of appearance:  " WITH NO ADVANCING
   ACCEPT BookYearOfAppearance
   WRITE BookDetails
   PERFORM ContinueOrQuit.

ContinueOrQuit.
  DISPLAY "Press 'c' to continue entering another book or 'v' to view record: " WITH NO ADVANCING
  ACCEPT cv
  EVALUATE cv
    WHEN "c" PERFORM GetBookData
    WHEN "v" DISPLAY "OK, I'll show you your records now."      
    WHEN OTHER
      DISPLAY "That's not a 'c' or a 'q'. Try again."
      PERFORM ContinueOrQuit
  END-EVALUATE.


