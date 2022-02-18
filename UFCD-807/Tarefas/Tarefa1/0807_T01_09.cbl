      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_09.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP                PIC X(03) VALUES SPACES.
       77 VELOCIDADE-MAXIMA   PIC 9(03) VALUES 0.
       77 VELOCIDADE-CONDUTOR PIC 9(03) VALUES 0.
       77 MULTA               PIC Z,ZZ9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 9" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "QUAL A VELOCIDADE MAXIMA:" AT 0301.
           ACCEPT TEMP AT 0326.
           MOVE FUNCTION NUMVAL(TEMP) TO VELOCIDADE-MAXIMA.
           DISPLAY "QUAL A VELOCIDADE DO CONDUTOR:" AT 0501.
           ACCEPT TEMP AT 0532.
           MOVE FUNCTION NUMVAL(TEMP) TO VELOCIDADE-CONDUTOR.
       PROCESSAMENTO.
           IF (VELOCIDADE-CONDUTOR > VELOCIDADE-MAXIMA) THEN
               COMPUTE MULTA = ((VELOCIDADE-CONDUTOR -
               VELOCIDADE-MAXIMA) * 5)
               DISPLAY FUNCTION CONCATENATE("O VALOR DA MULTA ê:",
               MULTA) AT 0701
           ELSE
               COMPUTE MULTA = 0
               DISPLAY "CONDUTOR CIRCULOU DENTRO DOS LIMITES." AT 0701
           END-IF.
       SAIDA.
           ACCEPT OMITTED AT 0901.
           STOP RUN.
       END PROGRAM T01_09.
