
;****************************************************************************
;*		AULA: TECLAS e LEDS
;*
;*		PROF. VILSON
;*		Data: 13/02/2011
;*
;****************************************************************************

.INCLUDE <M328PDEF.INC>

;***********************************************************************************
;			Inicio do programa, posição zero
;-----------------------------------------------------------------------------------

	.CSEG
	.ORG 0x00


;***********************************************************************************
;			RESET
;-----------------------------------------------------------------------------------

RESET:

;-----------------------------------------------------------------------------------
;			Inicialização do stack pointer
;-----------------------------------------------------------------------------------

	LDI		R16,	HIGH(RAMEND) ;HIGH byte do maior endereço da SRAM
	OUT		SPH,	R16
	
	LDI		R16,	LOW(RAMEND)	;LOW byte do maior endereço da SRAM
	OUT		SPL,	R16

;-----------------------------------------------------------------------------------
;			Inicialização das portas de IO
;-----------------------------------------------------------------------------------
SETUP:

;	LDI		R16,	0x00
;	OUT		PORTB,	R16		; PORTB = 0x00

;	LDI		R16,	0x00 
;	OUT		DDRB,	R16		; DDRB = 0x00

	LDI		R16,	0xE3	
	OUT		DDRD,	R16		; DDRD = 0x00

	LDI		R16,	0x1C    
	OUT		PORTD,	R16		; PORTD = 0x00


; LED1 = PD5
; LED2 = PD6

; S1 = PD2
; S2 = PD3
; S3 = PD4
 

;***********************************************************************************
;		Laço principal
;-----------------------------------------------------------------------------------
MAIN:
	RCALL	FUNCTION_2
	RCALL	FUNCTION_3
	RJMP 	MAIN


FUNCTION_2:
	SBIS PIND,3
	RJMP TESTE	
	RJMP LIGA_LED1

TESTE:
	SBIC PIND,2
	RJMP DESLIGA_LED1
	RJMP LIGA_LED1


LIGA_LED1:
	SBI		PORTD, 5;		Liga led PD7
	RET

DESLIGA_LED1:
	CBI		PORTD, 5;		Desliga PD7
	RET


FUNCTION_3:

	SBIS PIND, 2
	RJMP LIGA_LED2

	SBIS PIND, 3
	RJMP TESTE2
	RJMP TESTE1
	


TESTE2:
	SBIS PIND,4
	RJMP LIGA_LED2
	RJMP DESLIGA_LED2


TESTE1:
	SBIS PIND, 4
	RJMP DESLIGA_LED2
	RJMP LIGA_LED2




DESLIGA_LED2:
	CBI		PORTD, 6;		Desliga PD6
	RET


LIGA_LED2:
	SBI		PORTD, 6;		Liga led PD6
	RET






