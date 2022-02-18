      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_06.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP      PIC X(06) VALUES SPACES.
       77 BRANCOS   PIC 9(06) VALUES 0.
       77 NULOS     PIC 9(06) VALUES 0.
       77 VALIDOS   PIC 9(06) VALUES 0.
       77 TOTAL     PIC 9(07) VALUES 0.

       77 PB        PIC ZZ9.99.
       77 PN        PIC ZZ9.99.
       77 PV        PIC ZZ9.99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 6" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "VOTOS EM BRANCO:" AT 0301.
           ACCEPT TEMP AT 0317.
           MOVE FUNCTION NUMVAL(TEMP) TO BRANCOS.

           DISPLAY "    VOTOS NULOS:" AT 0501.
           ACCEPT TEMP AT 0517.
           MOVE FUNCTION NUMVAL(TEMP) TO NULOS.

           DISPLAY "  VOTOS VALIDOS:" AT 0701.
           ACCEPT TEMP AT 0717.
           MOVE FUNCTION NUMVAL(TEMP) TO VALIDOS.
       PROCESSAMENTO.
           COMPUTE TOTAL = (BRANCOS + NULOS + VALIDOS).
           COMPUTE PB = ((BRANCOS / TOTAL) * 100).
           COMPUTE PN = ((NULOS / TOTAL) * 100).
           COMPUTE PV = ((VALIDOS / TOTAL) * 100).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("% DE BRANCOS:",PB) AT 0901.
           DISPLAY FUNCTION CONCATENATE("% DE NULOS:",PN) AT 1101.
           DISPLAY FUNCTION CONCATENATE("% DE VALIDOS:",PV) AT 1301.

           ACCEPT OMITTED AT 1501.
           STOP RUN.
       END PROGRAM T01_06.
