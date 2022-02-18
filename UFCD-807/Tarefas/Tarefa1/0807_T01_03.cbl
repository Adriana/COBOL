      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_03.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP     PIC X(02) VALUES SPACES.
       77 NUMERO   PIC 9(02) VALUES 0.
       77 QUADRADO PIC Z(03).
       77 CUBO     PIC Z(04).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 3" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "DIGITE UM NUMERO:" AT 0301.
           ACCEPT TEMP FOREGROUND-COLOR 6 AT 0318.
           MOVE FUNCTION NUMVAL(TEMP) TO NUMERO.
       PROCESSAMENTO.
           COMPUTE QUADRADO = (NUMERO ** 2) .
           COMPUTE CUBO = (NUMERO ** 3) .
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("O QUADRADO DE ",NUMERO,
           " ê:",QUADRADO) AT 0501.
           DISPLAY FUNCTION CONCATENATE("O CUBO DE ",NUMERO,
           " ê:",CUBO) AT 0701.

           ACCEPT OMITTED AT 0901.
           STOP RUN.
       END PROGRAM T01_03.
