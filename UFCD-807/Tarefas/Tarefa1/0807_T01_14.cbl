      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_14.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP                PIC X(04) VALUES SPACES.
       77 MESADA              PIC 9(04) VALUES 0.
       77 SAUDE               PIC Z,ZZ9.99.
       77 EDUCACAO            PIC Z,ZZ9.99.
       77 ALIMENTACAO         PIC Z,ZZ9.99.
       77 VESTUARIO           PIC Z,ZZ9.99.
       77 LAZER               PIC Z,ZZ9.99.
       77 OUTROS              PIC Z,ZZ9.99.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 14" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "MESADA:" AT 0301.
           ACCEPT TEMP AT 0308.
           MOVE FUNCTION NUMVAL(TEMP) TO MESADA.
       PROCESSAMENTO.
           COMPUTE SAUDE = (MESADA * 0.10).
           COMPUTE EDUCACAO = (MESADA * 0.25).
           COMPUTE ALIMENTACAO = (MESADA * 0.30).
           COMPUTE VESTUARIO = (MESADA * 0.10).
           COMPUTE LAZER = (MESADA * 0.05).
           COMPUTE OUTROS = (MESADA * 0.20).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("SAUDE ->",SAUDE) AT 0501.
           DISPLAY FUNCTION CONCATENATE("EDUCACAO ->",EDUCACAO) AT 0701.
           DISPLAY FUNCTION CONCATENATE("ALIMENTACAO ->",
           ALIMENTACAO) AT 0901.
           DISPLAY FUNCTION CONCATENATE("VESTUARIO ->",
           VESTUARIO) AT 1101.
           DISPLAY FUNCTION CONCATENATE("LAZER ->",LAZER) AT 1301.
           DISPLAY FUNCTION CONCATENATE("OUTROS ->",OUTROS) AT 1501.
           ACCEPT OMITTED AT 1701.
           STOP RUN.
       END PROGRAM T01_14.
