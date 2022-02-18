      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_11.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP                PIC X(06) VALUES SPACES.
       77 TARIFA-AGUA         PIC 9(04)V99 VALUES 0.
       77 TOTAL               PIC Z,ZZ9.99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 11" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "TARIFA DA AGUA:" AT 0301.
           ACCEPT TEMP AT 0316.
           MOVE FUNCTION NUMVAL(TEMP) TO TARIFA-AGUA.
       PROCESSAMENTO.
      *     COMPUTE TOTAL = (TARIFA-AGUA * 1.8).
           COMPUTE TOTAL = ((TARIFA-AGUA * 0.8) + TARIFA-AGUA).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("TOTAL A PAGAR ê:", TOTAL)
           AT 0501
           ACCEPT OMITTED AT 0701.
           STOP RUN.
       END PROGRAM T01_11.
