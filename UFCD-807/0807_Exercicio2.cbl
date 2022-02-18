      ******************************************************************
      * SOMAR 2 NÚMEROS INTEIROS COM 3 DIGITOS.
      *
      *
      *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 NUMERO1 PIC 9(03) VALUES 0.
       77 NUMERO2 PIC 9(03) VALUES 0.
       77 SOMA    PIC 9(04) VALUES 0.

       PROCEDURE DIVISION.
       INICIO-PROGRAMA.
           DISPLAY "QUAL O NUMERO:" AT 0101.
           ACCEPT NUMERO1 AT 0124.
           DISPLAY "QUAL O NUMERO:" AT 0301.
           ACCEPT NUMERO2 AT 0324.

           ACCEPT OMITTED.
           STOP RUN.
       END PROGRAM EX02.
