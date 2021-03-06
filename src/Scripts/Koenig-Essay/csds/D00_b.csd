<CsoundSynthesizer>

; Id: D00_b.CSD mg (2006, rev.2009)
; author: marco gasperini (marcogsp at yahoo dot it)

; G.M. Koenig
; ESSAY (1957)

<CsOptions>
-W -f -oD00_b.wav
</CsOptions>

<CsInstruments>

sr     = 192000
kr     = 192000
ksmps  = 1
nchnls = 1

;=============================================
; SINUS TONES (S)
;=============================================
	instr 1	
iamp	= ampdb(90+p4)
ifreq	= p5

a1	oscili iamp , ifreq , 1
aenv	expseg .001 , .005, 1 , p3-.01 ,1, .005,.001

aout	= a1 * aenv

	out aout
	endin
;=============================================

;=============================================
; FILTERED NOISE (N)
;=============================================
	instr 2
iamp	= ampdb(89+p4)
ifreq	= p5
ibw	= ifreq * .05		; filtered noise's bandwidth 5% of central frequency

a1	rnd31 iamp , 1 
k1	rms a1*.9

afilt	butterbp a1 , ifreq , ibw
afilt	butterbp afilt , ifreq , ibw

aenv	expseg .001 , .005, .8 , p3-.01 ,.8 ,.005,.001

aout	gain afilt , k1
aout	= aout * aenv 

	out aout
	endin
;=============================================

;=============================================
; FILTERED IMPULSES (I)
;=============================================
	instr 3
iamp	= ampdb(86+p4)
ifreq	= p5
ibw	= ifreq * .01		; filtered pulse's bandwidth 1% of central frequency

if1	= ifreq-(ibw/3)
if2	= ifreq+((2*ibw)/3)

				
a1	mpulse iamp , 0 

afilt	atonex a1 , if1 , 2
afilt	tonex afilt*400 , if2 , 2  
afilt	butterbp afilt*900 , ifreq , ibw*.05


aenv	linseg 1 , p3-.01, 1 , .01 , 0

aout	= afilt * aenv 

	out aout*(sr/192000)
	endin
;=============================================

</CsInstruments>
<CsScore>
;functions--------------------------------------------------
f1	0	8192	10	1	; sinusoid
;/functions--------------------------------------------------

t0	4572	; 76.2 cm/sec. tape speed (durations in cm)

;test--------------------------------------------------
;mute-------------------------------------------------
q 1 0 1
q 2 0 1
q 3 0 1
;/mute-------------------------------------------------
;/test-------------------------------------------------

;==================================================
; 140. MATERIAL D
; 141. total length: 865.7 cm, 9 sections
;
; sequence b
;
; length    sequence 	
; 26  	 cm (3)
; 87.7 	 cm (6)
; 131.7	 cm (7)
; 17.3 	 cm (2)
; 11.6 	 cm (1)
; 58.5 	 cm (5)
; 296.3	 cm (9)
; 39 	 cm (4)
; 197.5	 cm (2)

;==================================================

;************************************************** b1
;==================================140.21
; 26 cm 10/9
;----------------------------------------
;			p4	p5
;			iamp	ifreq	timbre
;			[dB]	[Hz]	
i2	0	3.3 	-4	800	; R	
i2	+	2.4	-4	741     ; R
i2	+	3	-4	785     ; R
i2	+	4.6	-4	686     ; R
i3	13.3	2.2	0	727     ; I
i2	15.5	2.7	-4	635     ; R
i2	+	3.7	-4	770     ; R
i2	+	4.1	-4	673	; R
s                                   
t0	4572
;==================================140.22
; 87.7 cm 7/6
;----------------------------------------
i2	0	8.2	-4	588	; I
i2	+	17.7	-4	713     ; I
i3	25.9	7	1.5	623	; R
i3	+	13	-.5	755     ; R
i2	45.9	15.2	-4	544     ; I
i2	+	6	-4	660     ; I
i2	+	9.5	-4	577     ; I
i3	76.6	11.1	.5	699     ; R
s                                   
t0	4572
;==================================140.23
; 131.7 cm 6/5
;----------------------------------------
i3	0	28.6	3	504	; I
i3	+	16.5	1.5	611     ; I
i3	+	23.8	3	534     ; I
i3	+	11.5	1	647     ; I
i1	80.4	13.8	-1	467     ; S
i3	94.2	19.9	2	566	; I
i3	+	8	3.5	494     ; I
i3	+	9.6	2	599     ; I
s                                   
t0	4572
;==================================140.24
; 17.3 cm 11/10
;----------------------------------------
i1	0	1.7	0	432	; S
i1	+	2.7	0	524     ; S
i3	4.4	1.5	4	458     ; I
i3	+	2.2	2.5	555     ; I
i1	8.1	2.4	0	485	; S	
i1	+	3	0	424     ; S
i1	+	1.8	0	514     ; S
i3	15.3	2	4	449     ; I
s                                   
t0	4572
;==================================140.25
; 11.6 cm 12/11
;----------------------------------------
i1	0	1.6	0	476	; S
i1	+	1.3	0	416     ; S
i1	+	1.5	0	440     ; S
i1	+	1	0	408     ; S
;************************************************** b2
i2	5.4	1.1	-4	400	; R
i2	+	1.4	-4	432     ; R
i2	+	1.8	-4	408     ; R
i2	+	1.9	-4	467     ; R
s                                   
t0	4572
;==================================140.26
; 58.5 cm 8/7
;----------------------------------------
i2	0	9.8	-4	440	; R
i2	+	6.5	-4	504     ; R
i2	+	8.5	-4	416     ; R
i2	+	5	-4	476     ; R
i1	29.8	5.7	-2	544     ; S
i1	+	7.5	-2	449     ; S
i1	+	11.1	-2	514     ; S
i1	+	4.4	-2	424     ; S
s                                   
t0	4572
;==================================140.27
; 296.3 cm 4/3
;----------------------------------------
i1	0	11	-2	588	; S
i2	11	46.3	-4	485     ; R
i2	+	82.3	-4	555     ; R
i2	+	26.1	-4	458     ; R
i1	165.7	34.7	-2	635     ; S
i1	+	61.7	-2	524     ; S
i1	+	14.7	-2	599     ; S
i1	+	19.5	-2	494     ; S
s                                   
t0	4572
;==================================140.28
; 39 cm 9/8
;----------------------------------------
i2	0	4.4	-4	686	; R
i2	+	3.1	-4	566     ; R
i2	+	4	-4	647     ; R
i2	+	6.3	-4	534     ; R
i2	+	7.1	-4	741     ; R
i2	+	3.5	-4	611     ; R
i1	28.4	5	-2	699     ; S
i1	+	5.6	-2	577     ; S
s                                   
t0	4572
;==================================140.29
; 197.5 cm 5/4
;----------------------------------------
i2	0	24.3	-3	660	; R
i1	24.3	12.4	-2	755     ; S
i1	+	19.4	-2	623     ; S
i1	+	47.5	-2	713     ; S
i1	+	9.9	-2	673     ; S
i1	+	15.6	-2	770     ; S
i1	+	30.4	-2	727     ; S
i1	+	38	-2	785     ; S
                                    
; total length: 865.7 cm
e
</CsScore>
</CsoundSynthesizer>