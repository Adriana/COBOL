      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CICLOS5.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 RESPOSTA     PIC A VALUES "S".
       77 LINHA        PIC 9(02) VALUES 1.
       SCREEN SECTION.
       01 CLS BLANK SCREEN.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM UNTIL (RESPOSTA <> "S" AND RESPOSTA <> "s")
               DISPLAY CLS
               MOVE 1 TO LINHA
               PERFORM 10 TIMES
                   DISPLAY "BOM DIA" LINE LINHA COL 1
                   ADD 1 TO LINHA
               END-PERFORM
               DISPLAY "DIGITE S PARA CONTINUAR, OUTRA TECLA PARA SAIR:"
               AT 1501
               ACCEPT RESPOSTA AT 1550
           END-PERFORM.
           STOP RUN.
       END PROGRAM CICLOS5.
