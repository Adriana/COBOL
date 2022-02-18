      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_08.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 TEMP      PIC X(03) VALUES SPACES.
       77 N1        PIC 9(03) VALUES 0.
       77 N2        PIC 9(03) VALUES 0.
       77 SOMA      PIC Z,ZZ9.
       77 SUBTRACAO PIC ZZ9-.
       77 PRODUTO   PIC ZZZ,ZZ9.
       77 QUOCIENTE PIC Z,ZZ9.
       77 RESTO PIC Z,ZZ9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 8" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "DIGITE O 1� NUMERO:" AT 0301.
           ACCEPT TEMP AT 0322.
           MOVE FUNCTION NUMVAL(TEMP) TO N1.
           DISPLAY "DIGITE O 2� NUMERO:" AT 0501.
           ACCEPT TEMP AT 0522.
           MOVE FUNCTION NUMVAL(TEMP) TO N2.
       PROCESSAMENTO.
           ADD N1, N2 GIVING SOMA.
           SUBTRACT N2 FROM N1 GIVING SUBTRACAO.
           MULTIPLY N1 BY N2 GIVING PRODUTO.
           DIVIDE N1 BY N2 GIVING QUOCIENTE REMAINDER RESTO.
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("SOMA:",N1," + ",N2," = ",
           SOMA) FOREGROUND-COLOR 2 HIGHLIGHT AT 0701.
           DISPLAY FUNCTION CONCATENATE("SUBTRA��O:",N1," - ",N2," = ",
           SUBTRACAO) FOREGROUND-COLOR 2 HIGHLIGHT AT 0901.
           DISPLAY FUNCTION CONCATENATE("PRODUTO:",N1," X ",N2," = ",
           PRODUTO) FOREGROUND-COLOR 2 HIGHLIGHT AT 1101.
           DISPLAY FUNCTION CONCATENATE("DIVIDENDO:",N1)
           FOREGROUND-COLOR 2 HIGHLIGHT AT 1301.
           DISPLAY FUNCTION CONCATENATE("DIVISOR:",N2)
           FOREGROUND-COLOR 2 HIGHLIGHT AT 1501.
           DISPLAY FUNCTION CONCATENATE("QUOCIENTE:",QUOCIENTE)
           FOREGROUND-COLOR 2 HIGHLIGHT AT 1701.
           DISPLAY FUNCTION CONCATENATE("RESTO:",RESTO)
           FOREGROUND-COLOR 2 HIGHLIGHT AT 1901.
           ACCEPT OMITTED AT 2101.
           STOP RUN.
       END PROGRAM T01_08.