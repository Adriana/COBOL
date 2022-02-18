      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T04.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 DATA-SISTEMA.
           05 ANO             PIC 9(04) VALUES 0.
           05 MES             PIC 9(02) VALUES 0.
           05 DIA             PIC 9(02) VALUES 0.
       77 NUMERO-PEDIDO       PIC 9(03) VALUES 1.
       77 NOME-CLIENTE        PIC A(30) VALUES SPACES.
       77 CONTATO-CLIENTE     PIC X(30) VALUES SPACES.
       77 TIPO-PIZA           PIC 9(01) VALUES 0.
           88 VALIDAR-TIPO-PIZA VALUES 1 THRU 3.
       77 NUMERO-INGREDIENTES PIC 9(01) VALUES 0.
           88 VALIDAR-NUMERO-INGREDIENTES VALUES 0 THRU 5.
       77 CODIGO-INGREDIENTE  PIC 9(02) VALUES 0.
           88 VALIDAR-CODIGO-INGREDIENTE VALUES 1 THRU 10.
       77 NUMERO-LINHA        PIC 9(02) VALUES 15.
       77 CONTAGEM            PIC 9(01) VALUES 0.
      * TOTAIS
       77 VALOR-PIZA          PIC 9(02)V99 VALUES 0.
       77 VALOR-INGREDIENTES  PIC 9(02)V99 VALUES 0.
       77 TOTAL               PIC 9(03)V99 VALUES 0.
       77 IVA                 PIC 9(02)V99 VALUES 0.
       77 A-PAGAR             PIC 9(03)V99 VALUES 0.
       77 SAIDA               PIC ZZ9.99.
       77 NOVO-PEDIDO         PIC A(01) VALUES SPACES.

       SCREEN SECTION.
       01 CLS BLANK SCREEN.
       01 LAYOUT.
           05 COL 01 VALUE "PIZARIA RAMALHO, GESTPEDIDOS BETA-1" LINE 1.
           05 COL 01 VALUE "PIZAS E DERIVADOS, LDA."             LINE 2.
           05 COL 01 VALUE "-----------------------------------" LINE 3.
           05 COL 01 VALUE "N. PEDIDO:"                          LINE 5.
           05 COL 40 VALUE "  CLIENTE:"                          LINE 5.
           05 COL 01 VALUE "     DATA:"                          LINE 6.
           05 COL 40 VALUE "  CONTATO:"                          LINE 6.
           05 COL 01 VALUE "[1] PEQUENA [2] MEDIA [3] GRANDE"    LINE 8.
           05 COL 01 VALUE "TIPO DE PIZA PRETENDIDO:"            LINE 9.
           05 COL 01 VALUE "N.INGREDIENTES:"                    LINE 11.
           05 COL 40 VALUE "(1) FIAMBRE (0.5), (2) ATUM (0.7), (3) " &
           "ANCHOVAS (0.4), (4) CAMARAO (0.8), (5) BACON (0.9)" LINE 10.
           05 COL 40 VALUE "(6) BANANA (0.3), (7) ANANAS (0.4) " &
           "(8) AZEITONAS (0.3), (9) COGUMELOS (0.6), (10) MILHO (0.5)"
           LINE 11.
           05 COL 01 VALUE "----------------------------------" LINE 12.
           05 COL 01 VALUE "COD.ING. INGREDIENTE         PRECO" LINE 13.
           05 COL 01 VALUE "----------------------------------" LINE 14.
           05 COL 01 VALUE "----------------------------------" LINE 20.
           05 COL 01 VALUE "CUSTO TOTAL DOS INGREDIENTES:     " LINE 21.
           05 COL 01 VALUE "             CUSTO TIPO PIZA:     " LINE 22.
           05 COL 01 VALUE "                     A PAGAR:     " LINE 23.
           05 COL 01 VALUE "                 I.V.A.(23%):     " LINE 24.
           05 COL 01 VALUE "               TOTAL COM IVA:     " LINE 25.

       PROCEDURE DIVISION.
       INICIO.
           DISPLAY CLS.
           DISPLAY LAYOUT.
           ACCEPT DATA-SISTEMA FROM DATE YYYYMMDD.
           DISPLAY NUMERO-PEDIDO FOREGROUND-COLOR 2 HIGHLIGHT AT 0511.
           DISPLAY FUNCTION CONCATENATE(DIA,"/",MES,"/",ANO)
           FOREGROUND-COLOR 2 HIGHLIGHT AT 0611.
           ACCEPT NOME-CLIENTE FOREGROUND-COLOR 2 HIGHLIGHT AT 0550
           PROMPT.
           ACCEPT CONTATO-CLIENTE FOREGROUND-COLOR 2 HIGHLIGHT AT 0650
           PROMPT.
       LER-TIPO-PIZA.
           ACCEPT TIPO-PIZA FOREGROUND-COLOR 2 HIGHLIGHT AT 0925.
           IF(NOT VALIDAR-TIPO-PIZA) THEN
               DISPLAY "DEVE DIGITAR 1, 2 OU 3 !" FOREGROUND-COLOR 4
               HIGHLIGHT AT 0927
               GO LER-TIPO-PIZA
           ELSE
               DISPLAY " " ERASE EOL AT 0927
               EVALUATE (TIPO-PIZA)
                   WHEN 1
                       DISPLAY "PEQUENA" FOREGROUND-COLOR 3 HIGHLIGHT
                       AT 0927
                       MOVE 3 TO VALOR-PIZA
                   WHEN 2
                       DISPLAY "MEDIA" FOREGROUND-COLOR 3 HIGHLIGHT
                       AT 0927
                       MOVE 4 TO VALOR-PIZA
                   WHEN 3
                       DISPLAY "GRANDE" FOREGROUND-COLOR 3 HIGHLIGHT
                       AT 0927
                       MOVE 5 TO VALOR-PIZA
               END-EVALUATE
           END-IF.
           PERFORM CALCULOS.
       LER-NUMERO-INGREDIENTES.
           ACCEPT NUMERO-INGREDIENTES FOREGROUND-COLOR 2 HIGHLIGHT
           AT 1116.
           IF(NOT VALIDAR-NUMERO-INGREDIENTES) THEN
               DISPLAY "DEVE DIGITAR UM VALOR ENTRE 0 E 5!"
               FOREGROUND-COLOR 4 HIGHLIGHT AT 2701
               GO LER-NUMERO-INGREDIENTES
           ELSE
               DISPLAY " " ERASE EOL AT 2701
           END-IF.
       CICLO-INGREDIENTES.
           ACCEPT CODIGO-INGREDIENTE FOREGROUND-COLOR 2 HIGHLIGHT
           LINE NUMERO-LINHA COL 3
           IF (NOT VALIDAR-CODIGO-INGREDIENTE) THEN
               DISPLAY "VALOR ENTRE 1 E 10!" FOREGROUND-COLOR 4
               HIGHLIGHT AT 2701
               GO CICLO-INGREDIENTES
           ELSE
               DISPLAY " " ERASE EOL AT 2701
               EVALUATE (CODIGO-INGREDIENTE)
                   WHEN 1
                       DISPLAY "FIAMBRE" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.50"    LINE NUMERO-LINHA COL 31
                       ADD 0.5 TO VALOR-INGREDIENTES
                   WHEN 2
                       DISPLAY "ATUM" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.70"    LINE NUMERO-LINHA COL 31
                       ADD 0.7 TO VALOR-INGREDIENTES
                   WHEN 3
                       DISPLAY "ANCHOVAS" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.40"    LINE NUMERO-LINHA COL 31
                       ADD 0.4 TO VALOR-INGREDIENTES
                  WHEN 4
                       DISPLAY "CAMARAO" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.80"    LINE NUMERO-LINHA COL 31
                       ADD 0.8 TO VALOR-INGREDIENTES
                   WHEN 5
                       DISPLAY "BACON" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.90"    LINE NUMERO-LINHA COL 31
                       ADD 0.9 TO VALOR-INGREDIENTES
                   WHEN 6
                       DISPLAY "BANANA" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.30"    LINE NUMERO-LINHA COL 31
                       ADD 0.3 TO VALOR-INGREDIENTES
                   WHEN 7
                       DISPLAY "ANANAS" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.40"    LINE NUMERO-LINHA COL 31
                       ADD 0.4 TO VALOR-INGREDIENTES
                   WHEN 8
                       DISPLAY "AZEITONAS" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.30"    LINE NUMERO-LINHA COL 31
                       ADD 0.3 TO VALOR-INGREDIENTES
                   WHEN 9
                       DISPLAY "COGUMELOS" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.60"    LINE NUMERO-LINHA COL 31
                       ADD 0.6 TO VALOR-INGREDIENTES
                  WHEN 10
                       DISPLAY "COGUMELOS" LINE NUMERO-LINHA COL 10
                       DISPLAY "0.50"    LINE NUMERO-LINHA COL 31
                       ADD 0.5 TO VALOR-INGREDIENTES
               END-EVALUATE
               PERFORM CALCULOS
           END-IF.
           ADD 1 TO NUMERO-LINHA.
           ADD 1 TO CONTAGEM.
           IF (CONTAGEM<NUMERO-INGREDIENTES) THEN
               GO CICLO-INGREDIENTES
           END-IF.

           DISPLAY "NOVO PEDIDO (S/N):" AT 2701.
           ACCEPT NOVO-PEDIDO AT 2719.
           IF (FUNCTION UPPER-CASE(NOVO-PEDIDO)="S") THEN
               ADD 1 TO NUMERO-PEDIDO
               MOVE 0 TO CONTAGEM
               MOVE 0 TO VALOR-INGREDIENTES
               MOVE 15 TO NUMERO-LINHA
               GO INICIO
           END-IF.
           DISPLAY "FIM DO PROGRAMA" AT 2801.
           ACCEPT OMITTED AT 2901.
           STOP RUN.
       CALCULOS.
           MOVE 0 TO TOTAL, IVA, A-PAGAR.

           MOVE VALOR-PIZA TO SAIDA.
           DISPLAY SAIDA AT 2229.

           MOVE VALOR-INGREDIENTES TO SAIDA.
           DISPLAY SAIDA AT 2129.

           ADD VALOR-PIZA,VALOR-INGREDIENTES TO TOTAL
           MOVE TOTAL TO SAIDA.
           DISPLAY SAIDA AT 2329.

           COMPUTE IVA = (TOTAL * 0.23).
           MOVE IVA TO SAIDA.
           DISPLAY SAIDA AT 2429.

           ADD TOTAL,IVA TO A-PAGAR.
           MOVE A-PAGAR TO SAIDA.
           DISPLAY SAIDA AT 2529.
       END PROGRAM T04.
