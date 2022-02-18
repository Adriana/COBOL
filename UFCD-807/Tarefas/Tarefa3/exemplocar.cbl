      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
              IDENTIFICATION DIVISION.
       PROGRAM-ID. ABC-RENT-A-CAR.
       AUTHOR. MARVINJASON.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FULL-NAME.
           02 LAST-NAME        PIC A(10).
           02 FIRST-NAME        PIC A(15).
           02 MIDDLE-NAME        PIC A(10).
       01 FULL-ADDRESS        PIC X(35).
       01 CAR.
           02 CAR-A            PIC A(7)    VALUE "MONTERO".
           02 CAR-B            PIC A(3)    VALUE "BMW".
           02 CAR-C            PIC A(7)    VALUE "FERRARI".
           02 CAR-OPTION-NUM    PIC 9(1).
           02 CAR-OPTION-STR.
               03 CAR-FILLER-1    PIC X(1).
               03 CAR-BRAND    PIC A(7).
               03 CAR-FILLER-2    PIC X(1).
       01 SYSTEM-DATE.
           02 SYSTEM-YY        PIC 9(2).
           02 SYSTEM-MM        PIC 9(2).
           02 SYSTEM-DD        PIC 9(2).
       01 FORMATTED-DATE.
           02 FORMATTED-YY        PIC 9(2).
           02 FILLER            PIC X(1)    VALUE '/'.
           02 FORMATTED-MM        PIC 9(2).
           02 FILLER            PIC X(1)    VALUE '/'.
           02 FORMATTED-DD        PIC 9(2).
       01 VARIABLES.
           02 PRICE            PIC 9(5).
           02 NUMBER-OF-DAYS    PIC 9(1).
           02 MILEAGE            PIC 9(3).
           02 DISCOUNT-RATE    PIC 9V99.
           02 ADDITIONAL-PAYMENT    PIC 9(6)V99.
           02 TOTAL-PAYMENT    PIC 9(6)V99.
           02 TOTAL-PAYMENT-F    PIC Z(3),Z(3).99.

       SCREEN SECTION.
       01 MAIN-SCREEN BLANK SCREEN AUTO REQUIRED
           FOREGROUND-COLOR IS 1 BACKGROUND-COLOR IS 7.
           02 LINE 02 COLUMN 33 VALUE "ABC RENT A CAR".
           02 LINE 04 COLUMN 02 VALUE "DATE:".
           02 LINE 04 COLUMN 08 PIC X(8) FROM FORMATTED-DATE.
           02 LINE 06 COLUMN 02 VALUE "LAST NAME:".
           02 LINE 06 COLUMN 14 PIC A(10) USING LAST-NAME.
           02 LINE 06 COLUMN 26 VALUE "FIRST NAME:".
           02 LINE 06 COLUMN 39 PIC A(15) USING FIRST-NAME.
           02 LINE 06 COLUMN 56 VALUE "MIDDLE NAME:".
           02 LINE 06 COLUMN 70 PIC A(10) USING MIDDLE-NAME.
           02 LINE 08 COLUMN 02 VALUE "ADDRESS:".
           02 LINE 08 COLUMN 12 PIC X(35) USING FULL-ADDRESS.
           02 LINE 10 COLUMN 02 VALUE "CAR:".
           02 LINE 10 COLUMN 07 PIC 9(1) USING CAR-
      -OPTION-NUM BLANK WHEN ZERO.
          02 LINE 10 COLUMN 09 PIC X(9) FROM CAR-
      -OPTION-STR.
           02 LINE 12 COLUMN 02 VALUE "NUMBER OF DAYS:".
           02 LINE 12 COLUMN 18 PIC 9(1) USING NUMBER
      --OF-DAYS BLANK WHEN ZERO.
           02 LINE 14 COLUMN 02 VALUE "MILEAGE:".
           02 LINE 14 COLUMN 11 PIC 9(3) USING MILEAGE BLANK WHEN ZERO.

       PROCEDURE DIVISION.

       MAIN-PROGRAM.
           PERFORM GET-DATE-PARA.
           DISPLAY MAIN-SCREEN.
           ACCEPT MAIN-SCREEN.
           PERFORM CAR-PARA.
           PERFORM NUMBER-OF-DAYS-PARA.
           PERFORM COMPUTE-PARA.
           STOP RUN.

       GET-DATE-PARA.
           ACCEPT SYSTEM-DATE FROM DATE.
           MOVE SYSTEM-YY TO FORMATTED-YY.
           MOVE SYSTEM-MM TO FORMATTED-MM.
           MOVE SYSTEM-DD TO FORMATTED-DD.

       CAR-PARA.
           EVALUATE CAR-OPTION-NUM
               WHEN >20000
                   MOVE 1000 TO PRICE
                   MOVE CAR-A TO CAR-BRAND
               WHEN 2
                   MOVE 5000 TO PRICE
                   MOVE CAR-B TO CAR-BRAND
               WHEN 3
                   MOVE 10000 TO PRICE
                   MOVE CAR-C TO CAR-BRAND
               WHEN OTHER
                   GO TO ERROR-PARA
           END-EVALUATE.
           MOVE "(" TO CAR-FILLER-1.
           MOVE ")" TO CAR-FILLER-2.
           DISPLAY MAIN-SCREEN.

       NUMBER-OF-DAYS-PARA.
           IF NUMBER-OF-DAYS < 1 OR NUMBER-OF-DAYS > 7
               GO TO ERROR-PARA
           ELSE
               IF NUMBER-OF-DAYS < 3
                   MOVE 0 TO DISCOUNT-RATE
               ELSE IF NUMBER-OF-DAYS < 6
                   MOVE .1 TO DISCOUNT-RATE
               ELSE
                   MOVE .2 TO DISCOUNT-RATE
               END-IF
           END-IF.

       COMPUTE-PARA.
           IF MILEAGE < 101
               MOVE 0 TO ADDITIONAL-PAYMENT
           ELSE IF MILEAGE < 301
               COMPUTE ADDITIONAL-PAYMENT = (MILEAGE - 100)
      -            * PRICE * 0.1
           ELSE IF MILEAGE < 501
               COMPUTE ADDITIONAL-PAYMENT = (MILEAGE - 100) * PRICE * 0.2
           ELSE IF MILEAGE > 500
               GO TO ERROR-PARA
           END-IF.
           COMPUTE TOTAL-PAYMENT = PRICE * NUMBER-OF-DAYS.
           COMPUTE TOTAL-PAYMENT = TOTAL-PAYMENT - (TOTAL-PAYMENT *
      -        DISCOUNT-RATE) + ADDITIONAL-PAYMENT.
          MOVE TOTAL-PAYMENT TO TOTAL-PAYMENT-F.
          DISPLAY "PAYMENT: P" LINE 18 COLUMN 02.
          DISPLAY TOTAL-PAYMENT-F.

       ERROR-PARA.
           DISPLAY "INVALID INPUT!" LINE 18 COLUMN 02.
           GO TO MAIN-PROGRAM.
