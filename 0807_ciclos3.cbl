      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CICLOS3.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 TEMP       PIC X(02) VALUES SPACES.
       77 NUMERO     PIC 9(02) VALUES 0.
       77 SOMA       PIC 9(03) VALUES 0.
       77 SAIDA-SOMA PIC ZZ9.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 5 TIMES
               DISPLAY "INSIRA UM NUMERO:" AT 0301
               ACCEPT TEMP AT 0318
               MOVE FUNCTION NUMVAL(TEMP) TO NUMERO
               ADD NUMERO TO SOMA
           END-PERFORM.
           MOVE SOMA TO SAIDA-SOMA.
           DISPLAY FUNCTION CONCATENATE("A SOMA E:",SAIDA-SOMA) AT 0501.
           ACCEPT OMITTED AT 0601.
           STOP RUN.
       END PROGRAM CICLOS3.
