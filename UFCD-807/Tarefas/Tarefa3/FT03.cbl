      ******************************************************************
      * Author: Adriana Gama
      * Date:11/01/2022
      * Purpose: prog09 -ufcd 0807
      * Tectonics: cobc
      ******************************************************************
              IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULADORA-ALUGUER-CARRO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 APELIDO      PIC A(15).
       77 NOME PIC A(15).
           01 TIPO-DE-CARRO.
           02 CARRO-1           PIC A(10)   VALUE "VOLKSWAGEN".
           02 CARRO-2           PIC A(6)    VALUE "TOYOTA".
           02 CARRO-3           PIC A(8)    VALUE "MERCEDES".
           02 CARRO-OPCAO-NUM   PIC 9(1).
           02 CARRO-MARCA       PIC 9(5).
       77 QUILOMETROS      PIC 9(5)V99.
       77 DIAS-ALUGUER     PIC 9(03).
       77 PREÇO-DIARIA     PIC 9(4)V99.
       77 PREÇO-KM         PIC 9(4)V99.
       77 TOTAL-SEM-IVA    PIC 9(4)V99.
       77 TOTAL-COM-IVA    PIC 9(4)V99.
       77 TOTAL-LIQUIDO    PIC 9(4)V99.
       77 TOTAL-VALOR-DIAS PIC 9(5)V99.
       77 TOTAL-VALOR-KMS  PIC 9(4)V99.
       77 IVA              PIC 9(4)V99 VALUES 0.
       77 FORMAT-TOTAL     PIC ZZZZZ9.99.

       PROCEDURE DIVISION.
       MAIN.
           DISPLAY "--------CALCULADORA ALUGUER DE CARROS-------".
           DISPLAY "--------------Tipo de carro-----------------".
           DISPLAY "1-VOLKSWAGEN".
           DISPLAY "2-TOYOTA".
           DISPLAY "3-MERCEDES".
           DISPLAY "--------------------------------------------".
           PERFORM 100000-INICIO.
           PERFORM CARRO-ESCOLHA.
           PERFORM KMS.
           PERFORM 200000-CALCULOS.
           PERFORM 300000-RESULTADO.
           STOP RUN.


       100000-INICIO.
           DISPLAY "INSIRA O APELIDO: ".
           ACCEPT APELIDO.
           DISPLAY "INSIRA O NOME: ".
           ACCEPT NOME.
           DISPLAY "INSIRA O TIPO DE CARRO: ".
           ACCEPT CARRO-OPCAO-NUM.
           DISPLAY "INSIRA OS KMS EFETUADOS: ".
           ACCEPT QUILOMETROS.
           DISPLAY "INSIRA O NUMERO DE DIAS DE ALUGUER: ".
           ACCEPT DIAS-ALUGUER.
           DISPLAY "--------------------------------------------".

       200000-CALCULOS.
        CARRO-ESCOLHA.
          EVALUATE CARRO-OPCAO-NUM
               WHEN 1
                   MOVE 30 TO PREÇO-DIARIA
                   MOVE PREÇO-DIARIA     TO CARRO-MARCA
               WHEN 2
                   MOVE 35 TO PREÇO-DIARIA
                   MOVE PREÇO-DIARIA   TO CARRO-MARCA
               WHEN 3
                   MOVE 60 TO PREÇO-DIARIA
                   MOVE PREÇO-DIARIA     TO CARRO-MARCA
               WHEN OTHER
                   GO TO ERROR-MENSAGEM
           END-EVALUATE.

         KMS.
          EVALUATE CARRO-OPCAO-NUM
               WHEN 1
                   MOVE 1.20 TO PREÇO-KM
                   IF (QUILOMETROS < 75)
                       COMPUTE QUILOMETROS=0
                       ELSE COMPUTE QUILOMETROS = (QUILOMETROS - 75)
                           END-IF

               WHEN 2
                   MOVE 1.50 TO PREÇO-KM
                   IF (QUILOMETROS < 75)
                       COMPUTE QUILOMETROS=0
                       ELSE COMPUTE QUILOMETROS = (QUILOMETROS - 75)
                           END-IF

               WHEN 3
                   MOVE 2.50 TO PREÇO-KM
                   IF (QUILOMETROS < 75)
                       COMPUTE QUILOMETROS=0
                       ELSE COMPUTE QUILOMETROS = (QUILOMETROS - 75)
                           END-IF
           END-EVALUATE.

           COMPUTE TOTAL-VALOR-DIAS = (CARRO-MARCA * DIAS-ALUGUER).
           COMPUTE TOTAL-VALOR-KMS = PREÇO-KM * QUILOMETROS.
           COMPUTE TOTAL-SEM-IVA =(TOTAL-VALOR-DIAS +
           TOTAL-VALOR-KMS).
           COMPUTE IVA = (TOTAL-SEM-IVA * 0.23).
           COMPUTE TOTAL-COM-IVA = TOTAL-SEM-IVA + IVA.
           COMPUTE TOTAL-LIQUIDO = (TOTAL-COM-IVA - IVA).
           MOVE TOTAL-SEM-IVA TO FORMAT-TOTAL.
       300000-RESULTADO.

           DISPLAY "NOME: " NOME.
           DISPLAY "APELIDO: " APELIDO.
           DISPLAY "KMS EFETUADOS: " QUILOMETROS.
           DISPLAY "TIPO DE CARRO: " CARRO-OPCAO-NUM.
           DISPLAY "DIAS ALUGUER:  " DIAS-ALUGUER.
           DISPLAY "____________Valores a Pagar____________________".
           DISPLAY "VALOR TOTAL DE DIÁRIAS: " TOTAL-VALOR-DIAS.
           DISPLAY "VALOR TOTAL DE KMS: "     TOTAL-VALOR-KMS.
           DISPLAY "VALOR TOTAL S/ IVA: "     TOTAL-SEM-IVA.
           DISPLAY "VALOR IVA 23%: "          IVA.
           DISPLAY "VALOR TOTAL C/ IVA: "     TOTAL-COM-IVA.
           DISPLAY "VALOR LIQUIDO: "          TOTAL-LIQUIDO.
           DISPLAY "_______________________________________________".

       ERROR-MENSAGEM.
        DISPLAY "*************************************".
           DISPLAY "DADOS INVALIDOS!".
        DISPLAY "*************************************".
           GO TO MAIN.

           STOP RUN.
       END PROGRAM CALCULADORA-ALUGUER-CARRO.
