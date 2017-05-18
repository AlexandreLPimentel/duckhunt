SCREEN	EQU	8000h			; endereço PixelScreen
INPUT	EQU	0E000h			; endereço do porto de entrada
POUT_1	EQU	0A000H
ON	EQU	1			; 
OFF	EQU	0			; 
CEN	EQU	1
DIR	EQU	2
ESQ	EQU	3
BAL	EQU	2101h
BALX	EQU	2102h
BALY	EQU	2103h
PAT1	EQU	2104h
PAT1X	EQU	2105h
PAT1Y	EQU	2106h
PAT2	EQU	2107h
PAT2X	EQU	2108h
PAT2Y	EQU	2109h
PAT3	EQU	210Ah
PAT3X	EQU	210Bh
PAT3Y	EQU	210Ch
ARMA	EQU	210Dh
ARMA2	EQU 	210Eh
DIFIC	EQU	210Fh
BALAS	EQU	2110h
DELAY	EQU	2111h
DELAY2	EQU	2112h
CLOCK	EQU	2113h
M1_RCU	EQU	6000H			; Registo controlo da MUART-1
M1_REP	EQU	6002H			; Registo estado da MUART-1
M1_RD1	EQU	6004H			; Registo dados da UART 1 da MUART-1 (porto de Rx)
M1_RD2	EQU	6006H			; Registo dados da UART 2 da MUART-1 (porto de Tx)

;*************************ESPAÇO PARA A PILHA***********************
PLACE		2000H
pilha:		TABLE	100H		; espaço para a pilha
fim_pilha:


;*************************TABELA DE INTERRUPÇOES**********************

tab:		WORD	rot0		; tabela de interrupções 
		WORD	rot1



PLACE		0000H
inicio:
		DI
		MOV	BTE, tab	; inicializa BTE
    		MOV	SP, fim_pilha	; inicializa SP


;::::::::::::::::LIMPAR PIXELSCREEN::::::::::::::::::::::
					; funçao que limpa pixelscreen. Por vezes, quando este é iniciado, vem com algum "lixo".
limpeza:	MOV R1, 8000h	
		MOV R2, 0000h
            	MOV R3, 8080h
contlimp:	MOVB [R1], R2
		ADD R1, 1h
		CMP R1, R3
		JNZ contlimp



;**************************MAIN***********************

	MOV	R0, ARMA		;
	MOV 	R1, 1			;
	MOVB	[R0], R1		; Coloca em ARMA o valor 1 e em ARMA2 o valor 0 para desenhar a arma a primeira vez
	MOV	R0, ARMA2		;
	MOV	R1, 0			;
	MOVB	[R0], R1		;

	MOV	R0, PAT1X		;
	MOV	R1, PAT1Y		;
	MOV	R2, 0			;
	MOV	R3, 1			;
	MOVB	[R0], R2		;
	MOVB	[R1], R3		;
	MOV	R0, PAT2X		; Inicializa as posições de todos os patos, guardando as suas coordenadas iniciais
	MOV	R1, PAT2Y		; nos endereços respectivos
	MOV	R3, 4			;
	MOVB	[R0], R2		;
	MOVB	[R1], R3		;
	MOV	R0, PAT3X		;
	MOV	R1, PAT3Y		;
	MOV	R3, 7			;
	MOVB	[R0], R2		;
	MOVB	[R1], R3		;


	MOV 	R3,	51H	;
	CALL	imprime_ecra	;
	MOV 	R3,	75H	;
	CALL	imprime_ecra	;
	MOV 	R3,	65H	;
	CALL	imprime_ecra	;
	MOV 	R3,	20H	;
	CALL	imprime_ecra	;
	MOV 	R3,	64H	;
	CALL	imprime_ecra	;
	MOV 	R3,	69H	;
	CALL	imprime_ecra	;
	MOV 	R3,	66H	;
	CALL	imprime_ecra	;
	MOV 	R3,	69H	;
	CALL	imprime_ecra	;
	MOV 	R3,	63H	;
	CALL	imprime_ecra	;
	MOV 	R3,	75H	;
	CALL	imprime_ecra	;
	MOV 	R3,	6CH	;
	CALL	imprime_ecra	;
	MOV 	R3,	64H	;
	CALL	imprime_ecra	; Imprime no terminal a pergunta "Que dificuldadade quer? (0, 1 ou 2)" 
	MOV 	R3,	61H	; para depois o utilizador escolher a velocidade dos patos.
	CALL	imprime_ecra	;
	MOV 	R3,	64H	;
	CALL	imprime_ecra	;
	MOV 	R3,	65H	;
	CALL	imprime_ecra	;
	MOV 	R3,	20H	;
	CALL	imprime_ecra	;
	MOV 	R3,	71H	;
	CALL	imprime_ecra	;
	MOV 	R3,	75H	;
	CALL	imprime_ecra	;
	MOV 	R3,	65H	;
	CALL	imprime_ecra	;
	MOV 	R3,	72H	;
	CALL	imprime_ecra	;
	MOV 	R3,	3FH	;
	CALL	imprime_ecra	;
	MOV 	R3,	20H	;
	CALL	imprime_ecra	;
	MOV 	R3,	28H	;
	CALL	imprime_ecra	;
	MOV 	R3,	31H	;
	CALL	imprime_ecra	;
	MOV 	R3,	2CH	;
	CALL	imprime_ecra	;
	MOV 	R3,	20H	;
	CALL	imprime_ecra	;
	MOV 	R3,	32H	;
	CALL	imprime_ecra	;
	MOV 	R3,	20H	;
	CALL	imprime_ecra	;
	MOV 	R3,	6FH	;
	CALL	imprime_ecra	;
	MOV 	R3,	75H	;
	CALL	imprime_ecra	;
	MOV 	R3,	20H	;
	CALL	imprime_ecra	;
	MOV 	R3,	33H	;
	CALL	imprime_ecra	;
	MOV 	R3,	29H	;
	CALL	imprime_ecra	;
	MOV	R3,	0AH	;
	CALL	imprime_ecra	;
	


	MOV	R2,	0
	MOV	R10, 	30H
	MOV	R9,	34H
dific:	MOV	R3,	30H			; Coloca 0 (em ASCII hexa) em R3
	CALL	IN_CHAR
	CMP	R3, 	R10
	JLE	dific			; Se o input tiver sido qualquer coisa abaixo de 1 em ASCII
	CMP	R3, 	R9
	JGE	dific			; Se o input tiver sido qualquer coisa acima de 3 em ASCII


	CALL	imprime_ecra

	MOV	R0, 	DIFIC
	SUB	R3, 	R10
	MOVB	[R0], 	R3
		
	MOV	R5, ON
	MOV	R0,	0000H
	CMP	R3,	0001H
	JEQ	pato_1
	CMP	R3,	0002H
	JEQ	pato_2
	MOV	R1,	0007H		; Desenha o terceiro pato
	CALL 	pato
	MOV	R4,	PAT3
	MOVB	[R4],	R5
pato_2:	MOV	R1,	0004H		; Desenha o segundo pato
	CALL 	pato
	MOV	R4,	PAT2
	MOVB	[R4],	R5
pato_1:	MOV	R1,	0001H		; Desenha o primeiro pato
	CALL	pato
	MOV	R4,	PAT1
	MOVB	[R4],	R5



	MOV	R3, 	0AH
	CALL	imprime_ecra


	MOV	R0, DIFIC
	MOVB	R1, [R0]
	CMP	R1, 1
	JNE	mun_2
	MOV	R1, 10H
	JMP 	mun_f
mun_2:	CMP	R1, 2
	JNE	mun_3
	MOV	R1, 15H
	JMP	mun_f
mun_3:	MOV	R1, 20H
	JMP	mun_f	
mun_f:	MOV	R0, POUT_1
	MOVB	[R0], R1
	MOV	R0, BALAS
	MOVB	[R0], R1


	MOV	R0, DIFIC
	MOVB	R1, [R0]
	CMP	R1, 1
	JEQ	dific1
	CMP	R1, 2
	JEQ	dific2
dific3: MOV	R0, 0
	JMP	c_dific
dific2:	MOV	R0, 1
	JMP	c_dific
dific1:	MOV	R0, 3
c_dific:MOV	R1, DELAY2
	MOVB	[R1], R0
	MOV	R1, DELAY
	MOV	R0, 0
	MOVB	[R1], R0


	MOV R3, 54H		;
	CALL	imprime_ecra	;
	MOV R3, 65H		;
	CALL	imprime_ecra	;
	MOV R3, 63H		;
	CALL	imprime_ecra	;
	MOV R3, 6CH		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 73H		;
	CALL	imprime_ecra	;
	MOV R3, 3AH		;
	CALL	imprime_ecra	;
	MOV R3, 0AH		; 
	CALL	imprime_ecra	; "Teclas:"
	MOV R3, 9H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 2DH		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 65H		;
	CALL	imprime_ecra	;
	MOV R3, 73H		;	
	CALL	imprime_ecra	;
	MOV R3, 71H		;
	CALL	imprime_ecra	;
	MOV R3, 75H		;
	CALL	imprime_ecra	;
	MOV R3, 65H		;
	CALL	imprime_ecra	;
	MOV R3, 72H		;
	CALL	imprime_ecra	;
	MOV R3, 64H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 0AH		; 
	CALL	imprime_ecra	; "a - esquerda"
	MOV R3, 9H		;
	CALL	imprime_ecra	;
	MOV R3, 73H		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 2DH		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 63H		;
	CALL	imprime_ecra	;
	MOV R3, 65H		;
	CALL	imprime_ecra	;
	MOV R3, 6EH		;
	CALL	imprime_ecra	;
	MOV R3, 74H		;
	CALL	imprime_ecra	;
	MOV R3, 72H		;
	CALL	imprime_ecra	;
	MOV R3, 6FH		;
	CALL	imprime_ecra	;
	MOV R3, 0AH		; 
	CALL	imprime_ecra	; "s - centro"
	MOV R3, 9H		;
	CALL	imprime_ecra	;
	MOV R3, 64H		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 2DH		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 64H		;
	CALL	imprime_ecra	;
	MOV R3, 69H		;
	CALL	imprime_ecra	;
	MOV R3, 72H		;
	CALL	imprime_ecra	;
	MOV R3, 65H		;
	CALL	imprime_ecra	;
	MOV R3, 69H		;
	CALL	imprime_ecra	;
	MOV R3, 74H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 0AH		; 
	CALL	imprime_ecra	; "d - direita"
	MOV R3, 9H		;
	CALL	imprime_ecra	;
	MOV R3, 65H		;
	CALL	imprime_ecra	;
	MOV R3, 73H		;
	CALL	imprime_ecra	;
	MOV R3, 70H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 0E7H		;
	CALL	imprime_ecra	;
	MOV R3, 6FH		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 2DH		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 64H		;
	CALL	imprime_ecra	;
	MOV R3, 69H		;
	CALL	imprime_ecra	;
	MOV R3, 73H		;
	CALL	imprime_ecra	;
	MOV R3, 70H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 72H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 72H		;
	CALL	imprime_ecra	;
	MOV R3, 0AH		; 
	CALL	imprime_ecra	; "espaço - disparar"
	MOV R3, 9H		;
	CALL	imprime_ecra	;
	MOV R3, 70H		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 2DH		;
	CALL	imprime_ecra	;
	MOV R3, 20H		;
	CALL	imprime_ecra	;
	MOV R3, 70H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 75H		;
	CALL	imprime_ecra	;
	MOV R3, 73H		;
	CALL	imprime_ecra	;
	MOV R3, 61H		;
	CALL	imprime_ecra	;
	MOV R3, 0AH		; 
	CALL	imprime_ecra	; "p - pausa"


	MOV	R5, 0001h
	MOV  	RCN, R5


	CALL 	ini_MUART		; inicializa MUART-1
	CALL	arm			; escreve arma pela 1ª vez ao centro
	EI0				; permite interrupções
	EI1
	EI
	
	
ciclo:	DI
	CALL	P1			; invoca processo P1 (trata do movimento dos patos)
	CALL	ver_patos
	CMP	R0, OFF
	JEQ	vit
	MOV	R1, BALAS
	MOVB	R0, [R1]
	CMP	R0, 0
	JEQ	perd_ver
cic_1:	EI
	JMP	ciclo			; repete ciclo

perd_ver:
	DI
	MOV R0, BAL
	MOVB R1, [R0]
	CMP R1, OFF
	JEQ perd
	JMP cic_1
perd:	MOV	R3, 50H
	CALL	imprime_ecra
	MOV	R3, 65H
	CALL	imprime_ecra
	MOV	R3, 72H
	CALL	imprime_ecra
	MOV	R3, 64H
	CALL	imprime_ecra
	MOV	R3, 65H
	CALL	imprime_ecra
	MOV	R3, 75H
	CALL	imprime_ecra
	MOV	R3, 21H
	CALL	imprime_ecra
	MOV	R3, 10H
	CALL	imprime_ecra
	JMP fim

vit:	DI
	MOV	R3, 47H
	CALL	imprime_ecra
	MOV	R3, 61H
	CALL	imprime_ecra
	MOV	R3, 6EH
	CALL	imprime_ecra
	MOV	R3, 68H
	CALL	imprime_ecra
	MOV	R3, 6FH
	CALL	imprime_ecra
	MOV	R3, 75H
	CALL	imprime_ecra
	MOV	R3, 21H
	CALL	imprime_ecra
	MOV	R3, 20H
	CALL	imprime_ecra
	MOV	R3, 41H
	CALL	imprime_ecra
	MOV	R3, 20H
	CALL	imprime_ecra
	MOV	R3, 73H
	CALL	imprime_ecra
	MOV	R3, 75H
	CALL	imprime_ecra
	MOV	R3, 61H
	CALL	imprime_ecra
	MOV	R3, 20H
	CALL	imprime_ecra
	MOV	R3, 70H
	CALL	imprime_ecra
	MOV	R3, 6FH
	CALL	imprime_ecra
	MOV	R3, 6EH
	CALL	imprime_ecra
	MOV	R3, 74H
	CALL	imprime_ecra
	MOV	R3, 75H
	CALL	imprime_ecra
	MOV	R3, 61H
	CALL	imprime_ecra
	MOV	R3, 0E7H
	CALL	imprime_ecra
	MOV	R3, 0E3H
	CALL	imprime_ecra
	MOV	R3, 6FH
	CALL	imprime_ecra
	MOV	R3, 20H
	CALL	imprime_ecra
	MOV	R3, 0E9H
	CALL	imprime_ecra
	MOV	R3, 3AH
	CALL	imprime_ecra
	MOV	R3, 20H
	CALL	imprime_ecra

	MOV	R0, BALAS
	MOVB	R3, [R0]
	SHR	R3, 4
	MOV	R5, 30H
	ADD	R3, R5
	CALL	imprime_ecra
	MOV	R4, 0FH
	MOVB	R3, [R0]
	AND	R3, R4
	ADD	R3, R5
	CALL	imprime_ecra
	MOV	R3, 0AH
	CALL	imprime_ecra

fim:	MOV	R0, OFF
	MOV	R1, PAT1
	MOVB	[R1], R0
	MOV	R1, PAT2
	MOVB	[R1], R0
	MOV	R1, PAT3
	MOVB	[R1], R0
	MOV	R1, BAL
	MOVB	[R1], R0
	MOV	R1, DIFIC
	MOVB	[R1], R0
	JMP	hiscores


	
hiscores: JMP	inicio


; ********************** MOVIMENTO PATOS **************************



P1:		MOV	R0, 1
		MOV	R5, CLOCK
		MOVB	R6, [R5]
		CMP	R6, ON		;
		JNE	sai_P1


		
		

		MOV	R10, DELAY2
		MOVB	R2, [R10]
		MOV	R10, DELAY
		MOVB	R1, [R10]
		CMP	R1, R2
		JEQ	cont_P1
		ADD	R1, 1
		MOVB	[R10], R1
		MOV	R0, 1
		JMP	fim_patos


cont_P1:	MOV	R1, 0
		MOVB	[R10], R1
		MOV	R0, DIFIC
		MOVB	R1, [R10]
		CMP	R1, 1
		JEQ	so_um
		CMP	R1, 2
		JEQ	so_dois
		CALL	pato3
so_dois:	CALL	pato2
so_um:		CALL	pato1
		JMP	fim_patos



pato1:		PUSH	R0
		PUSH	R1
		PUSH	R2
		PUSH	R3
		MOV	R2, PAT1
		MOVB	R1, [R2]
		CMP	R1, OFF
		JEQ	sai_pato
		MOV	R2, PAT1X
		MOV	R3, PAT1Y
		MOVB	R0, [R2]
		MOVB	R1, [R3]		
		CALL	apaga
		ADD	R0, 1
		CALL	salto
		CALL	pato
		MOVB	[R2], R0
		MOVB	[R3], R1
sai_pato:	POP	R3
		POP	R2
		POP	R1
		POP	R0
		RET

pato2:		PUSH	R0
		PUSH	R1
		PUSH	R2
		PUSH	R3
		MOV	R2, PAT2
		MOVB	R1, [R2]
		CMP	R1, OFF
		JEQ	sai_pato
		MOV	R2, PAT2X
		MOV	R3, PAT2Y
		MOVB	R0, [R2]
		MOVB	R1, [R3]		
		CALL	apaga		
		ADD	R0, 1
		CALL	salto
		CALL	pato
		MOVB	[R2], R0
		MOVB	[R3], R1
		POP	R3
		POP	R2
		POP	R1
		POP	R0
		RET

pato3:		PUSH	R0
		PUSH	R1
		PUSH	R2
		PUSH	R3
		MOV	R2, PAT3
		MOVB	R1, [R2]
		CMP	R1, OFF
		JEQ	sai_pato
		MOV	R2, PAT3X
		MOV	R3, PAT3Y
		MOVB	R0, [R2]
		MOVB	R1, [R3]		
		CALL	apaga		
		ADD	R0, 1
		CALL	salto
		CALL	pato
		MOVB	[R2], R0
		MOVB	[R3], R1
		POP	R3
		POP	R2
		POP	R1
		POP	R0
		RET



fim_patos:	MOV	R0, BAL
		MOVB	R1, [R0]
		CMP	R1, 0
		JEQ	sai_P1
		CALL	mata_patos
		CALL 	bala
sai_P1:		CALL	mata_patos
		MOV	R5, CLOCK
		MOV	R6, OFF
		MOVB	[R5], R6
		RET 	



rot0:   MOV R5, ON			; activa movimento
	MOV R6, CLOCK
	MOVB [R6], R5
	RFE





;:::::::::::::::::::::::BALA:::::::::::::::::::::::::

bala:		PUSH	R0
		PUSH	R1
		PUSH	R2
		PUSH	R4
		PUSH	R5
		PUSH	R6
		PUSH	R7
		PUSH	R8
		PUSH	R9
		PUSH	R10 			; auxiliar
		MOV	R9, OFF			; estamos no estado: apagar bala
		MOV	R4, BALX
		MOV	R5, BALY
		MOV	R6, BAL
				
		MOVB	R0, [R4]		; coordenada x da bala guardada em R0
		MOVB	R1, [R5]		; coordenada y da bala guardada em R1
		MOVB	R2, [R6]		; estado actual da bala
		
		CMP	R2, OFF
		JEQ	naobala			; se está OFF não há nenhuma bala em jogo, sai-se da rotina
		
		CALL	mapeamento			; apagar bala

		

		MOV	R9, ON			; estamos no estado: escrever bala
		CMP 	R1, OFF
		JNE 	contBala		; se com mais um movimento da bala esta sair de jogo, sai-se da rotina, caso contrário, continua-se
		MOVB 	[R6], R1		; actualiza-se o endereço do estado da bala com OFF visto que esta saiu de jogo
		JMP 	naobala
		
contBala:	SUB	R1, 1			; a bala vai mover-se 1 pixel para cima independentemente de ir na diagonal ou a direito
		CMP	R2, CEN			; verifica direcçao
		JEQ	balaCen
	
		CMP	R2, ESQ
		JNE	balaDir

balaEsq:	SUB	R0, 1
		CMP 	R0, 0			; verifica se bateu na parede esquerda
		JGE 	balEsq			;
		MOV 	R2, DIR			; se bateu, inverte o sentido
		ADD	R0, 1
		MOVB 	[R6], R2
		JMP 	balaDir
balEsq:		CALL	mapeamento			; se não bateu, continua o seu percurso
		JMP	saibala			; sai da rotina bala


balaDir:	ADD	R0, 1			
		MOV 	R10, 32		
		CMP 	R0, R10			; verifica se bateu na parede direita
		JNE 	balDir
		MOV	R2, ESQ			; se bateu, inverte o sentido
		MOVB 	[R6], R2
		SUB	R0, 1
		JMP 	balaEsq
balDir:		CALL 	mapeamento			; se nao bateu, continua o seu percurso
		JMP	saibala			; sai da rotina bala
	
balaCen:	CALL 	mapeamento	

saibala:	MOVB [R4] , R0
		MOVB [R5] , R1
		
naobala:	POP 	R10
		POP	R9
		POP	R8
		POP	R7
		POP	R6
		POP 	R5
		POP 	R4
		POP 	R2
		POP	R1
		POP	R0
		RET	



;:::::::::::::::::DESENHA ARMAS:::::::::::::::::::::::

arm:	PUSH	R0			; guarda todos os registos que serão usados em pilha, para não perdermos o seu valor
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH	R7
	PUSH	R8
	PUSH	R9
	PUSH	R10

	
	MOV	R8, ARMA		; copia para um registo a informação acerca da nova
	MOVB	R10, [R8]		; direcçao que se encontra em memoria

	MOV	R2, ARMA2		
	MOVB	R3, [R2]
	CMP	R10, R3			; compara com a anterior (guardada em ARMA2)
	JEQ	saiArm			; se forem iguais, nao é preciso desenhar nova arma
	
	MOV	R7, 0000h
	MOV	R9, 807Dh
	MOVB	[R9], R7
	MOV	R9, 807Ah			;
	MOVB	[R9], R7			;
	MOV	R9, 8079h			; apaga arma actual
	MOVB	[R9], R7			;
	MOV	R9, 8076h			;
	MOVB	[R9], R7
	MOV	R9, 8075h
	MOVB	[R9], R7


	MOV	R9, ON			; activa escrita
	CMP	R10, CEN		; verifica direcçao
	JNE	armEsq

armCen:	MOV	R0, 15			; escreve nova arma ao centro
	MOV	R1, 31
	CALL 	mapeamento
	SUB	R1, 1
	CALL 	mapeamento
	SUB	R1, 1
	CALL	mapeamento

	MOV	R3, CEN
	MOVB	[R2], R3		; actualiza ARMA2 com a posição nova da arma	
	JMP	saiArm
	
armEsq:	CMP	R10, ESQ		; verifica direcçao
	JNE	armDir
				
	MOV	R0, 15			; escreve nova arma à esquerda
	MOV	R1, 31
	CALL 	mapeamento
	SUB	R0, 1
	SUB	R1, 1
	CALL	mapeamento
	SUB	R0, 1
	SUB	R1, 1
	CALL	mapeamento

	MOV	R3, ESQ
	MOVB	[R2], R3		; actualiza ARMA2 com a posição nova da arma
	JMP	saiArm


armDir:	MOV	R0, 15			; escreve nova arma à direita
	MOV	R1, 31
	CALL 	mapeamento
	ADD	R0, 1
	SUB	R1, 1
	CALL	mapeamento
	ADD	R0, 1
	SUB	R1, 1

	MOV	R3, DIR
	MOVB	[R2], R3		; actualiza ARMA2 com a posição nova da arma
	CALL	mapeamento




saiArm:	POP	R10
	POP	R9
	POP	R8
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP 	R2
	POP	R1
	POP	R0	
	RET


;******************* MATA PATOS ***********************
mata_patos:
	PUSH	R0
	PUSH	R1
	PUSH	R3
	PUSH	R4
	PUSH	R5
	PUSH	R6
	PUSH	R7
	PUSH	R8
	PUSH	R9

	MOV	R0, BAL
	MOVB	R1, [R0]
	CMP	R1, 0
	JEQ	sai_mata
	MOV	R0, BALX
	MOVB	R2, [R0]
	MOV	R0, BALY		
	MOVB	R3, [R0]

	

	

	

	MOV	R0, DIFIC
	MOVB	R7, [R0]
	
	CMP	R7, 1		; vê o nivel escolhido
	JEQ	mata1
	CMP	R7, 2
	JEQ	mata2


mata3:	MOV	R8, PAT3
	MOVB	R1, [R8]
	CMP	R1, OFF		; se o pato3 ainda estiver em campo (ON), vamos ver se vai ser morto
	JEQ	mata2
	MOV	R0, PAT3X
	MOVB	R4, [R0]
	MOV	R0, PAT3Y	
	MOVB	R5, [R0]
	MOV	R1, 8018H
	MOV	R6, 8023H
	CALL	comp

mata2:	MOV	R8, PAT2
	MOVB	R1, [R8]
	CMP	R1, OFF		; se o pato2 ainda estiver em campo (ON), vamos ver se vai ser morto
	JEQ	mata1
	MOV	R0, PAT2X
	MOVB	R4, [R0]
	MOV	R0, PAT2Y	
	MOVB	R5, [R0]
	MOV	R1, 800CH
	MOV	R6, 8017H
	CALL	comp

mata1:	MOV	R8, PAT1
	MOVB	R1, [R8]
	CMP	R1, OFF		; se o pato1 ainda estiver em campo (ON), vamos ver se vai ser morto
	JEQ	sai_mata	
	MOV	R0, PAT1X
	MOVB	R4, [R0]
	MOV	R0, PAT1Y	
	MOVB	R5, [R0]
	MOV	R1, 8000H
	MOV	R6, 800BH
	CALL	comp
	JMP	sai_mata


comp:				; Iniciamos a fase das comparaçoes
	CMP	R3, R5		; Aqui vamos ver se o Y da bala é igual ao Y do corpo do pato1 
	JEQ	ve_corpo	; se for, vamos ver se os X's do corpo coincidem com o X da bala

	SUB	R3, 1
	CMP	R3, R5		; Aqui vamos ver se o Y da bala é igual ao Y do cabeça do pato1
	JEQ	ve_cabe		; se for, vamos ver se o X da cabeça coincide com o X da bala
		
	RET			; se tambem não for, nao é preciso fazer nada. saimos.

		
ve_corpo:
	CMP	R2, R4
	JEQ	mor_ini		; 
				;
	ADD	R4, 1		; Aqui vamos ver se o X da bala é igual aos X's do corpo do pato1 
	CMP	R2, R4		;
	JEQ	mor_ini		; se coincidirem, o pato morre
				;
	ADD	R4, 1 		;
	CMP	R2, R4
	JEQ	mor_ini	
	RET

ve_cabe:
	SUB	R3, 1
	ADD	R4, 2		; Aqui vamos ver se o X da bala é igual ao X da cabeça do pato1 
	CMP	R2, R4
	JNE	n_cabe
	CMP	R1, R3
	JNE	n_cabe
	JMP	mor_ini		; se coincidirem, o pato morre
n_cabe:	RET	


mor_ini:
	MOV	R0, 0000h
mor_int:
	MOVB	[R1], R0
	ADD	R1, 1h
	CMP	R1, R6
	JLE	mor_int
	JMP	morreu

			
morreu:	
	MOV 	R1, OFF		
	MOVB	[R8], R1	; morreu! "desligamos" o pato.
	MOV	R0, BAL
	MOVB	[R0], R1	; desligamos a bala tambem

	RET

sai_mata:
	POP	R9
	POP	R8
	POP	R7
	POP	R6
	POP	R5
	POP	R4
	POP	R3
	POP	R1
	POP	R0
	RET	

;:::::::::::VERIFICA PATOS::::::::::::::::::::

; Verifica se todos os patos já morreram

ver_patos:
	MOV	R0, ON
	PUSH	R1
	PUSH	R2
	PUSH	R3
	PUSH	R4
	PUSH	R5
	MOV	R1, DIFIC
	MOVB	R5, [R1]
	CMP	R5, 1
	JEQ	ver_1
	CMP	R5, 2
	JEQ	ver_2
ver_3:	MOV	R1, PAT3
	MOVB	R2, [R1]
	CMP	R2, 1
	JEQ	fim_ver
ver_2:	MOV	R1, PAT2
	MOVB	R2, [R1]
	CMP	R2, 1
	JEQ	fim_ver
ver_1:	MOV	R1, PAT1
	MOVB	R2, [R1]
	CMP	R2, 1
	JEQ	fim_ver
	MOV	R0, OFF
fim_ver:POP	R5
	POP	R4
	POP	R3
	POP	R2
	POP	R1
	RET


;:::::::::::::::::SALTO PATO::::::::::::::::::::::::::

salto:	PUSH 	R10			; guarda R1 na pilha
	MOV 	R10, 30			
	CMP	R0, R10			
	JNE	n_salt			; se não forem iguais, sai sem fazer nada
	MOV	R0, 0			; se forem iguais, coloca o pato no começo da linha
n_salt:	POP 	R10
	RET



;:::::::::::::::::APAGA PATO::::::::::::::::::::::::

apaga:	PUSH	R0
	PUSH	R1
	PUSH	R9
	MOV	R9, OFF
	CALL	mapeamento			;apagar pixel em R0,R1
	ADD	R0, 1			
	CALL	mapeamento			;apagar pixel em R0+1,R1
	ADD	R0, 1			
	CALL	mapeamento			;apagar pixel em R0+2,R1
	SUB 	R1, 1
	CALL	mapeamento			;apagar pixel em R0+2,R1-1
	POP	R9
	POP	R1
	POP	R0
	RET	


;:::::::::::::::::DESENHA PATO::::::::::::::::::::::::

					
pato:	PUSH	R0
	PUSH	R1
	PUSH	R9
	MOV	R9, ON
	CALL	mapeamento			;desenhar pixel em R0,R1
	ADD	R0, 1			
	CALL	mapeamento			;desenhar pixel em R0+1,R1
	ADD	R0, 1			
	CALL	mapeamento			;desenhar pixel em R0+2,R1
	SUB 	R1, 1
	CALL	mapeamento			;desenhar pixel em R0+2,R1-1
	POP	R9
	POP	R1
	POP	R0
	RET	



;::::::::::::::::::::::::::::::::::::::::::MAPEAMENTO::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
														;
														;
mapeamento:													;
														;
														;
;:::::::::::::::ESCREVER EIXO Y::::::::::::::::::::::::								;
														;
eixoY:	PUSH	R2												;
	PUSH	R3												;
	PUSH	R4												;
	PUSH	R5												;
	PUSH	R6												;
	PUSH	R7												;
	MOV	R2, SCREEN		; endereço de memoria do pixelscreen					;
	MOV	R3, R1			; 									;
cicloY:	CMP	R3, 0												;
	JEQ	eixoX			; devolve R2								;
	SUB	R3, 1												;
	ADD	R2, 4H												;
	JMP	cicloY												;
														;
														;
;:::::::::::::ESCREVER EIXO X:::::::::::::::::::::::::::							;
														;
eixoX:														;
	MOV	R3, R0			;									;
	MOV	R4, 8												;
														;
	DIV	R3, R4			; divisao inteira da abcissa por 8					;
	ADD	R2, R3												;
					;									;
	MOV	R3, R0												;
	MOD	R3, R4												;
														;
	MOV	R5, 0080H											;
	MOV	R6, 0000H											;
														;
cicloX:	CMP	R3, R6												;
	JZ	verifica		; devolve R5								;
	SHR	R5, 1												;
	SUB	R3, 1												;
	JMP	cicloX												;
														;
														;
;::::::::::LIGA OU DESLIGA PIXEL?::::::::::::::::::::::::							;
														;
verifica:	CMP	R9, ON		; verifica se quer escrever ou apagar pixel				;
		JNE	clean											;
														;
escrever:	MOVB	R7, [R2]										;
		ADD	R5, R7		 									;
		MOVB	[R2], R5										;
		JMP	sai_pixel										;
														;
clean:		MOVB	R7, [R2]										;
		SUB	R7, R5											;
		MOVB	[R2], R7										;
sai_pixel:	POP R7												;
		POP R6												;
		POP R5												;
		POP R4												;
		POP R3												;
		POP R2												;
		RET												;
														;
;::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::






; ********************** LEITURA TECLADO **************************



rot1:	PUSH 	R2
	PUSH 	R3
	PUSH 	R4
	PUSH	R5
	MOV 	R4, ARMA
	CALL	IN_CHAR
	
	CMP	R2, 1
	JNE	fim3

	MOV	R5, 61h
	CMP	R3, R5 		; Aponta para a esquerda (se for premido 'a' no teclado)
	JNE	rot1_b
	MOV	R5, ESQ
	MOVB 	[R4], R5
	CALL	arm
	JMP 	fim3

rot1_b:	MOV	R5, 73h
	CMP	R3, R5		; Aponta para o centro (se for premido 's' no teclado)
	JNE	rot1_c
	MOV	R5, CEN
	MOVB	[R4], R5
	CALL	arm
	JMP	fim3

rot1_c: MOV	R5, 64h
	CMP	R3, R5		; Aponta para a direita (se for premido 'd' no teclado)
	JNE	rot1_d
	MOV	R5, DIR
	MOVB	[R4], R5
	CALL	arm
	JMP	fim3

rot1_d:	MOV	R5, 20h
	CMP	R3, R5		; Se for premida a barra de espaços vai ser verificado 
	JNE	rot1_g		; se existe alguma bala em campo, se não existir vai criá-la
	CMP	R0, 0
	JEQ	fim3
	MOV	R4, BAL
	MOVB	R3, [R4]
	CMP 	R3, OFF
	JNE 	fim3
	MOV	R4, ARMA
	MOVB	R5, [R4]
	CMP	R5, ESQ
	JEQ	rot1_e
	CMP	R5, CEN
	JEQ	rot1_f

	MOV	R3, BALX	; Dispara para a direita
	MOV	R4, 18
	MOVB	[R3], R4
	MOV	R3, BALY
	MOV	R4, 28
	MOVB	[R3], R4
	MOV	R3, BAL
	MOV	R4, DIR
	MOVB	[R3], R4
	PUSH	R0		;
	PUSH	R1		;
	PUSH	R9		;
	MOV	R9, ON
	MOV	R0, 18		;
	MOV	R1, 28		; Desenha a bala a primeira vez
	CALL	mapeamento		;
	CALL 	disparou
	POP	R9		;
	POP	R1		;
	POP	R0		;
	JMP	fim3


rot1_e:	MOV	R3, BALX	; Dispara para a esquerda
	MOV	R4, 12
	MOVB	[R3], R4
	MOV	R3, BALY
	MOV	R4, 28
	MOVB	[R3], R4
	MOV	R3, BAL
	MOV	R4, ESQ
	MOVB	[R3], R4
	PUSH	R0		;
	PUSH	R1		;
	PUSH	R9		;
	MOV	R9, ON		;
	MOV	R0, 12		;
	MOV	R1, 28		; Desenha a bala a primeira vez
	CALL	mapeamento		;
	CALL 	disparou
	POP	R9
	POP	R1		;
	POP	R0		;
	JMP	fim3	


rot1_f:	MOV	R3, BALX	; Dispara em frente
	MOV	R4, 15
	MOVB	[R3], R4
	MOV	R3, BALY
	MOV	R4, 28
	MOVB	[R3], R4
	MOV	R3, BAL
	MOV	R4, CEN
	MOVB	[R3], R4
	PUSH	R0		;
	PUSH	R1		;
	PUSH	R9		;
	MOV	R9, ON
	MOV	R0, 15		;
	MOV	R1, 28		; Desenha a bala a primeira vez
	CALL	mapeamento		;
	CALL 	disparou
	POP	R9
	POP	R1		;
	POP	R0		;
	JMP	fim3


	
rot1_g: MOV	R5, 70h
	CMP	R3, R5
	JNE	fim3
pause:	CALL	IN_CHAR
	
	CMP	R2, 1
	JNE	pause
	MOV	R5, 70h
	CMP     R3, R5
	JNE	pause
	JMP	fim3

fim3:	POP	R5
	POP	R4
	POP 	R3
	POP 	R2
	RFE	



;::::::::::::::::::::::::: MUARTS :::::::::::::::::::::::::::::::::

;****************************************************************
;* ini_MUART - Inicializa a MUART-1
;* Parâmetros de entrada - Nenhum
;* Valores de saída - Nenhum
;****************************************************************

ini_MUART:	PUSH	R0
		PUSH	R1
		MOV	R0, M1_RCU	; prepara acesso RCU
		MOV	R1, 00H
		MOVB	[R0], R1	; programa factor de multiplic. de 16
		POP	R1
		POP	R0
		RET

;****************************************************************
;* IN_CHAR - Verifica se chegou um caracter do canal 1 da MUART-1
;            e devolve o seu valor, se for o caso
;* Parâmetros de entrada - Nenhum
;* Valores de saída - R2 - 1 se tiver chegado um caracter novo, 0 em caso contrário
;*                    R3 - caracter lido (se tiver chegado)
;****************************************************************

IN_CHAR:	PUSH	R0
		PUSH	R1
		MOV	R0, M1_REP	; registo de estado da MUART-1
		MOVB	R1, [R0]	; lê estado
		BIT	R1, 0		; este bit será 1 se tiver chegado um novo caracter
		JZ	no_char
		MOV	R0, M1_RD1	; registo de dados (canal 1)
		MOVB	R3, [R0]	; caracter que chegou
		MOV	R2, 1		; chegou caracter
		JMP	ret_in_char
no_char:	MOV	R2, 0		; não há nenhum caracter novo
ret_in_char:	POP	R1		; sai, repondo os registos usados
		POP	R0
		RET


;****************************************************************
;* OUT_CHAR - Tenta enviar um caracter do canal 2 da MUART-1, mas só
;             se esta estiver pronta a enviar
;* Parâmetros de entrada - R3 - caracter a enviar
;* Valores de saída - R2 - 1 se tiver conseguido o caracter, 0 em caso contrário
;*                    
;****************************************************************

OUT_CHAR:	PUSH	R0
		PUSH	R1
		MOV	R0, M1_REP	; registo de estado da MUART-1
		MOVB	R1, [R0]	; lê estado
		BIT	R1, 5		; este bit será 1 se o canal 2 estiver pronto a enviar
		JZ	not_ok
		MOV	R0, M1_RD2	; registo de dados (canal 2)
		MOVB	[R0], R3 	; envia o caracter
		MOV	R2, 1		; conseguiu enviar o caracter
		JMP	ret_out_char	; sai
not_ok:		MOV	R2, 0		; não conseguiu enviar o caracter
ret_out_char:	POP	R1		; sai, repondo os registos usados
		POP	R0
		RET



imprime_ecra:	PUSH	R2
		MOV	R2, 0
repete_imp:	CALL	OUT_CHAR
		CMP	R2, 0
		JEQ	repete_imp
		POP	R2
		RET

disparou:	PUSH 	R0
		PUSH	R1
		PUSH	R2
		PUSH	R3
		MOV	R0, BALAS
		MOVB	R1, [R0]
		MOV	R2, R1
		MOV	R3, 0FH
		AND	R1, R3		; em R1 estão agora os 4 bits do display hexa das unidades (do número de balas)
		MOV	R3, 0F0H	
		AND	R2, R3		; em R2 estão agora os 4 bits do display hexa das dezenas (do número de balas)
		CMP	R1, 0		; se tiver 0 nas unidades vai decrementar 1
		JNE	disp_1		
		MOV	R1, 09H	
		MOV	R3, 10H	
		SUB	R2, R3
		ADD	R1, R2
		MOVB	[R0], R1
		MOV	R0, POUT_1
		MOVB	[R0], R1
		JMP	sai_disp
disp_1:		SUB	R1, 1
		ADD	R1, R2
		MOVB	[R0], R1
		MOV	R0, POUT_1
		MOVB	[R0], R1
sai_disp:	POP	R3
		POP	R2
		POP	R1
		POP	R0
		RET