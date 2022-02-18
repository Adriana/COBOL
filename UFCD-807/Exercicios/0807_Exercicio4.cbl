      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX04.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       01 DATA-SISTEMA.
           05 ANO     PIC 9(04) VALUES 0.
           05 MES     PIC 9(02) VALUES 0.
           05 DIA     PIC 9(02) VALUES 0.
       01 HORA-SISTEMA.
           05 HORA    PIC 9(02) VALUES 0.
           05 MINUTO  PIC 9(02) VALUES 0.
           05 SEGUNDO PIC 9(02) VALUES 0.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           ACCEPT DATA-SISTEMA FROM DATE YYYYMMDD.
           DISPLAY FUNCTION CONCATENATE("A DATA ATUAL : ",ANO,"/",
           MES,"/",DIA) AT 0301.

           ACCEPT HORA-SISTEMA FROM TIME.
           DISPLAY FUNCTION CONCATENATE("A HORA ATUAL : ",HORA,":",
           MINUTO,":",SEGUNDO) AT 0501.

           IF (HORA >= 8 AND HORA < 12) THEN
               DISPLAY "BOM DIA" AT 0701
           ELSE
               IF (HORA >= 12 AND HORA < 20) THEN
                   DISPLAY "BOA TARDE" AT 0701
               ELSE
                   DISPLAY "BOA NOITE" AT 0701
               END-IF
           END-IF.

           ACCEPT OMITTED AT 0901.
           STOP RUN.
       END PROGRAM EX04.
