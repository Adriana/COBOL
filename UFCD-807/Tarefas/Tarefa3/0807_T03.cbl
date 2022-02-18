      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. T03.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 APELIDO          PIC A(20) VALUES SPACES.
       77 NOME             PIC A(20) VALUES SPACES.
       77 TEMP             PIC X(04) VALUES SPACES.
       77 KMS-EFETUADOS    PIC 9(04) VALUES 0.
       77 DIAS-ALUGUER     PIC 9(04) VALUES 0.
       77 TIPO-DE-CARRO    PIC 9(01) VALUES 0.
           88 VALIDAR-TIPO-DE-CARRO  VALUES 1 THRU 3.
       77 ILIQUIDO         PIC 9(05)V99 VALUES 0.
       77 IVA              PIC 9(05)V99 VALUES 0.
       77 TOTAL            PIC 9(06)V99 VALUES 0.
       77 SAIDA-VALORES    PIC ZZZ,ZZ9.99.
       77 RESPOSTA         PIC A VALUES SPACES.

       SCREEN SECTION.
       01 CLS BLANK SCREEN.

       01 ECRAN.
           05 COL 1 VALUE "RENT A CAR, LDA." FOREGROUND-COLOR 2
           HIGHLIGHT LINE 01.
           05 COL 1 VALUE "                          APELIDO:" LINE 03.
           05 COL 1 VALUE "                             NOME:" LINE 05.
           05 COL 1 VALUE "                    KMS EFETUADOS:" LINE 07.
           05 COL 1 VALUE "                  DIAS DE ALUGUER:" LINE 09.
           05 COL 1 VALUE "                    TIPO DE CARRO:" LINE 11.
           05 COL 1 VALUE "(1=VOLKSWAGEN 2=TOYOTA 3=MERCEDES)" LINE 12.
           05 COL 1 VALUE "                   TOTAL ILIQUIDO:" LINE 13.
           05 COL 1 VALUE "                         IVA(23%):" LINE 15.
           05 COL 1 VALUE "                            TOTAL:" LINE 17.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY CLS.
           DISPLAY ECRAN.
           ACCEPT APELIDO PROMPT AT 0335 FOREGROUND-COLOR 3 HIGHLIGHT.
           ACCEPT NOME    PROMPT AT 0535 FOREGROUND-COLOR 3 HIGHLIGHT.
           ACCEPT TEMP AT 0735 FOREGROUND-COLOR 3 HIGHLIGHT.
           MOVE FUNCTION NUMVAL(TEMP) TO KMS-EFETUADOS.
           ACCEPT TEMP AT 0935 FOREGROUND-COLOR 3 HIGHLIGHT.
           MOVE FUNCTION NUMVAL(TEMP) TO DIAS-ALUGUER.
           IF (KMS-EFETUADOS > 75) THEN
               SUBTRACT 75 FROM KMS-EFETUADOS
           END-IF.
       LER-CARRO.
           ACCEPT TIPO-DE-CARRO PROMPT AT 1135 FOREGROUND-COLOR 3
           HIGHLIGHT.
           IF (NOT VALIDAR-TIPO-DE-CARRO) THEN
               DISPLAY "TIPO DE CARRO NAO EXISTE. DIGITE 1, 2 OU 3."
               FOREGROUND-COLOR 4 HIGHLIGHT AT 1137
               GO LER-CARRO
           ELSE
               DISPLAY " " ERASE EOL AT 1137
           END-IF.
           EVALUATE TIPO-DE-CARRO
               WHEN 1
                   DISPLAY "VOLKSWAGEN" AT 1137 FOREGROUND-COLOR 6
                   HIGHLIGHT
                   COMPUTE ILIQUIDO = ((DIAS-ALUGUER * 30) +
                                      (KMS-EFETUADOS * 1.2))
               WHEN 2
                   DISPLAY "TOYOTA"     AT 1137 FOREGROUND-COLOR 6
                   HIGHLIGHT
                   COMPUTE ILIQUIDO = ((DIAS-ALUGUER * 35) +
                                      (KMS-EFETUADOS * 1.5))
               WHEN OTHER
                   DISPLAY "MERCEDES"   AT 1137 FOREGROUND-COLOR 6
                   HIGHLIGHT
                   COMPUTE ILIQUIDO = ((DIAS-ALUGUER * 60) +
                                      (KMS-EFETUADOS * 2.5))
           END-EVALUATE.
       PROCESSAMENTO.
           COMPUTE IVA = (ILIQUIDO * 0.23).
           COMPUTE TOTAL = (ILIQUIDO + IVA).
       SAIDA.
           MOVE ILIQUIDO TO SAIDA-VALORES.
           DISPLAY SAIDA-VALORES AT 1337 FOREGROUND-COLOR 3 HIGHLIGHT.
           MOVE IVA TO SAIDA-VALORES.
           DISPLAY SAIDA-VALORES AT 1537 FOREGROUND-COLOR 3 HIGHLIGHT.
           MOVE TOTAL TO SAIDA-VALORES.
           DISPLAY SAIDA-VALORES AT 1737 FOREGROUND-COLOR 3 HIGHLIGHT.

           DISPLAY "DIGITE S PARA CONTINUAR, OUTRA TECLA PARA SAIR:"
           AT 1901.
           ACCEPT RESPOSTA AT 1948.
           IF (FUNCTION UPPER-CASE(RESPOSTA)="S") THEN
               GO MAIN-PROCEDURE
           END-IF.
           DISPLAY "FIM DO PROGRAMA. PRIMA ENTER PARA CONTINUAR."
           AT 2101.
           ACCEPT OMITTED AT 2201
           STOP RUN.
       END PROGRAM T03.
