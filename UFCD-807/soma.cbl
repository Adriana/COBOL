      ******************************************************************
      * SOMAR 2 N⁄MEROS INTEIROS COM 3 DIGITOS.
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
           DISPLAY "QUAL O 1ß NUMERO:" FOREGROUND-COLOR 4 AT 0101.
           ACCEPT NUMERO1 AT 0118.
           DISPLAY "QUAL O 2ß NUMERO:" FOREGROUND-COLOR 2 AT 0301.
           ACCEPT NUMERO2 AT 0318.
       CALCULO.
           ADD NUMERO1, NUMERO2 TO SOMA.
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("A SOMA ê  ", SOMA)
           FOREGROUND-COLOR 6 AT 0501.
           ACCEPT OMITTED.
           STOP RUN.
       END PROGRAM EX02.
