      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T01_02.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77 MINUTOS-DIARIOS  PIC 9(03) VALUES 0.
       77 HORAS-APOS90DIAS PIC Z(03).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "TAREFA 1, EXERCICIO 2" FOREGROUND-COLOR 2 AT 0101.
           DISPLAY "QUANTOS MINUTOS ESTUDA POR DIA?" AT 0301.
           ACCEPT MINUTOS-DIARIOS AT 0333.
       PROCESSAMENTO.
           COMPUTE HORAS-APOS90DIAS = ((MINUTOS-DIARIOS / 60) * 90).
       SAIDA.
           DISPLAY FUNCTION CONCATENATE("AO FIM DE 90 DIAS ESTUDA ",
           HORAS-APOS90DIAS," HORAS.") AT 0501.
           ACCEPT OMITTED AT 0601.
           STOP RUN.
       END PROGRAM T01_02.
