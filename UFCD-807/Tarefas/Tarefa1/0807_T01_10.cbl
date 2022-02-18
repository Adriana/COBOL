      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_10.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP                PIC X(02) VALUES SPACES.
       77 HORA                PIC 9(02) VALUES 0.
       77 MINUTO              PIC 9(02) VALUES 0.
       77 MINUTOS             PIC Z,ZZ9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 10" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "QUAL A HORA ATUAL:" AT 0301.
           ACCEPT TEMP AT 0319.
           MOVE FUNCTION NUMVAL(TEMP) TO HORA.
           DISPLAY "QUAL O MINUTO ATUAL:" AT 0501.
           ACCEPT TEMP AT 0521.
           MOVE FUNCTION NUMVAL(TEMP) TO MINUTO.
       PROCESSAMENTO.
           COMPUTE MINUTOS = ((HORA * 60) + MINUTO).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("AGORA SŽO ",HORA,":",
           MINUTO," H.") AT 0701.
           DISPLAY FUNCTION CONCATENATE("JA SE PASSARAM ",MINUTOS,
           " MINUTOS DESDE O INICIO DO DIA.") AT 0901.
           ACCEPT OMITTED AT 1101.
           STOP RUN.
       END PROGRAM T01_10.
