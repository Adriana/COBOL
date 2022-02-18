      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_07.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP      PIC X(03) VALUES SPACES.
       77 NUMERO    PIC S9(02) VALUES 0.
       77 SEGUINTE  PIC -Z9.
       77 ANTERIOR  PIC -Z9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 7" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "DIGITE UM NUMERO:" AT 0301.
           ACCEPT TEMP AT 0318.
           MOVE FUNCTION NUMVAL(TEMP) TO NUMERO.
       PROCESSAMENTO.
           ADD 1 TO NUMERO GIVING SEGUINTE.
           SUBTRACT 1 FROM NUMERO GIVING ANTERIOR.
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("O ANTERIOR ê:",ANTERIOR,
           " E O SEGUINTE ê:",SEGUINTE) FOREGROUND-COLOR 2 HIGHLIGHT
           AT 0501.

           ACCEPT OMITTED AT 0701.
           STOP RUN.
       END PROGRAM T01_07.
