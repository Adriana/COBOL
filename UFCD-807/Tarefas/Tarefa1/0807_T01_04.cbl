      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_04.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP            PIC X(04) VALUES SPACES.
       77 ANO-NASCIMENTO  PIC 9(04) VALUES 0.
       77 ANO-ATUAL       PIC 9(04) VALUES 0.
       77 IDADE-ANOS      PIC Z(03).
       77 IDADE-MESES     PIC Z(04).
       77 IDADE-DIAS      PIC Z(05).
       77 IDADE-SEMANAS   PIC Z(05).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 4" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "QUAL O ANO DE NASCIMENTO:" AT 0301.
           ACCEPT TEMP AT 0326.
           MOVE FUNCTION NUMVAL(TEMP) TO ANO-NASCIMENTO.
           DISPLAY "        QUAL O ANO ATUAL:" AT 0501.
           ACCEPT TEMP AT 0526.
           MOVE FUNCTION NUMVAL(TEMP) TO ANO-ATUAL.
       PROCESSAMENTO.
           COMPUTE IDADE-ANOS  = (ANO-ATUAL - ANO-NASCIMENTO).
           COMPUTE IDADE-MESES =((ANO-ATUAL - ANO-NASCIMENTO) * 12).
           COMPUTE IDADE-DIAS  =((ANO-ATUAL - ANO-NASCIMENTO) * 365).
           COMPUTE IDADE-SEMANAS =((ANO-ATUAL - ANO-NASCIMENTO) * 52).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("A IDADE EM ANOS ê:",IDADE-ANOS)
           AT 0701.
           DISPLAY FUNCTION CONCATENATE("A IDADE EM MESES ê:",
           IDADE-MESES) AT 0901.
           DISPLAY FUNCTION CONCATENATE("A IDADE EM DIAS ê:",
           IDADE-DIAS) AT 1101.
           DISPLAY FUNCTION CONCATENATE("A IDADE EM SEMANAS ê:",
           IDADE-SEMANAS) AT 1301.

           ACCEPT OMITTED AT 1501.
           STOP RUN.
       END PROGRAM T01_04.
