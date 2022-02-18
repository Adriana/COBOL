      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX06.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 NUMERO-MENU    PIC 9(01)    VALUES 0.
       77 LINHA          PIC 9(02)    VALUES 7.
       77 TOTAL          PIC 9(03)V99 VALUES 0.
       77 SAIDA-TOTAL    PIC ZZ9.99.
       77 NOVO-PEDIDO    PIC A VALUES SPACES.
       SCREEN SECTION.
       01 CLS BLANK SCREEN.
      * ISTO E UM COMENTARIO
      * OUTRO COMENTARIO
       01 MENU.
           05 COL 1 VALUE "DATE:   "   FOREGROUND-COLOR 3 HIGHLIGHT
           LINE 1.
           05 COL 1 VALUE "BAR DOS BIFES" FOREGROUND-COLOR 3
           HIGHLIGHT LINE 02.
           05 COL 1 VALUE "N. MENU                 PREÄO" LINE 03.
           05 COL 1 VALUE "-----------------------------" LINE 04.
           05 COL 1 VALUE "1  HAMBURGUER PEQUENO    5,15" LINE 05.
           05 COL 1 VALUE "2  HAMBURGUER MêDIO      6,05" LINE 06.
           05 COL 1 VALUE "3  HAMBURGUER GRANDE     7,10" LINE 07.
           05 COL 1 VALUE "4  HAMBURGUER EXTRA      8,20" LINE 08.
           05 COL 1 VALUE "5  BATATA                4,50" LINE 09.
           05 COL 1 VALUE "6  SALADA                5,00" LINE 10.
      * COMENTARIO
           05 COL 1 VALUE "7  TERMINAR                  " LINE 11.

           05 COL 40 VALUE "DIGITE N. DO MENU:"           LINE 03.
           05 COL 40 VALUE "MENU                   PREÄO" LINE 05.
           05 COL 40 VALUE "============================" LINE 06.

       PROCEDURE DIVISION.
       INICIO.
           DISPLAY CLS.
           DISPLAY MENU.
           MOVE 7 TO LINHA.
           MOVE 0 TO TOTAL.
           MOVE 0 TO NUMERO-MENU.
           PERFORM UNTIL (NUMERO-MENU = 7)
               ACCEPT NUMERO-MENU AT 0358 FOREGROUND-COLOR 6 HIGHLIGHT
               EVALUATE (NUMERO-MENU)
                   WHEN 1
                       DISPLAY "HAMBURGUER PEQUENO" LINE LINHA COL 40
                       DISPLAY "5,15"               LINE LINHA COL 64
                       ADD 5.15 TO TOTAL
                   WHEN 2
                       DISPLAY "HAMBURGUER MêDIO"   LINE LINHA COL 40
                       DISPLAY "6,05"               LINE LINHA COL 64
                       ADD 6.05 TO TOTAL
                  WHEN 3
                       DISPLAY "HAMBURGUER GRANDE"  LINE LINHA COL 40
                       DISPLAY "7,10"               LINE LINHA COL 64
                       ADD 7.10 TO TOTAL
                  WHEN 4
                       DISPLAY "HAMBURGUER EXTRA"   LINE LINHA COL 40
                       DISPLAY "8,20"               LINE LINHA COL 64
                       ADD 8.2 TO TOTAL
                  WHEN 5
                       DISPLAY "BATATA"             LINE LINHA COL 40
                       DISPLAY "4,50"               LINE LINHA COL 64
                       ADD 4.5 TO TOTAL
                  WHEN 6
                       DISPLAY "SALADA           "  LINE LINHA COL 40
                       DISPLAY "5,00"               LINE LINHA COL 64
                       ADD 5 TO TOTAL
               END-EVALUATE
               ADD 1 TO LINHA
           END-PERFORM.
           DISPLAY  "============================" LINE LINHA COL 40.
           ADD 1 TO  LINHA.
           MOVE TOTAL TO SAIDA-TOTAL.
           DISPLAY SAIDA-TOTAL LINE LINHA COL 62.
           ADD 2 TO LINHA
           DISPLAY "NOVO PEDIDO(S/N):" LINE LINHA COL 40.
           ACCEPT NOVO-PEDIDO LINE LINHA COL 58.
           IF (FUNCTION UPPER-CASE(NOVO-PEDIDO)="S") THEN
               GO INICIO
           END-IF.
           ADD 2 TO LINHA
           DISPLAY "OBRIGADO. VOLTE SEMPRE !" LINE LINHA COL 40.
           STOP RUN.
       END PROGRAM EX06.
