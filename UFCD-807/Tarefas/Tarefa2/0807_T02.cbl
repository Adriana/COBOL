      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T02.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 TEMP        PIC X(02) VALUES SPACES.
       77 IDADE       PIC 9(02) VALUES 0.
           88 VALIDAR-IDADE VALUES 18 THRU 65.
       77 ANTIGUIDADE PIC 9(02) VALUES 0.
       77 FILHOS      PIC 9(02) VALUES 0.
           88 VALIDAR-FILHOS VALUES 0 THRU 99.
       77 BONUS       PIC 9(04) VALUES 0.
       77 SAIDA-BONUS PIC Z,ZZ9.
       77 REPETIR     PIC X(01) VALUES SPACES.

       01 DATA-ATUAL.
           05 ANO PIC 9(04) VALUES 0.
           05 MES PIC 9(02) VALUES 0.
           05 DIA PIC 9(02) VALUES 0.

       SCREEN SECTION.
       01 LIMPAR-ECRAN BLANK SCREEN.

       PROCEDURE DIVISION.
       LER-IDADE.
           DISPLAY LIMPAR-ECRAN.
           ACCEPT DATA-ATUAL FROM DATE YYYYMMDD.
           DISPLAY FUNCTION CONCATENATE(DIA,"-",MES,"-",ANO) AT 0140.
           DISPLAY "CARLOS RAFAEL" AT 0239.
           DISPLAY "CALCULO DO BONUS DE NATAL" FOREGROUND-COLOR 3
           HIGHLIGHT AT 0101.
           DISPLAY "QUAL A IDADE:" AT 0301.
           ACCEPT TEMP AT 0314 FOREGROUND-COLOR 2 HIGHLIGHT.
           MOVE FUNCTION NUMVAL(TEMP) TO IDADE.
           IF (NOT VALIDAR-IDADE) THEN
               DISPLAY "A IDADE NAO E VALIDA" FOREGROUND-COLOR 4
               HIGHLIGHT AT 0318
               GO LER-IDADE
           ELSE
               DISPLAY " " ERASE EOL AT 0318
           END-IF.
       LER-ANTIGUIDADE.
           DISPLAY "QUAL A ANTIGUIDADE:" AT 0501.
           ACCEPT TEMP AT 0520 FOREGROUND-COLOR 2 HIGHLIGHT.
           MOVE FUNCTION NUMVAL(TEMP) TO ANTIGUIDADE.
           IF (ANTIGUIDADE > IDADE) THEN
               DISPLAY "A ANTIGUIDADE NAO E VALIDA" FOREGROUND-COLOR 4
               HIGHLIGHT AT 0523
               GO LER-ANTIGUIDADE
           ELSE
               DISPLAY " " ERASE EOL AT 0523
           END-IF.
       LER-FILHOS.
           DISPLAY "QUAL O N. FILHOS:" AT 0701.
           ACCEPT TEMP AT 0718 FOREGROUND-COLOR 2 HIGHLIGHT.
           MOVE FUNCTION NUMVAL(TEMP) TO FILHOS.
           IF (NOT VALIDAR-FILHOS) THEN
               DISPLAY "N. FILHOS NAO E VALIDO" FOREGROUND-COLOR 4
               HIGHLIGHT AT 0722
               GO LER-FILHOS
           ELSE
               DISPLAY " " ERASE EOL AT 0722
           END-IF.
       CALCULO-BONUS.
      * O BONUS DA IDADE
           IF (IDADE > 45) THEN
               COMPUTE BONUS = ((IDADE - 45 ) * 5)
           END-IF.
      * O BONUS DA ANTIGUIDADE
           IF (ANTIGUIDADE <= 10) THEN
               COMPUTE BONUS = (BONUS + (ANTIGUIDADE * 10))
           ELSE
               COMPUTE BONUS = (BONUS + ((ANTIGUIDADE - 10) * 20) + 100)
           END-IF.
      * O BONUS DOS FILHOS
           IF (FILHOS > 3) THEN
               COMPUTE BONUS = (BONUS + 75)
           ELSE
               COMPUTE BONUS = (BONUS + (FILHOS * 25))
           END-IF.
       SAIDA.
           MOVE BONUS TO SAIDA-BONUS.
           DISPLAY FUNCTION CONCATENATE("O VALOR DO BONUS ê:",
           SAIDA-BONUS) AT 0901.

           DISPLAY "PRETENDE EFETUAR NOVO CALCULO?(S/N):" AT 1101.
           ACCEPT REPETIR AT 1137.
           IF FUNCTION UPPER-CASE(REPETIR)="S" THEN
               GO LER-IDADE
           END-IF.

           STOP RUN.
       END PROGRAM T02.
