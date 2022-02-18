      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC-SALARIO.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  NOME           PIC X(30)      VALUE SPACES.
       77  ANOENTRADA     PIC 9(04)      VALUE ZEROS.
       77  SALARIO        PIC 9(06)V99   VALUE ZEROS.
       77  SALARIO-BASE   PIC 9(06)V99   VALUE ZEROS.
       77  COMISSAO       PIC 9(06)V99   VALUE ZEROS.
       77  VENDAS         PIC 9(06)V99   VALUE ZEROS.
       77  AUMENTO        PIC 9(03)V99   VALUE ZEROS.
       77  TEMPOCASA      PIC 9(02)      VALUE ZEROS.
       77  DECIMOSEGUNDOSALARIO PIC 9(03)V99   VALUE ZEROS.
       77  MES-VIGENTE    PIC 9(01) VALUES 0.

       01 WRK-DATASISTEMA.
           02 ANO PIC 9(04).
           02 MES PIC 9(02).
           02 DIA PIC 9(02).

       PROCEDURE DIVISION.
           DISPLAY 'DATA: '.
           ACCEPT WRK-DATASISTEMA FROM DATE YYYYMMDD.
           DISPLAY FUNCTION CONCATENATE(DIA,"/",MES,"/",ANO)
           DISPLAY 'MES: '.
           ACCEPT MES-VIGENTE.
           DISPLAY 'NOME DO FUNCIONARIO: '.
           ACCEPT NOME.
           DISPLAY 'ANO DE ENTRADA NA EMPRESA: '.
           ACCEPT ANOENTRADA.

       ESCOLHA-MES.

          EVALUATE MES-VIGENTE
               WHEN 1
                   DISPLAY "1-JANEIRO" AT 0550
                   MOVE 0 TO DECIMOSEGUNDOSALARIO

               WHEN 2
                   DISPLAY "1-JANEIRO" AT 0550
                   MOVE 0 TO DECIMOSEGUNDOSALARIO
               WHEN 3
                   DISPLAY "1-JANEIRO" AT 0550
                   MOVE 0 TO DECIMOSEGUNDOSALARIO
               WHEN 4
                  DISPLAY "1-JANEIRO" AT 0550
                   MOVE 0 TO DECIMOSEGUNDOSALARIO

               WHEN OTHER
                   GO TO
           END-EVALUATE.

       LER-SALARIO-BASE.
           COMPUTE TEMPOCASA = ANO - ANOENTRADA.
           DISPLAY 'TEMPO DE CASA: ' TEMPOCASA ' ANO(S)'.
           EVALUATE TEMPOCASA
               WHEN 0 THRU 5
                   COMPUTE SALARIO= 800

               WHEN 6 THRU 10
                   COMPUTE SALARIO = 1000

               WHEN OTHER
                   COMPUTE SALARIO = 1200
           END-EVALUATE.
               DISPLAY 'SALARIO-BASE:  ' SALARIO.

       LER-COMISSAO.
           DISPLAY 'VOLUME DE VENDAS:'
           ACCEPT VENDAS.
               IF VENDAS < 10000
               COMPUTE COMISSAO = VENDAS * 0.05
               ELSE IF VENDAS < 200000 OR VENDAS >10000
               COMPUTE COMISSAO = VENDAS * 0.10
               ELSE IF VENDAS >200000
               COMPUTE COMISSAO = VENDAS * 0.15
                END-IF
                DISPLAY 'VALOR COMISAO: ' COMISSAO.
           STOP RUN.
