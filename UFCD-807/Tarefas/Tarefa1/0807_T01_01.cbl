      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_01.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 A        PIC Z(02).
       77 B        PIC Z(02).
       77 TROCA    PIC Z(02).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 1." AT 0101.
           DISPLAY "DIGITE O VALOR DE A:" AT 0301.
           ACCEPT A AT 0321.
           DISPLAY "DIGITE O VALOR DE B:" AT 0501.
           ACCEPT B AT 0521.
       PROCESSO-TROCA.
           MOVE A TO TROCA.
           MOVE B TO A.
           MOVE TROCA TO B.
      *    COMPUTE TROCA=A.
      *    COMPUTE A=B.
      *    COMPUTE B=TROCA.
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("O NOVO VALOR DE A ê:",A)
           AT 0701.
           DISPLAY FUNCTION CONCATENATE("O NOVO VALOR DE B ê:",B)
           AT 0901.
           ACCEPT OMITTED AT 1001.
           STOP RUN.
       END PROGRAM T01_01.
