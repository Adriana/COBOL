      ******************************************************************
      * SOMAR 2 NUMEROS INTEIROS COM 3 DIGITOS.
      *
      *
      *
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EX02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 NUMERO1        PIC S9(03) VALUES 0.
       77 NUMERO2        PIC S9(03) VALUES 0.
       77 SOMA           PIC S9(06) VALUES 0.
       77 SAIDA-SOMA     PIC Z(05)9-.

       PROCEDURE DIVISION.
       INICIO-PROGRAMA.
           DISPLAY "QUAL O 1ß NUMERO:" FOREGROUND-COLOR 2 AT 0101.
           ACCEPT NUMERO1 AT 0118.
           DISPLAY "QUAL O 2ß NUMERO:" FOREGROUND-COLOR 2 AT 0301.
           ACCEPT NUMERO2 AT 0318.  *>coment†rio
       CALCULO.
           ADD NUMERO1, NUMERO2 TO SOMA.
           MOVE SOMA TO SAIDA-SOMA.
           DISPLAY FUNCTION CONCATENATE("A SOMA ê:", SAIDA-SOMA)
           AT 0501.

           MULTIPLY NUMERO1 BY NUMERO2 GIVING SOMA.
           MOVE SOMA TO SAIDA-SOMA.
           DISPLAY FUNCTION CONCATENATE("A MULTIPLICAÄéO ê:",SAIDA-SOMA)
           AT 0701.

           DIVIDE NUMERO1 BY NUMERO2 GIVING SOMA.
           MOVE SOMA TO SAIDA-SOMA.
           DISPLAY FUNCTION CONCATENATE("A DIVISéO ê:",SAIDA-SOMA)
           AT 0901.

           SUBTRACT NUMERO1 FROM NUMERO2.
       SAIDA.
           MOVE NUMERO2 TO SAIDA-SOMA.
           DISPLAY FUNCTION CONCATENATE("A SUBTRAÄéO ê:", SAIDA-SOMA)
           AT 1101.

           ACCEPT OMITTED AT 1301.
           STOP RUN.
       END PROGRAM EX02.
