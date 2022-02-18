      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX1.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77  NOME           PIC X(30)      VALUE SPACES.
       77  ANOENTRADA     PIC 9(04)      VALUE ZEROS.
       77  SALARIO        PIC 9(06)V99   VALUE ZEROS.
       77  VENDAS         PIC 9(06)V99   VALUE ZEROS.
       77  COMISSAO       PIC 9(03)V99   VALUE ZEROS.
       77  IRS            PIC 9(4)V99    VALUES 0.
       77  SS             PIC 9(4)V99    VALUES 0.
       77  TEMPOCASA      PIC 9(02)      VALUE ZEROS.
       01  DATASISTEMA.
           05 ANO PIC 9(04).
           05 MES PIC 9(02).
           05 DIA PIC 9(02).


       PROCEDURE DIVISION.
           DISPLAY 'DATA:'                                LINE 5 COL 30.
           ACCEPT DATASISTEMA FROM DATE YYYYMMDD.
           DISPLAY FUNCTION CONCATENATE(DIA,"/",MES,"/",ANO)AT 0550.
           DISPLAY 'NOME DO FUNCIONARIO: '                LINE 6 COL 30.
           ACCEPT NOME AT 0650.
           DISPLAY 'ANO DE ENTRADA NA EMPRESA: '          LINE 7 COL 30.
           ACCEPT ANOENTRADA AT 0760.
           COMPUTE TEMPOCASA = ANO - ANOENTRADA.

       SALARIO-BASE.
           ACCEPT SALARIO AT 0850.
           EVALUATE TEMPOCASA
               WHEN 0 THRU 5
                  COMPUTE SALARIO = 800

               WHEN 6 THRU 10
                   COMPUTE SALARIO = 1000
               WHEN OTHER
                   COMPUTE SALARIO = 1200
           END-EVALUATE.
               DISPLAY 'SALARIO BASE :  ' SALARIO.
               STOP RUN.
