      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_12.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP                PIC X(03) VALUES SPACES.
       77 IDADE-PAI           PIC 9(03) VALUES 0.
       77 IDADE-FILHO         PIC 9(03) VALUES 0.
       77 DIF-IDADES          PIC ZZ9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 12" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "IDADE DO PAI:" AT 0301.
           ACCEPT TEMP AT 0314.
           MOVE FUNCTION NUMVAL(TEMP) TO IDADE-PAI.
           DISPLAY "IDADE DO FILHO:" AT 0501.
           ACCEPT TEMP AT 0516.
           MOVE FUNCTION NUMVAL(TEMP) TO IDADE-FILHO.
       PROCESSAMENTO.
           IF (IDADE-PAI < IDADE-FILHO) THEN
               DISPLAY "A IDADE DO PAI NŽO PODE SER INFERIOR A DO " &
               "FILHO" FOREGROUND-COLOR 4 HIGHLIGHT AT 0701
           ELSE
               COMPUTE DIF-IDADES = (IDADE-PAI - IDADE-FILHO)
               DISPLAY FUNCTION CONCATENATE("A DIFERENCA DE IDADES :",
               DIF-IDADES," ANOS.") FOREGROUND-COLOR 2 HIGHLIGHT
               AT 0701
           END-IF.
       SAIDA.
           ACCEPT OMITTED AT 0901.
           STOP RUN.
       END PROGRAM T01_12.
