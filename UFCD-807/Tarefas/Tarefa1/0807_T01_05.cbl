      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_05.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP      PIC X(06) VALUES SPACES.
       77 FAR       PIC S999V99 VALUES 0.
       77 CEL       PIC -ZZ9.99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 5" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "GRAUS FAHRENHEIT:" AT 0301.
           ACCEPT TEMP AT 0318.
           MOVE FUNCTION NUMVAL(TEMP) TO FAR.
       PROCESSAMENTO.
           COMPUTE CEL = (5 * (FAR - 32) / 9).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("GRAUS EM CELSIUS:",CEL)
           AT 0501.

           ACCEPT OMITTED AT 0701.
           STOP RUN.
       END PROGRAM T01_05.
