      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_13.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP                PIC X(03) VALUES SPACES.
       77 COMPRIMENTO         PIC 9(03) VALUES 0.
       77 LARGURA             PIC 9(03) VALUES 0.
       77 ALTURA              PIC 9(03) VALUES 0.
       77 VOLUME              PIC Z,ZZZ,ZZ9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 13" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "COMPRIMENTO:" AT 0301.
           ACCEPT TEMP AT 0313.
           MOVE FUNCTION NUMVAL(TEMP) TO COMPRIMENTO.

           DISPLAY "    LARGURA:" AT 0501.
           ACCEPT TEMP AT 0513.
           MOVE FUNCTION NUMVAL(TEMP) TO LARGURA.

           DISPLAY "     ALTURA:" AT 0701.
           ACCEPT TEMP AT 0713.
           MOVE FUNCTION NUMVAL(TEMP) TO ALTURA.
       PROCESSAMENTO.
           COMPUTE VOLUME = (COMPRIMENTO * ALTURA * LARGURA).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("O VOLUME ê DE ", VOLUME,
           " M3") FOREGROUND-COLOR 2 HIGHLIGHT AT 0901.

           ACCEPT OMITTED AT 1101.
           STOP RUN.
       END PROGRAM T01_13.
