      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
000001 IDENTIFICATION DIVISION.
       PROGRAM-ID. EX01.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 NOME  PIC A(30) VALUES SPACES.
       77 IDADE PIC Z(03) VALUES SPACES.

       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "QUAL ê O SEU NOME?" AT 0302.
           ACCEPT NOME PROMPT AT 0321.

           DISPLAY "QUAL A SUA IDADE?" AT 0502.
           ACCEPT IDADE PROMPT AT 0520.

           DISPLAY FUNCTION CONCATENATE("BOM DIA ",
           FUNCTION TRIM(NOME), " A SUA ",
           "IDADE E:",IDADE) AT 0702.

           ACCEPT OMITTED.
           STOP RUN.
       END PROGRAM EX01.
