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
       77 CLIENTE               PIC A(20) VALUES SPACES.
       77 CONTATO               PIC 9(09) VALUES 0.
       77 TIPO-PIZZA            PIC 9(01) VALUES 0.
           88 VALIDAR-TIPO-PIZZA  VALUES 1 THRU 3.
       77 NUM-PEDIDO            PIC 9(02) VALUES 1.
       77 NUM-MENU-PIZZA        PIC 9(02) VALUES 0.
       77 NUM-MENU-INGREDIENTES PIC 9(02) VALUES 0.
       77 LINHA                 PIC 9(02) VALUES 7.
       77 CUSTO-INGREDIENTES    PIC 9(03)V99 VALUES 0.
       77 CUSTO-PIZZA           PIC 9(03)V99 VALUES 0.
       77 VALOR-TOTAL           PIC 9(3)V99.
       77 IVA                   PIC 9(3)V99.
       77 FORMAT-TOTAL          PIC ZZ9.99.
       77 NOVO-PEDIDO           PIC A     VALUES SPACES.
       01 DATA-SISTEMA.
           05 ANO             PIC 9(04) VALUES 0.
           05 MES             PIC 9(02) VALUES 0.
           05 DIA             PIC 9(02) VALUES 0.
       SCREEN SECTION.
       01 CLS BLANK SCREEN.

       01 DADOS.
           05 COL 1 VALUE "PIZZARIA DO RAMALHO - GestPedidosBeta-1.0"
           FOREGROUND-COLOR  2 HIGHLIGHT LINE 1.
           05 COL 1 VALUE "Pizzas e Devivados Lda" FOREGROUND-COLOR 3
           HIGHLIGHT LINE 2.
           05 COL 01 VALUE "------------------------------------"LINE 3.
           05 COL 30 VALUE "------------------------------------"LINE 3.
           05 COL 40 VALUE "------------------------------------"LINE 3.
           05 COL 01 VALUE "N. PEDIDO: "                         LINE 5.
           05 COL 40 VALUE "CLIENTE: "                           LINE 5.
           05 COL 01 VALUE "DATA: "                              LINE 6.
           05 COL 40 VALUE "CONTACTO: "                          LINE 6.

       01 MENU.
           05 COL 1 VALUE "----------------------------------" LINE 7.
           05 COL 1 VALUE "COD.  TIPO DE PIZZA          /PRE€O"LINE 8.
           05 COL 1 VALUE "----------------------------------" LINE 9.
           05 COL 1 VALUE "                                  " LINE 10.
           05 COL 1 VALUE "1 - Pequena                   3.00" LINE 11.
           05 COL 1 VALUE "2 - Media                     4.00" LINE 12.
           05 COL 1 VALUE "3 - Grande                    5.00" LINE 13.

           05 COL 1 VALUE "----------------------------------" LINE 15.
           05 COL 1 VALUE "COD.  INGREDIENTES EXTRAS   /PRE€O" LINE 16.
           05 COL 1 VALUE "----------------------------------" LINE 17.
           05 COL 1 VALUE "1  FIAMBRE                    0,50" LINE 18.
           05 COL 1 VALUE "2  ATUM                       0,70" LINE 19.
           05 COL 1 VALUE "3  ANCHOVAS                   0,40" LINE 20.
           05 COL 1 VALUE "4  CAMARŽO                    0,80" LINE 21.
           05 COL 1 VALUE "5  BACON                      0,90" LINE 22.
           05 COL 1 VALUE "6  BANANA                     0,30" LINE 23.
           05 COL 1 VALUE "7  ANAN†S                     0,40" LINE 24.
           05 COL 1 VALUE "8  AZEITONAS                  0,30" LINE 25.
           05 COL 1 VALUE "9  COGUMELOS                  0,60" LINE 26.
           05 COL 1 VALUE "10 MILHO                      0,50" LINE 27.
           05 COL 1 VALUE "----------------------------------" LINE 28.
           05 COL 1 VALUE "11 TERMINAR PEDIDO                " LINE 29.

       01 PEDIDO.
           05 COL 40 VALUE "============================="LINE 7.
           05 COL 50 VALUE "FA€A SEU PEDIDO!============="LINE 7.

           05 COL 40 VALUE "DIGITE 0 TIPO DE PIZZA:"           LINE 8.
           05 COL 40 VALUE "DIGITE(5) INGREDIENTES DO MENU:"   LINE 9.
           05 COL 40 VALUE "=================================" LINE 10.
           05 COL 40 VALUE "COD.                       PRE€O"  LINE 11.
           05 COL 40 VALUE "=================================" LINE 12.


       PROCEDURE DIVISION.
       INICIO.
           DISPLAY CLS.
           DISPLAY DADOS.
           DISPLAY MENU.
           DISPLAY PEDIDO.
           ACCEPT DATA-SISTEMA FROM DATE YYYYMMDD.
           DISPLAY NUM-PEDIDO FOREGROUND-COLOR 3 HIGHLIGHT AT 0511.
           DISPLAY FUNCTION CONCATENATE(DIA,"/",MES,"/",ANO)
           FOREGROUND-COLOR 3 HIGHLIGHT AT 0611.
           ACCEPT CLIENTE FOREGROUND-COLOR 3 HIGHLIGHT AT 0550
           PROMPT.
           ACCEPT CONTATO FOREGROUND-COLOR 3 HIGHLIGHT AT 0650
           PROMPT.

       ESCOLHER-TIPO-PIZZA.

           MOVE 0 TO CUSTO-PIZZA.
           ACCEPT TIPO-PIZZA FOREGROUND-COLOR 3 HIGHLIGHT AT 0875.
           IF(NOT VALIDAR-TIPO-PIZZA) THEN
               DISPLAY "ESCOLHA SUA PIZZA 1, 2 OU 3!" FOREGROUND-COLOR 4
               HIGHLIGHT AT 0890
               GO ESCOLHER-TIPO-PIZZA
           ELSE
               EVALUATE (TIPO-PIZZA)
                   WHEN 1
                       DISPLAY "1-PEQUENA" FOREGROUND-COLOR 3 HIGHLIGHT
                       AT 0875
                       MOVE 3 TO CUSTO-PIZZA
                   WHEN 2
                       DISPLAY "2-MEDIA" FOREGROUND-COLOR 3 HIGHLIGHT
                       AT 0875
                       MOVE 4 TO CUSTO-PIZZA
                   WHEN 3
                       DISPLAY "3-GRANDE" FOREGROUND-COLOR 3 HIGHLIGHT
                       AT 0875
                       MOVE 5 TO CUSTO-PIZZA
               END-EVALUATE

           END-IF.
           DISPLAY  "TIPO-PIZZA    "                LINE 13 COL 40.
           MOVE CUSTO-PIZZA TO FORMAT-TOTAL
           DISPLAY FORMAT-TOTAL                     LINE 13 COL 64.

       ESCOLHA-ING.
           MOVE 14 TO LINHA.
           MOVE 0 TO CUSTO-INGREDIENTES.
           MOVE 0 TO NUM-MENU-INGREDIENTES.
           PERFORM UNTIL (NUM-MENU-INGREDIENTES = 11)
           ACCEPT NUM-MENU-INGREDIENTES AT 0975 FOREGROUND-COLOR 6
           HIGHLIGHT
               EVALUATE (NUM-MENU-INGREDIENTES)
                   WHEN 1
                       DISPLAY "1-FIAMBRE"          LINE LINHA COL 40
                       DISPLAY "0,50"               LINE LINHA COL 64
                       ADD 0.50 TO CUSTO-INGREDIENTES
                   WHEN 2
                       DISPLAY "2-ATUM"               LINE LINHA COL 40
                       DISPLAY "0,70"               LINE LINHA COL 64
                       ADD 0.70 TO CUSTO-INGREDIENTES
                  WHEN 3
                       DISPLAY "3-ANCHOVAS"           LINE LINHA COL 40
                       DISPLAY "0,40"               LINE LINHA COL 64
                       ADD 0.40 TO CUSTO-INGREDIENTES
                  WHEN 4
                       DISPLAY "4-CAMARŽO"            LINE LINHA COL 40
                       DISPLAY "0,80"               LINE LINHA COL 64
                       ADD 0.80 TO CUSTO-INGREDIENTES
                  WHEN 5
                       DISPLAY "5-BACON"              LINE LINHA COL 40
                       DISPLAY "0,90"               LINE LINHA COL 64
                       ADD 0.90 TO CUSTO-INGREDIENTES
                  WHEN 6
                       DISPLAY "6-BANANA"             LINE LINHA COL 40
                       DISPLAY "0,30"               LINE LINHA COL 64
                       ADD 0.30 TO CUSTO-INGREDIENTES
                  WHEN 7
                       DISPLAY "7-ANAN†S"             LINE LINHA COL 40
                       DISPLAY "0,40"               LINE LINHA COL 64
                       ADD 0.40 TO CUSTO-INGREDIENTES
                  WHEN 8
                       DISPLAY "8-AZEITONAS"          LINE LINHA COL 40
                       DISPLAY "0,30"               LINE LINHA COL 64
                       ADD 0.30 TO CUSTO-INGREDIENTES
                  WHEN 9
                       DISPLAY "9-COGUMELOS"          LINE LINHA COL 40
                       DISPLAY "0,60"               LINE LINHA COL 64
                       ADD 0.60 TO CUSTO-INGREDIENTES
                  WHEN 10
                       DISPLAY "10-MILHO"              LINE LINHA COL 40
                       DISPLAY "0,50"               LINE LINHA COL 64
                       ADD 0.50 TO CUSTO-INGREDIENTES
               END-EVALUATE
               ADD 1 TO LINHA

           END-PERFORM.


           CALCULOS.
           DISPLAY "================================" LINE LINHA COL 40.

           ADD 1 TO  LINHA.
           DISPLAY  "CUSTO-INGREDIENTES =           " LINE LINHA COL 40.
           MOVE CUSTO-INGREDIENTES TO FORMAT-TOTAL.
           DISPLAY FORMAT-TOTAL                      LINE LINHA COL 62.

           ADD 1 TO  LINHA.
           DISPLAY  "CUSTO-PIZZA =         "         LINE LINHA COL 40.
           MOVE CUSTO-PIZZA TO FORMAT-TOTAL.
           DISPLAY FORMAT-TOTAL                      LINE LINHA COL 62.

           ADD 1 TO  LINHA.
           DISPLAY  "IVA(23%) =           "          LINE LINHA COL 40.
           COMPUTE IVA = (CUSTO-PIZZA+CUSTO-INGREDIENTES) *0.23.
           MOVE IVA TO FORMAT-TOTAL
           DISPLAY FORMAT-TOTAL                      LINE LINHA COL 62.

           ADD 1 TO  LINHA.
           DISPLAY  "A PAGAR =           "           LINE LINHA COL 40.
           COMPUTE VALOR-TOTAL =(IVA+ CUSTO-PIZZA + CUSTO-INGREDIENTES).
           MOVE VALOR-TOTAL TO FORMAT-TOTAL
           DISPLAY FORMAT-TOTAL                      LINE LINHA COL 62.

           ADD 2 TO LINHA.
           DISPLAY "NOVO PEDIDO(S/N):" LINE LINHA COL 40.
           ACCEPT NOVO-PEDIDO LINE LINHA COL 70.
           IF (FUNCTION UPPER-CASE(NOVO-PEDIDO)="S") THEN
               GO INICIO
           END-IF.
           STOP RUN.
       END PROGRAM T04.
