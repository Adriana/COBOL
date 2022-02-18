      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CICLOS4.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 TEMP       PIC X(02) VALUES SPACES.
       77 NUMERO     PIC 9(02) VALUES 0.
       77 SOMA       PIC 9(03) VALUES 0.
       77 SAIDA-SOMA PIC ZZ9.
       PROCEDURE DIVISION.
       INICIO.
           DISPLAY "DIGITE UM NUMERO ENTRE 1 E 99 OU 0 PARA TERMINAR:"
           AT 0101.
           ACCEPT TEMP AT 0150.
           MOVE FUNCTION NUMVAL(TEMP) TO NUMERO.
           ADD NUMERO TO SOMA.
       CICLO.
           PERFORM INICIO UNTIL (NUMERO = 0).
       ESCRITA.
           MOVE SOMA TO SAIDA-SOMA.
           DISPLAY FUNCTION CONCATENATE("A SOMA E:",SAIDA-SOMA) AT 0301.
           ACCEPT OMITTED AT 0501.
           STOP RUN.
       END PROGRAM CICLOS4.
