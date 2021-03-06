;****************************************************************************
;*		AULA: LABORAT�RIO ADC
;*
;*		PROF. VILSON
;*
;****************************************************************************

.INCLUDE <M328PDEF.INC>

;****************************************************************************
;	Inicio do programa, posi��o zero
;----------------------------------------------------------------------------
	.CSEG
	.ORG 0x00

	.EQU STRING = 0x0100

;****************************************************************************
;	RESET
;----------------------------------------------------------------------------
RESET:

;----------------------------------------------------------------------------
;			Inicializa��o do stack pointer
;----------------------------------------------------------------------------
	LDI		R16,	HIGH(RAMEND) ;HIGH byte do maior endere�o da SRAM
	OUT		SPH,	R16
	
	LDI		R16,	LOW(RAMEND)	 ;LOW byte do maior endere�o da SRAM
	OUT		SPL,	R16


;----------------------------------------------------------------------------
;			Inicializa��o do ADC
;----------------------------------------------------------------------------
	LDI		R16,	0x41		; ADMUX = 0x41
	STS		ADMUX,	R16

	LDI		R16,	0x87		; ADCSRA = 0x87
	STS		ADCSRA,	R16

;----------------------------------------------------------------------------
;			Inicializa��o da SERIAL 
;----------------------------------------------------------------------------

; UCSRA = 0x02 = 0000.0010
; UCSRB = 0x18 = 0001.1000
; UCSRC = 0x86 = 1000.0110

	LDI		R16,	0x02		
	STS		UCSR0A,	R16

	LDI		R16,	0x18	
	STS		UCSR0B,	R16

	LDI		R16,	0x06
	STS		UCSR0C,	R16


; UBRRH = 0x00  // 9600     UBBR = 16.000.000 / (8.BAUD) - 1
; UBRRL = 0xCF

//UBRRH = 0x06  // 1200
//UBRRL = 0x82

	LDI		R16,	0x00		
	STS		UBRR0H,	R16

	LDI		R16,	0xCF		
	STS		UBRR0L,	R16

; ARMAZENADO NA DATA RAM 0x0100 "MICRO"

	LDI		YL, LOW(STRING)
	LDI		YH, HIGH(STRING)

	LDI		R24, 'M'
	ST		Y+, R24
	LDI		R24, 'I'
	ST		Y+, R24
	LDI		R24, 'C'
	ST		Y+, R24
	LDI		R24, 'R'
	ST		Y+, R24
	LDI		R24, '0'
	ST		Y+, R24
	LDI		R24, '\n'
	ST		Y+, R24
	LDI		R24,  0
	ST		Y+, R24

	LDI		YL, LOW(STRING)
	LDI		YH, HIGH(STRING)
	
	RCALL	TX_STRING

;****************************************************************************
;	MAIN
;----------------------------------------------------------------------------

; R3:R2 = m�dia da leitura do ADC (0 - 1023) 
; Sa�da ASCII  "Fulano ADC = 0x02A5 = 667 = 3,305V"

;****************************************************************************
;	MAIN
;----------------------------------------------------------------------------

MAIN:
	CLR		R3			; acumulador das leituras
	CLR		R2

	LDI		R19, 8		; contador do loop de m�dia
LOOP_ADC:

	LDI		R16, 1		; canal ligado ao potenci�metro
	RCALL	ADC_CONV	; R1:R0 => Contem o resultado da leitura ADC

	ADD		R2, R0		; R3:R2 = R3:R2 + R1:R0
	ADC		R3, R1

	LDI		R18, HIGH(75) ; TEMPO = 600ms / 8 = 75 ms
	LDI		R17, LOW(75)
	RCALL	DELAY_MS

	DEC 	R19
	CPI		R19, 0
	BREQ	CALC_MEDIA
	RJMP	LOOP_ADC

CALC_MEDIA:
	; R3:R2 / 8
	; R3:R2 >> 3

	LSR		R3
	ROR		R2

	LSR		R3
	ROR		R2

	LSR		R3
	ROR		R2

	; RESULTADO DA M�DIA EST� EM R3:R2

	RCALL	CONVERTER

	LDI		YL, LOW(STRING)
	LDI		YH, HIGH(STRING)
	
	RCALL	TX_STRING

	RJMP 	MAIN


;****************************************************************************
; TRANSMITE: formata o resultado em ASCII e transmite cada caracter
;----------------------------------------------------------------------------
; INPUT: 	R16 = byte a ser transmitido
;----------------------------------------------------------------------------


CONVERTER:

	LDI		YL, LOW(STRING)
	LDI		YH, HIGH(STRING)    ;   ":0x0104 = 0260 => 1,457V

	LDI		R16, ':'
	ST		Y+, R16

	LDI		R16, '0'
	ST		Y+, R16

	LDI		R16, 'x'
	ST		Y+, R16

	MOV		R16, R2
	MOV		R17, R3

	RCALL 	CONV_HEXA ; RESULATADO DA M�DIA ESTA EM R11:R8 ( 4 caracteres)

	ST		Y+, R11
	ST		Y+, R10
	ST		Y+, R9
	ST		Y+, R8

	LDI		R16, ' '
	ST		Y+, R16

	LDI		R16, '='
	ST		Y+, R16

	LDI		R16, ' '
	ST		Y+, R16

	MOV		R16, R2
	MOV		R17, R3

	RCALL 	CONV_ASCII ; RESULATADO DA M�DIA ESTA EM R11:R7 ( 5 caracteres)

;	MOV		R16, R11	; N�o precisa transmitir, sabemos que � zero
;	RCALL	TX

	ST		Y+, R10
	ST		Y+, R9
	ST		Y+, R8
	ST		Y+, R7

	LDI		R16, ' '
	ST		Y+, R16

	LDI		R16, '='
	ST		Y+, R16

	LDI		R16, '>'
	ST		Y+, R16

	LDI		R16, ' '
	ST		Y+, R16


CONTA:
	; ADC = Vin * 1024 / 5;
	; Vin = ADC * 5000mV / 1024;
	 
	; ADC => R3:R2      
	; [R17:R16]x[R19:R18] = [R23..R20] 

	MOV		R16, R2
	MOV		R17, R3

	LDI		R18, LOW(5000);
	LDI		R19, HIGH(5000);

	RCALL	MUL16X16

 	;   R23:R22:R21:R20 >> 10
	;   (R23:R22:R21:R20 >> 8 ) >> 2
	;   (R23:R22:R21) >> 2


	LSR		R23
	ROR		R22
	ROR		R21

	LSR		R23
	ROR		R22
	ROR		R21


	MOV		R16, R21
	MOV		R17, R22


	RCALL 	CONV_ASCII ; Resultado da conta convertido para ASCII, r11:R7 com ponto ap�s primeiro caracter

	ST		Y+, R10
	
	LDI		R16, '.'
	ST		Y+, R16
	
	ST		Y+, R9
	ST		Y+, R8
	ST		Y+, R7

	LDI		R16, 'V'
	ST		Y+, R16

	LDI		R16, '\n'
	ST		Y+, R16

	LDI		R16, 0
	ST		Y+, R16

	RET


;****************************************************************************
;	TX
;----------------------------------------------------------------------------
; INPUT: 	R16 = byte a ser transmitido
;----------------------------------------------------------------------------
TX:
	; if UDRE == 1 passa para frente
	
	LDS		R5, UCSR0A
	SBRS	R5, UDRE0
	RJMP	TX

	STS		UDR0, R16
	RET



;****************************************************************************
;	TX_STRING
;----------------------------------------------------------------------------
; INPUT: 	Y = ponteiro do vetor ser transmitido
;----------------------------------------------------------------------------
TX_STRING:
	LD		R16, Y+		;  R16 = *(y);  Y++
	CPI		R16, 0
	BREQ	FIM_TX_STRING
	RCALL 	TX
	RJMP 	TX_STRING

FIM_TX_STRING:
	RET


;****************************************************************************
;	ADC_CONV
;----------------------------------------------------------------------------
; INPUT: 	R16 = Canal de convers�o (0 - 7)
; OUTPUT:   R1:R0 = Retorno do ADC em 10bits justificado � direita
;----------------------------------------------------------------------------

ADC_CONV:

;	LDI 	R16, HIGH (677)
;	MOV		R1, R16

;	LDI 	R16, LOW (677)
;	MOV		R0, R16

;	RET

	; admux = 0x40 | canal
	ORI		R16, 0x40 	; R16 = 0x40 | R16
	STS		ADMUX, R16  ; admux = 0x40 | R16

	;DELAY
	LDI		R16, 10
	RCALL 	DELAY_US

;	SBI		ADCSRA, ADSC ; adcsra_adsc = 1 (setar o bit de inicio de convers�o
	LDS  	R16, ADCSRA 
    SBR  	R16, 1<<ADSC 
    STS  	ADCSRA, R16  



WAIT_ADC:
	;SBIC	ADCSRA, ADSC
	LDS  	R16, ADCSRA 
	SBRC	R16, ADSC
	RJMP 	WAIT_ADC

	; LEITURA DO RESULTADO

	LDS		R0, ADCL
	LDS 	R1, ADCH

	RET


;****************************************************************************
;	DELAY - Calibrado para 16MHz -> 62.5ns
;----------------------------------------------------------------------------
; INPUT: 	R16 = n�mero de microsegundos a ser atrasado
;----------------------------------------------------------------------------

DELAY_US:

	; NOP - para compensar a carga do valor de R16 via LDI
	NOP
	NOP
	NOP
	NOP
	
LOOP_DELAY_US:
	DEC 	R16
	CPI 	R16, 0
	BREQ    FIM_DELAY_US
	
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP	
	RJMP 	LOOP_DELAY_US

FIM_DELAY_US:
	RET


;****************************************************************************
;	DELAY - Calibrado para 16MHz -> 62.5ns
;----------------------------------------------------------------------------
; INPUT: 	R16 = n�mero de microsegundos a ser atrasado
;----------------------------------------------------------------------------

DELAY_MS:

	; DELAY 1MS

	LDI		R16, 250
	RCALL 	DELAY_US

	LDI		R16, 250
	RCALL 	DELAY_US

	LDI		R16, 250
	RCALL 	DELAY_US

	LDI		R16, 249
	RCALL 	DELAY_US

LOOP_DELAY_MS:
	SUBI 	R17, 1			; r16--   =>    (R18:R17)--     => R17 = R17 - 1
	SBCI	R18, 0			;                                  R18 = R18 - 0 - C

	CLR		R0				; R0 = 0

	CP 		R0, R17
	CPC		R0, R18

	BREQ    FIM_DELAY_MS	; SE (R18:R17)==0 FIM
	
	; DELAY 1MS

	LDI		R16, 250
	RCALL 	DELAY_US

	LDI		R16, 250
	RCALL 	DELAY_US

	LDI		R16, 250
	RCALL 	DELAY_US

	LDI		R16, 249 ; (16ciclos = 1us) => s� 8 ciclos
	RCALL 	DELAY_US

	NOP
	NOP
	NOP
	NOP

	NOP
	NOP
	NOP
	NOP

	RJMP 	LOOP_DELAY_MS

FIM_DELAY_MS:
	RET


CONV_HEXA:

 	MOV 	R19, R17
	ANDI    R19, 0b11110000
	SWAP 	R19
	RCALL	BIN2HEX
	MOV		R11, R18

 	MOV 	R19, R17
	ANDI    R19, 0b00001111
	RCALL	BIN2HEX
	MOV		R10, R18

	MOV 	R19, R16
	ANDI    R19, 0b11110000
	SWAP 	R19
	RCALL	BIN2HEX
	MOV		R9, R18

 	MOV 	R19, R16
	ANDI    R19, 0b00001111
	RCALL	BIN2HEX
	MOV		R8, R18

	RET


BIN2HEX:
;   X = R19
;   Y = R18 

;	IF (R19<10) 			
;		R18 = R19 + 48		
;	ELSE			
;		R18 = R19 + 55		
		
	CPI		R19, 10
	BRSH	MAIOR_IGUAL_10

	LDI 	R18, 48
	ADD     R18, R19
	
	RET

MAIOR_IGUAL_10:
	LDI 	R18, 55
	ADD		R18, R19

	RET


; INPUT: R17:R16

; R11 = dezena de milhar
; R10 = milhar
; R09 = centena
; R08 = dezena
; R07 = unidade

CONV_ASCII:

	CLR		R11
	CLR		R10
	CLR		R9
	CLR		R8

	LDI		R18, LOW(10000)
	LDI 	R19, HIGH(10000)
DEZ_MILHAR:
	CP		R16, R18
	CPC		R17, R19

	BRSH	MAIOR_10000
	RJMP 	MILHAR_INIT

MAIOR_10000:

	SUBI	R16, LOW(10000)		; R16 = R16 - 10000
	SBCI 	R17, HIGH(10000)	
	INC		R11					; R31 ++
	RJMP	DEZ_MILHAR		

MILHAR_INIT:
	LDI		R18, LOW(1000)
	LDI 	R19, HIGH(1000)
MILHAR:
	CP		R16, R18
	CPC		R17, R19

	BRSH	MAIOR_1000
	RJMP 	CENTENA_INIT

MAIOR_1000:

	SUBI	R16, LOW(1000)		; R16 = R16 - 1000
	SBCI 	R17, HIGH(1000)	
	INC		R10					; R30 ++
	RJMP	MILHAR		


CENTENA_INIT:
	LDI		R18, LOW(100)
	LDI 	R19, HIGH(100)
CENTENA:
	CP		R16, R18
	CPC		R17, R19

	BRSH	MAIOR_100
	RJMP 	DEZENA

MAIOR_100:

	SUBI	R16, LOW(100)		; R16 = R16 - 100
	SBCI 	R17, HIGH(100)	
	INC		R9					; R29 ++
	RJMP	CENTENA		


DEZENA:
	CPI		R16, 10
	BRSH	MAIOR_10
	RJMP 	UNIDADE

MAIOR_10:
	SUBI	R16, 10		; R16 = R16 - 10
	INC 	R8			; R28 ++
	RJMP	DEZENA		

UNIDADE:
	MOV		R7, R16

	LDI		R16, 48

	ADD 	R7, R16		;	R29 = R29 + 48
	ADD 	R8, R16		;	R29 = R29 + 48
	ADD 	R9, R16		;	R29 = R29 + 48
	ADD		R10, R16	;	R30 = R30 + 48
	ADD		R11, R16	;	R31 = R31 + 48
		
	RET


; 28) Multiplicar de 16x16 bits positivos 
;         [R17:R16]x[R19:R18] = [R23..R20]  
MUL16X16:

	CLR   R2        	;  Zera R2 
	MUL   R17, R19      ;  Multiplica MSB 
	MOVW  R23:R22, R1:R0;  Move a resposta para o Resultado 
	MUL   R16, R18      ;  Multiplica LSB 
	MOVW  R21:R20, R1:R0;  Move a resposta para o Resultado 
 
	MUL   R17, R18      ;  Multiplica MSB_1 x LSB_2 
	ADD   R21, R0      	;  Soma a resposta no Resultado 
	ADC   R22, R1       
	ADC   R23, R2   
 
	MUL   R16, R19      ;  Multiplica LSB_1 x MSB_2 
	ADD   R21, R0      	;  Soma a resposta no Resultado 
	ADC   R22, R1       
	ADC   R23, R2 

	RET


; 28) Multiplicar 32x8 bits positivos 
;         [R23:R22:R21:R20]x[R24] = [R30:R29:R28:R27:R26]  

; 	 R23:R22:R21:R20
;		 		 R24
;	_______________
;R30:R29:R28:R27:R26
	
;			 R20*R24
;    	 R21*R24
;	 R22*R24
;R23*R24



MUL32x8:

	CLR	  R28
	CLR	  R29
	CLR	  R30

	MUL   R24, R20      ;  Multiplica LSB (Byte0)
	MOVW  R27:R26, R1:R0;  Move a resposta para o Resultado 
	
	MUL   R24, R21      ;  Multiplica  (Byte1)
	ADD	  R27, R0
	ADC	  R28, R1

	MUL   R24, R22      ;  Multiplica  (Byte2)
	ADD	  R28, R0
	ADC	  R29, R1

	MUL   R24, R23      ;  Multiplica MSB (Byte3)
	ADD	  R29, R0
	ADC	  R30, R1

	RET


