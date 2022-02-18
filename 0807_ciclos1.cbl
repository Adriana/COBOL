      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CICLOS1.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 CONTADOR     PIC 9(02) VALUES 1.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "BOM DIA".
           ADD 1 TO CONTADOR.
           IF (CONTADOR <=10) THEN
               GO MAIN-PROCEDURE
           END-IF.
           STOP RUN.
       END PROGRAM CICLOS1.
