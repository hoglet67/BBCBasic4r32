; Enable 65C02 opcodes
CPU           1

L0000   = $0000
L0001   = $0001
L0002   = $0002
L0003   = $0003
L0004   = $0004
L0005   = $0005
L0006   = $0006
L0007   = $0007
L0008   = $0008
L0009   = $0009
L000A   = $000A
L000B   = $000B
L000C   = $000C
L000D   = $000D
L000E   = $000E
L000F   = $000F
L0010   = $0010
L0011   = $0011
L0012   = $0012
L0013   = $0013
L0014   = $0014
L0015   = $0015
L0016   = $0016
L0017   = $0017
L0018   = $0018
L0019   = $0019
L001A   = $001A
L001B   = $001B
L001C   = $001C
L001D   = $001D
L001E   = $001E
L001F   = $001F
L0020   = $0020
L0021   = $0021
L0022   = $0022
L0023   = $0023
L0024   = $0024
L0025   = $0025
L0026   = $0026
L0027   = $0027
L0028   = $0028
L0029   = $0029
L002A   = $002A
L002B   = $002B
L002C   = $002C
L002D   = $002D
L002E   = $002E
L002F   = $002F
L0030   = $0030
L0031   = $0031
L0032   = $0032
L0033   = $0033
L0034   = $0034
L0035   = $0035
L0036   = $0036
L0037   = $0037
L0038   = $0038
L0039   = $0039
L003A   = $003A
L003B   = $003B
L003C   = $003C
L003D   = $003D
L003E   = $003E
L003F   = $003F
L0040   = $0040
L0041   = $0041
L0042   = $0042
L0043   = $0043
L0044   = $0044
L0045   = $0045
L0046   = $0046
L0047   = $0047
L0048   = $0048
L0049   = $0049
L004A   = $004A
L004B   = $004B
L004C   = $004C
L004D   = $004D
L004E   = $004E
L00F2   = $00F2
L00F4   = $00F4
L00FD   = $00FD
L00FE   = $00FE
L00FF   = $00FF
L0100   = $0100
L0106   = $0106
L01FF   = $01FF
L0202   = $0202
L0203   = $0203
L020E   = $020E
L0400   = $0400
L0401   = $0401
L0402   = $0402
L0403   = $0403
L0404   = $0404
L040C   = $040C
L043C   = $043C
L043D   = $043D
L0440   = $0440
L0441   = $0441
L0460   = $0460
L0464   = $0464
L046C   = $046C
L047F   = $047F
L04FF   = $04FF
L0500   = $0500
L0513   = $0513
L0514   = $0514
L0519   = $0519
L051A   = $051A
L051B   = $051B
L051C   = $051C
L051D   = $051D
L051E   = $051E
L051F   = $051F
L0521   = $0521
L0522   = $0522
L0523   = $0523
L0524   = $0524
L0526   = $0526
L0527   = $0527
L0528   = $0528
L0529   = $0529
L052A   = $052A
L05CB   = $05CB
L05CC   = $05CC
L05E5   = $05E5
L05E6   = $05E6
L05FF   = $05FF
L0600   = $0600
L0700   = $0700
L07EF   = $07EF
L7F0E   = $7F0E
L7F13   = $7F13
LFFCE   = $FFCE
LFFD4   = $FFD4
LFFD7   = $FFD7
LFFDA   = $FFDA
LFFDD   = $FFDD
LFFE0   = $FFE0
LFFE3   = $FFE3
LFFE7   = $FFE7
LFFEE   = $FFEE
LFFF1   = $FFF1
LFFF4   = $FFF4
LFFF7   = $FFF7

        org     $8000
.BeebDisStartAddr
        JMP     L80E7

        JMP     L802C

        EQUB    $E2,$13,$07

        EQUS    "BASIC",$00

        EQUS    "4r32",$00

        EQUS    "(C)1988 Acorn",$0A,$0D,$00

        EQUW    $B800,$8028,$C000,$0082

.L802C
        PHA
        TAX
        TYA
        PHA
        CPX     #$09
        BEQ     L804C

        CPX     #$04
        BEQ     L8070

        CPX     #$02
        BEQ     L8040

        CPX     #$27
        BNE     L806A

.L8040
        LDA     #$BB
        LDX     L00F4
        LDY     #$00
        JSR     LFFF4

        JMP     L806A

.L804C
        LDA     (L00F2),Y
        CMP     #$0D
        BNE     L806A

        JSR     LFFE7

        LDX     #$F6
.L8057
        LDA     L7F13,X
        BNE     L805E

        LDA     #$20
.L805E
        JSR     LFFE3

        INX
        BNE     L8057

        JSR     LFFE7

.L8067
        JSR     L80D8

.L806A
        PLA
        TAY
        LDX     L00F4
        PLA
        RTS

.L8070
        LDA     (L00F2),Y
        AND     #$DF
        CMP     #$48
        BNE     L808F

        INY
        LDA     #$40
        TSB     L00F4
        LDA     (L00F2),Y
        INY
        CMP     #$2E
        BEQ     L80A8

        AND     #$DF
        CMP     #$49
        BEQ     L808F

        JSR     L80D8

        DEY
        DEY
.L808F
        LDX     #$FB
.L8091
        LDA     (L00F2),Y
        CMP     #$2E
        BEQ     L80A8

        AND     #$DF
        CMP     L7F0E,X
        BNE     L8067

        INY
        INX
        BNE     L8091

        LDA     (L00F2),Y
        CMP     #$21
        BCS     L8067

.L80A8
        BIT     L00F4
        BVC     L80CC

        JSR     LBF66

        BNE     L80CC

        JSR     L80D8

        LDX     #$0A
.L80B6
        LDA     L80C2,X
        STA     L0100,X
        DEX
        BPL     L80B6

        JMP     L0100

.L80C2
        BRK
        EQUB    $00

        EQUS    "No TUBE"

        EQUB    $00

.L80CC
        LDA     L00F4
        EOR     #$40
        TAX
        LDA     #$8E
        LDY     #$00
        JMP     LFFF4

.L80D8
        LDA     #$40
        TRB     L00F4
        RTS

.L80DD
        EQUB    $00,$00,$00,$03,$27

.L80E2
        EQUB    $01,$0A,$64,$E8,$10

.L80E7
        AND     L0011
        ORA     L000D
        ORA     L000E
        ORA     L000F
        ORA     L0010
        BNE     L80FF

        LDA     #$41
        STA     L000D
        EOR     #$13
        STA     L000E
        EOR     #$05
        STA     L000F
.L80FF
        LDA     #$84
        JSR     LFFF4

        STX     L0006
        STY     L0007
        DEC     A
        JSR     LFFF4

        STY     L0018
        LDX     #$13
        STX     L00FD
        LDX     #$80
        STX     L00FE
        STZ     L001F
        STZ     L0402
        STZ     L0403
        LDX     #$FF
        STX     L0023
        LDX     #$0A
        STX     L0400
        DEX
        STX     L0401
        LDA     #$B2
        STA     L0202
        LDA     #$B2
        STA     L0203
        CLI
        JMP     L8FF2

.L8139
        STY     L0039
        LDY     #$01
        LDA     (L0037),Y
        LDY     #$F6
        CMP     #$F2
        BEQ     L8151

        LDY     #$F8
        BRA     L8151

.L8149
        STY     L0039
        LDY     #$01
        LDA     (L0037),Y
        ASL     A
        TAY
.L8151
        LDA     L0401,Y
        BEQ     L8190

        STA     L002B
        LDA     L0400,Y
        BRA     L8168

.L815D
        LDY     #$01
        LDA     (L002A),Y
        BEQ     L8190

        TAY
        LDA     (L002A)
        STY     L002B
.L8168
        STA     L002A
        LDY     #$02
        LDA     (L002A),Y
        BNE     L817A

        CPY     L0039
        BNE     L815D

        BRA     L8187

.L8176
        LDA     (L002A),Y
        BEQ     L815D

.L817A
        CMP     (L0037),Y
        BNE     L815D

        INY
        CPY     L0039
        BNE     L8176

        LDA     (L002A),Y
        BNE     L815D

.L8187
        TYA
        ADC     L002A
        STA     L002A
        BCC     L8190

        INC     L002B
.L8190
        RTS

.L8191
        STZ     L003D
        LDA     L0018
        STA     L003E
.L8197
        LDY     #$01
        LDA     (L003D),Y
        CMP     L002B
        BCS     L81AD

.L819F
        LDY     #$03
        LDA     (L003D),Y
        ADC     L003D
        STA     L003D
        BCC     L8197

        INC     L003E
        BRA     L8197

.L81AD
        BNE     L81B9

        INY
        LDA     (L003D),Y
        CMP     L002A
        BCC     L819F

        BNE     L81B9

        RTS

.L81B9
        LDY     #$02
        CLC
        RTS

.L81BD
        JSR     L9783

        LDA     L002D
        PHA
        BPL     L81C8

        JSR     LAD20

.L81C8
        JSR     LA069

        STX     L0027
        JSR     L9783

        PLA
        STA     L0038
        EOR     L002D
        STA     L0037
        JSR     LAD07

        LDX     #$39
        JSR     LBD48

        LDX     #$03
.L81E1
        STZ     L003D,X
        LDA     L002A,X
        BNE     L81FD

        DEX
        BPL     L81E1

.L81EA
        BRK
        EQUB    $12

        EQUS    "Division by zero"

        EQUB    $00

.L81FD
        ROL     A
        TXA
        TAY
        ADC     #$00
        STA     L0042
        LDX     #$03
.L8206
        LDA     L0039,X
        STZ     L003D,X
        BNE     L8230

        DEX
        BPL     L8206

.L820F
        RTS

.L8210
        TYA
        BEQ     L820F

        LDA     L003D,Y
        STA     L003D
        LDA     L003E,Y
        STA     L003E
        LDA     L003F,Y
        STA     L003F
        STZ     L0040
        DEY
        BEQ     L820F

        STZ     L003F
        DEY
        BEQ     L820F

        STZ     L003E
        BRA     L820F

.L8230
        CMP     L002A,Y
        BCS     L823F

.L8235
        LDA     L0039,X
        STA     L003D,Y
        STZ     L0039,X
        DEX
        BMI     L8210

.L823F
        DEY
        BPL     L8235

.L8242
        LDY     #$08
        STX     L0041
.L8246
        ROL     L0039,X
        ROL     L003D
        ROL     L003E
        ROL     L003F
        ROL     L0040
        LDX     L0042
.L8252
        LDA     L003D,X
        CMP     L002A,X
        BNE     L825B

        DEX
        BPL     L8252

.L825B
        BCC     L827C

        LDA     L003D
        SBC     L002A
        STA     L003D
        LDX     L0042
        BEQ     L827C

        LDA     L003E
        SBC     L002B
        STA     L003E
        DEX
        BEQ     L827C

        LDA     L003F
        SBC     L002C
        STA     L003F
        LDA     L0040
        SBC     L002D
        STA     L0040
.L827C
        LDX     L0041
        DEY
        BNE     L8246

        ROL     L0039,X
        DEX
        BPL     L8242

        RTS

.L8287
        JSR     LBD26

.L828A
        JSR     LA3ED

.L828D
        STZ     L0035
        LDA     L002D
        STA     L002E
        BPL     L829A

        JSR     LAD20

        LDA     L002D
.L829A
        BNE     L82C8

        STZ     L0034
        LDY     L002A
        LDA     L002C
        BNE     L82BE

        STZ     L0033
        LDA     L002B
        BEQ     L82D8

        STY     L0032
        LDY     #$90
.L82AE
        ORA     #$00
        BMI     L82FB

.L82B2
        DEY
        ASL     L0034
        ROL     L0033
        ROL     L0032
        ROL     A
        BPL     L82B2

        BRA     L82FB

.L82BE
        STY     L0033
        LDY     L002B
        STY     L0032
        LDY     #$98
        BRA     L82AE

.L82C8
        LDY     L002C
        STY     L0032
        LDY     L002B
        STY     L0033
        LDY     L002A
        STY     L0034
        LDY     #$A0
        BRA     L82AE

.L82D8
        STZ     L0032
        TYA
        BNE     L82F4

.L82DD
        STZ     L0031
        STZ     L002E
        STZ     L0030
        STZ     L002F
        RTS

.L82E6
        STA     L002E
        JSR     LA731

        LDA     L002E
        BEQ     L82DD

        BPL     L82F4

        EOR     #$FF
        INC     A
.L82F4
        LDY     #$89
        LSR     A
.L82F7
        DEY
        ROL     A
        BPL     L82F7

.L82FB
        STY     L0030
        STZ     L002F
        STA     L0031
        RTS

        LDA     L0031
.L8304
        BMI     L8346

.L8306
        BNE     L832F

        ORA     L0032
        ORA     L0033
        ORA     L0034
        ORA     L0035
        BEQ     L82DD

        LDY     L0030
.L8314
        LDA     L0032
        PHA
        LDA     L0033
        STA     L0032
        LDA     L0034
        STA     L0033
        LDA     L0035
        STA     L0034
        STZ     L0035
        TYA
        SEC
        SBC     #$08
        TAY
        PLA
        BEQ     L8314

        BRA     L833B

.L832F
        LDY     L0030
.L8331
        DEY
        ASL     L0035
        ROL     L0034
        ROL     L0033
        ROL     L0032
        ROL     A
.L833B
        BPL     L8331

        CPY     L0030
        STY     L0030
        BCC     L8345

        DEC     L002F
.L8345
        TAY
.L8346
        STA     L0031
        RTS

.L8349
        STZ     L003D
        LDY     L0031
        BRA     L8353

.L834F
        LDY     L0031
        STY     L003D
.L8353
        LDA     L0030
        CMP     #$81
        BCS     L835E

        STY     L003D
        JMP     LA72B

.L835E
        CMP     #$A0
        BCC     L8372

.L8362
        JMP     LA6F2

.L8365
        LSR     L0031
        ROR     L0032
        ROR     L0033
        ROR     L0034
        BCC     L8371

        STA     L003D
.L8371
        INC     A
.L8372
        BIT     #07
        BNE     L8365

        AND     #$18
        BEQ     L83A6

        LSR     A
        LSR     A
        LSR     A
        TAY
        PHX
        EOR     #$03
        TAX
        LDA     L003D
        BNE     L8392

        STZ     L0035
        LDA     L0034
        ORA     L0031,Y
        ORA     L0032,Y
        STA     L003D
.L8392
        LDA     L0033
        STA     L0034
        LDA     L0032
        STA     L0033,X
        LDA     L0031
        STA     L0032,X
.L839E
        STZ     L0031,X
        DEX
        BPL     L839E

        PLX
        STZ     L0035
.L83A6
        LDA     L002E
        BPL     L83C1

.L83AA
        SEC
        LDY     #$00
        TYA
        SBC     L0034
        STA     L0034
        TYA
        SBC     L0033
        STA     L0033
        TYA
        SBC     L0032
        STA     L0032
        TYA
        SBC     L0031
        STA     L0031
.L83C1
        RTS

.L83C2
        INC     L0034
        BNE     L83D2

        INC     L0033
        BNE     L83D2

        INC     L0032
        BNE     L83D2

        INC     L0031
        BEQ     L8362

.L83D2
        RTS

.L83D3
        LDY     #$02
.L83D5
        ROR     L0011
        ROR     L0010
        LDA     L000F
        STA     L0011
        ROR     A
        PHA
        LDA     L000E
        LDX     L000D
        LSR     L000F
        ROR     A
        ROR     L000D
        LSR     L000F
        ROR     A
        ROR     L000D
        LSR     L000F
        ROR     A
        ROR     L000D
        LSR     L000F
        ROR     A
        ROR     L000D
        EOR     L0010
        STX     L000F
        LDX     L000E
        STX     L0010
        STA     L000E
        PLA
        EOR     L000D
        STA     L000D
        DEY
        BNE     L83D5

        RTS

.L840A
        LDA     L003B
        STA     L002E
        STZ     L002F
        LDA     L003C
        STA     L0030
        LDA     L003D
        STA     L0031
        LDA     L003E
        STA     L0032
        LDA     L003F
        STA     L0033
        LDA     L0040
        STA     L0034
        LDA     L0041
        STA     L0035
.L8428
        RTS

.L8429
        LDA     L0031
        BEQ     L840A

        SEC
        LDA     L0030
        SBC     L003C
        BEQ     L84A3

        BCC     L846A

        CMP     #$25
        BCS     L8428

        TAY
        AND     #$38
        BEQ     L8456

        SEC
.L8440
        LDX     L0040
        STX     L0041
        LDX     L003F
        STX     L0040
        LDX     L003E
        STX     L003F
        LDX     L003D
        STX     L003E
        STZ     L003D
        SBC     #$08
        BNE     L8440

.L8456
        TYA
        AND     #$07
        BEQ     L84A3

.L845B
        LSR     L003D
        ROR     L003E
        ROR     L003F
        ROR     L0040
        ROR     L0041
        DEC     A
        BNE     L845B

        BRA     L84A3

.L846A
        EOR     #$FF
        INC     A
        CMP     #$25
        BCS     L840A

        LDY     L003C
        STY     L0030
        TAY
        AND     #$38
        BEQ     L8491

        SEC
.L847B
        LDX     L0034
        STX     L0035
        LDX     L0033
        STX     L0034
        LDX     L0032
        STX     L0033
        LDX     L0031
        STX     L0032
        STZ     L0031
        SBC     #$08
        BNE     L847B

.L8491
        TYA
        AND     #$07
        BEQ     L84A3

.L8496
        LSR     L0031
        ROR     L0032
        ROR     L0033
        ROR     L0034
        ROR     L0035
        DEC     A
        BNE     L8496

.L84A3
        LDA     L002E
        EOR     L003B
        BMI     L84AD

        CLC
        JMP     LA489

.L84AD
        LDA     L0031
        CMP     L003D
        BNE     L84CE

        LDA     L0032
        CMP     L003E
        BNE     L84CE

        LDA     L0033
        CMP     L003F
        BNE     L84CE

        LDA     L0034
        CMP     L0040
        BNE     L84CE

        LDA     L0035
        CMP     L0041
        BNE     L84CE

        JMP     LA72B

.L84CE
        BCS     L84F4

        LDA     L003B
        STA     L002E
        SEC
        LDA     L0041
        SBC     L0035
        STA     L0035
        LDA     L0040
        SBC     L0034
        STA     L0034
        LDA     L003F
        SBC     L0033
        STA     L0033
        LDA     L003E
        SBC     L0032
        STA     L0032
        LDA     L003D
        SBC     L0031
        JMP     L8304

.L84F4
        LDA     L0035
        SBC     L0041
        STA     L0035
        LDA     L0034
        SBC     L0040
        STA     L0034
        LDA     L0033
        SBC     L003F
        STA     L0033
        LDA     L0032
        SBC     L003E
        STA     L0032
        LDA     L0031
        SBC     L003D
        JMP     L8304

        EQUS    "AND"

        EQUB    $80,$00

        EQUS    "ABS"

        EQUB    $94,$00

        EQUS    "ACS"

        EQUB    $95,$00

        EQUS    "ADVAL"

        EQUB    $96,$00

        EQUS    "ASC"

        EQUB    $97,$00

        EQUS    "ASN"

        EQUB    $98,$00

        EQUS    "ATN"

        EQUB    $99,$00

        EQUS    "AUTO"

        EQUB    $C6,$10

        EQUS    "BGET"

        EQUB    $9A,$01

        EQUS    "BPUT"

        EQUB    $D5,$03

        EQUS    "COLOUR"

        EQUB    $FB,$02

        EQUS    "CALL"

        EQUB    $D6,$02

        EQUS    "CHAIN"

        EQUB    $D7,$02

        EQUS    "CHR$"

        EQUB    $BD,$00

        EQUS    "CLEAR"

        EQUB    $D8,$01

        EQUS    "CLOSE"

        EQUB    $D9,$03

        EQUS    "CLG"

        EQUB    $DA,$01

        EQUS    "CLS"

        EQUB    $DB,$01

        EQUS    "COS"

        EQUB    $9B,$00

        EQUS    "COUNT"

        EQUB    $9C,$01

        EQUS    "COLOR"

        EQUB    $FB,$02

        EQUS    "DATA"

        EQUB    $DC,$20

        EQUS    "DEG"

        EQUB    $9D,$00

        EQUS    "DEF"

        EQUB    $DD,$00

        EQUS    "DELETE"

        EQUB    $C7,$10

        EQUS    "DIV"

        EQUB    $81,$00

        EQUS    "DIM"

        EQUB    $DE,$02

        EQUS    "DRAW"

        EQUB    $DF,$02

        EQUS    "ENDPROC"

        EQUB    $E1,$01

        EQUS    "END"

        EQUB    $E0,$01

        EQUS    "ENVELOPE"

        EQUB    $E2,$02

        EQUS    "ELSE"

        EQUB    $8B,$14

        EQUS    "EVAL"

        EQUB    $A0,$00

        EQUS    "ERL"

        EQUB    $9E,$01

        EQUS    "ERROR"

        EQUB    $85,$04

        EQUS    "EOF"

        EQUB    $C5,$01

        EQUS    "EOR"

        EQUB    $82,$00

        EQUS    "ERR"

        EQUB    $9F,$01

        EQUS    "EXP"

        EQUB    $A1,$00

        EQUS    "EXT"

        EQUB    $A2,$01

        EQUS    "EDIT"

        EQUB    $CE,$10

        EQUS    "FOR"

        EQUB    $E3,$02

        EQUS    "FALSE"

        EQUB    $A3,$01

        EQUS    "FN"

        EQUB    $A4,$08

        EQUS    "GOTO"

        EQUB    $E5,$12

        EQUS    "GET$"

        EQUB    $BE,$00

        EQUS    "GET"

        EQUB    $A5,$00

        EQUS    "GOSUB"

        EQUB    $E4,$12

        EQUS    "GCOL"

        EQUB    $E6,$02

        EQUS    "HIMEM"

        EQUB    $93,$43

        EQUS    "INPUT"

        EQUB    $E8,$02

        EQUS    "IF"

        EQUB    $E7,$02

        EQUS    "INKEY$"

        EQUB    $BF,$00

        EQUS    "INKEY"

        EQUB    $A6,$00

        EQUS    "INT"

        EQUB    $A8,$00

        EQUS    "INSTR("

        EQUB    $A7,$00

        EQUS    "LIST"

        EQUB    $C9,$10

        EQUS    "LINE"

        EQUB    $86,$00

        EQUS    "LOAD"

        EQUB    $C8,$02

        EQUS    "LOMEM"

        EQUB    $92,$43

        EQUS    "LOCAL"

        EQUB    $EA,$02

        EQUS    "LEFT$("

        EQUB    $C0,$00

        EQUS    "LEN"

        EQUB    $A9,$00

        EQUS    "LET"

        EQUB    $E9,$04

        EQUS    "LOG"

        EQUB    $AB,$00

        EQUS    "LN"

        EQUB    $AA,$00

        EQUS    "MID$("

        EQUB    $C1,$00

        EQUS    "MODE"

        EQUB    $EB,$02

        EQUS    "MOD"

        EQUB    $83,$00

        EQUS    "MOVE"

        EQUB    $EC,$02

        EQUS    "NEXT"

        EQUB    $ED,$02

        EQUS    "NEW"

        EQUB    $CA,$01

        EQUS    "NOT"

        EQUB    $AC,$00

        EQUS    "OLD"

        EQUB    $CB,$01

        EQUS    "ON"

        EQUB    $EE,$02

        EQUS    "OFF"

        EQUB    $87,$00

        EQUS    "OR"

        EQUB    $84,$00

        EQUS    "OPENIN"

        EQUB    $8E,$00

        EQUS    "OPENOUT"

        EQUB    $AE,$00

        EQUS    "OPENUP"

        EQUB    $AD,$00

        EQUS    "OSCLI"

        EQUB    $FF,$02

        EQUS    "PRINT"

        EQUB    $F1,$02

        EQUS    "PAGE"

        EQUB    $90,$43

        EQUS    "PTR"

        EQUB    $8F,$43

        EQUS    "PI"

        EQUB    $AF,$01

        EQUS    "PLOT"

        EQUB    $F0,$02

        EQUS    "POINT("

        EQUB    $B0,$00

        EQUS    "PROC"

        EQUB    $F2,$0A

        EQUS    "POS"

        EQUB    $B1,$01

        EQUS    "RETURN"

        EQUB    $F8,$01

        EQUS    "REPEAT"

        EQUB    $F5,$00

        EQUS    "REPORT"

        EQUB    $F6,$01

        EQUS    "READ"

        EQUB    $F3,$02

        EQUS    "REM"

        EQUB    $F4,$20

        EQUS    "RUN"

        EQUB    $F9,$01

        EQUS    "RAD"

        EQUB    $B2,$00

        EQUS    "RESTORE"

        EQUB    $F7,$12

        EQUS    "RIGHT$("

        EQUB    $C2,$00

        EQUS    "RND"

        EQUB    $B3,$01

        EQUS    "RENUMBER"

        EQUB    $CC,$10

        EQUS    "STEP"

        EQUB    $88,$00

        EQUS    "SAVE"

        EQUB    $CD,$02

        EQUS    "SGN"

        EQUB    $B4,$00

        EQUS    "SIN"

        EQUB    $B5,$00

        EQUS    "SQR"

        EQUB    $B6,$00

        EQUS    "SPC"

        EQUB    $89,$00

        EQUS    "STR$"

        EQUB    $C3,$00

        EQUS    "STRING$("

        EQUB    $C4,$00

        EQUS    "SOUND"

        EQUB    $D4,$02

        EQUS    "STOP"

        EQUB    $FA,$01

        EQUS    "TAN"

        EQUB    $B7,$00

        EQUS    "THEN"

        EQUB    $8C,$14

        EQUS    "TO"

        EQUB    $B8,$00

        EQUS    "TAB("

        EQUB    $8A,$00

        EQUS    "TRACE"

        EQUB    $FC,$12

        EQUS    "TIME"

        EQUB    $91,$43

        EQUS    "TRUE"

        EQUB    $B9,$01

        EQUS    "UNTIL"

        EQUB    $FD,$02

        EQUS    "USR"

        EQUB    $BA,$00

        EQUS    "VDU"

        EQUB    $EF,$02

        EQUS    "VAL"

        EQUB    $BB,$00

        EQUS    "VPOS"

        EQUB    $BC,$01

        EQUS    "WIDTH"

        EQUB    $FE,$02

        EQUS    "PAGE"

        EQUB    $D0,$00

        EQUS    "PTR"

        EQUB    $CF,$00

        EQUS    "TI"

.L880A
        EQUS    "ME"

        EQUB    $D1,$00

        EQUS    "LOMEM"

        EQUB    $D2,$00

        EQUS    "HIMEM"

        EQUB    $D3,$00

        EQUS    "Missing "

        EQUB    $8D,$00

.L8826
        EQUW    LAB37,LAB21,LAE50,LAE8C
        EQUW    LAE71,LAE77,LAD00,LA6FC
        EQUW    LAE34,LAC03,LA901,LA919
        EQUW    LAB2F,LA954,LAE6D,LA9CA
        EQUW    LAE7D,LAE83,LAB5C,LAA17
        EQUW    LAB1D,LAC38,LB055,LAE87
        EQUW    LAC12,LAC7F,LABE1,LAE59
        EQUW    LA7AC,LA9BC,LAAEB,LAB3F
        EQUW    LAB3B,LAB54,LAC5D,LAAFB
        EQUW    LA9B5,LAACB,LAC46,LA94F
        EQUW    LA808,LA96B,LAE41,LAC2B
        EQUW    LAB01,LABA0,LAB14,LB269
        EQUW    LAEB1,LAEFB,LAEBB,LAF0A
        EQUW    LAEBC,LAF61,LAF8B,LAC1F
        EQUW    L954C,L93DA,L8FE5,LB412
        EQUW    L9042,L8FC5,L9447,LBE95
        EQUW    LB3C8,LBED7,L96F9,L973E
        EQUW    L96E5,L96D4,LB302,LBEFD
        EQUW    L9381,L8FC0,L9703,LBEEE
        EQUW    L98AF,L98B6,L9073,L9073
        EQUW    L95F9,L9875,L8FEA,L9C5E
        EQUW    LB326,LB649,LB709,LB74D
        EQUW    L9810,L9CCC,LB8E6,L910D
        EQUW    L97D2,L982E,L9871,LB522
        EQUW    LB78B,L98DC,L9880,L9250
        EQUW    L97A9,LB9AD,L9073,LBA88
        EQUW    L98C3,LB97D,LB737,L8FD7
        EQUW    L9149,L9824,L970B,LBA47
        EQUW    LB351,LBEC7

        L8909   = L8826+227
        EQUB    $4B,$83,$84,$89,$96,$B8,$B9,$D8
        EQUB    $D9,$F0,$01,$10,$81,$90,$89,$93
        EQUB    $A3,$A4,$A9,$38,$39,$78,$01,$13
        EQUB    $21,$A1,$C1,$19,$18,$99,$98,$63
        EQUB    $73,$B1,$A9,$C5,$0C,$C3,$D3,$41
        EQUB    $C4,$F2,$41,$83,$B0,$81,$43,$6C
        EQUB    $72,$EC,$F2,$A3,$C3,$92,$9A,$18
        EQUB    $19,$62,$42,$34,$B0,$72,$98,$99
        EQUB    $81,$98,$99,$14

.L894E
        EQUB    $35

        EQUB    $0A,$0D,$0D,$0D,$0D,$10,$10,$25
        EQUB    $25,$39,$41,$41,$41,$41,$4A,$4A
        EQUB    $4C,$4C,$4C,$50,$50,$52,$53,$53
        EQUB    $53,$10,$25,$41,$41,$41,$41,$08
        EQUB    $08,$08,$09,$09,$0A,$0A,$0A,$0A
        EQUB    $05,$15,$3E,$04,$0D,$30,$4C,$06
        EQUB    $32,$49,$49,$10,$25,$0D,$4E,$0E
        EQUB    $0E,$52,$52,$09,$29,$2A,$30,$30
        EQUB    $4E,$4E,$4E,$3E

.L8993
        EQUB    $16

        EQUB    $00,$18,$D8,$58,$B8,$CA,$88,$E8
        EQUB    $C8,$EA,$48,$08,$68,$28,$40,$60
        EQUB    $38,$F8,$78,$AA,$A8,$BA,$8A,$9A
        EQUB    $98,$3A,$1A,$5A,$DA,$7A,$FA,$90
        EQUB    $B0,$F0,$30,$D0,$10,$50,$70,$80
        EQUB    $21,$41,$01,$61,$C1,$A1,$E1,$06
        EQUB    $46,$26,$66,$C6,$E6,$9C,$9C,$E0
        EQUB    $C0,$00,$10,$24,$4C,$20,$A2,$A0
        EQUB    $81,$86,$84

.L89D7
        DEC     A
        STA     L0028
        JMP     L90D0

.L89DD
        JSR     L8F9D

        EOR     #$5D
        BEQ     L89D7

        JSR     L9C80

        DEC     L000A
        JSR     L8AA8

        DEC     L000A
        LDA     L0028
        LSR     A
        BCC     L8A6B

        LDA     L001E
        ADC     #$04
        STA     L003F
        LDA     L0038
        JSR     LBDAC

        LDA     L0037
        JSR     LBDCF

        LDX     #$FC
        LDY     L0039
        BPL     L8A0B

        LDY     L0036
.L8A0B
        STY     L0038
        BEQ     L8A28

        LDY     #$00
.L8A11
        INX
        BNE     L8A1E

        JSR     LBAC2

        LDX     L003F
        JSR     LBDFF

        LDX     #$FD
.L8A1E
        LDA     (L003A),Y
        JSR     LBDCF

        INY
        DEC     L0038
        BNE     L8A11

.L8A28
        TXA
        TAY
.L8A2A
        INY
        BEQ     L8A34

        LDX     #$03
        JSR     LBDFF

        BRA     L8A2A

.L8A34
        LDX     #$0A
        LDA     (L000B)
        CMP     #$2E
        BNE     L8A4B

.L8A3C
        JSR     LBD77

        DEX
        BNE     L8A44

        LDX     #$01
.L8A44
        INY
        LDA     (L000B),Y
        CPY     L004E
        BNE     L8A3C

.L8A4B
        JSR     LBDFF

        DEY
.L8A4F
        INY
        CMP     (L000B),Y
        BEQ     L8A4F

.L8A54
        LDA     (L000B),Y
        CMP     #$3A
        BEQ     L8A64

        CMP     #$0D
        BEQ     L8A68

.L8A5E
        JSR     LBD77

        INY
        BRA     L8A54

.L8A64
        CPY     L000A
        BCC     L8A5E

.L8A68
        JSR     LBAC2

.L8A6B
        LDY     L000A
        DEY
.L8A6E
        INY
        LDA     (L000B),Y
        CMP     #$3A
        BEQ     L8A79

        CMP     #$0D
        BNE     L8A6E

.L8A79
        JSR     L9C6C

        LDA     (L000B)
        CMP     #$3A
        BEQ     L8A8E

        LDA     L000C
        CMP     #$07
        BNE     L8A8B

        JMP     L904B

.L8A8B
        JSR     L9CA2

.L8A8E
        JMP     L89DD

.L8A91
        JSR     L997D

        BEQ     L8AF2

        BCS     L8AF2

        JSR     LBC83

        JSR     LADC6

        STA     L0027
        JSR     LB365

        JSR     L9338

        STY     L004E
.L8AA8
        JSR     L8F9D

        LDY     #$00
        STZ     L003D
        CMP     #$3A
        BEQ     L8B1B

        CMP     #$0D
        BEQ     L8B1B

        CMP     #$5C
        BEQ     L8B1B

        CMP     #$2E
        BEQ     L8A91

        DEC     L000A
        LDX     #$03
.L8AC3
        LDY     L000A
        INC     L000A
        LDA     (L000B),Y
        BMI     L8AF5

        CMP     #$20
        BEQ     L8ADF

        LDY     #$05
        ASL     A
        ASL     A
        ASL     A
.L8AD4
        ASL     A
        ROL     L003D
        ROL     L003E
        DEY
        BNE     L8AD4

        DEX
        BNE     L8AC3

.L8ADF
        LDX     #$45
        LDA     L003D
.L8AE3
        CMP     L8909,X
        BNE     L8AEF

        LDY     L894E,X
        CPY     L003E
        BEQ     L8B10

.L8AEF
        DEX
        BNE     L8AE3

.L8AF2
        JMP     L9C2D

.L8AF5
        LDX     #$29
        CMP     #$80
        BEQ     L8B10

        INX
        CMP     #$82
        BEQ     L8B10

        INX
        CMP     #$84
        BNE     L8AF2

        INC     L000A
        INY
        LDA     (L000B),Y
        AND     #$DF
        CMP     #$41
        BNE     L8AF2

.L8B10
        LDA     L8993,X
        STA     L0029
        LDY     #$01
        CPX     #$20
        BCS     L8B63

.L8B1B
        LDA     L0440
        STA     L0037
        STY     L0039
        LDX     L0028
        CPX     #$04
        LDX     L0441
        STX     L0038
        BCC     L8B33

        LDA     L043C
        LDX     L043D
.L8B33
        STA     L003A
        STX     L003B
        TYA
        BEQ     L8B62

        BPL     L8B40

        LDY     L0036
        BEQ     L8B62

.L8B40
        DEY
        LDA     L0029,Y
        BIT     L0039
        BPL     L8B4B

        LDA     L0600,Y
.L8B4B
        STA     (L003A),Y
        INC     L0440
        BNE     L8B55

        INC     L0441
.L8B55
        BCC     L8B5F

        INC     L043C
        BNE     L8B5F

        INC     L043D
.L8B5F
        TYA
        BNE     L8B40

.L8B62
        RTS

.L8B63
        CPX     #$29
        BCS     L8BA3

        JSR     L9332

        CLC
        LDA     L002A
        SBC     L0440
        TAY
        LDA     L002B
        SBC     L0441
        CPY     #$01
        DEY
        SBC     #$00
        BEQ     L8B98

        INC     A
        BNE     L8B83

        TYA
        BMI     L8B9C

.L8B83
        LDA     L0028
        AND     #$02
        BEQ     L8B9B

        BRK
        EQUB    $01

        EQUS    "Out of range"

        EQUB    $00

.L8B98
        TYA
        BMI     L8B83

.L8B9B
        TAY
.L8B9C
        STY     L002A
.L8B9E
        LDY     #$02
        JMP     L8B1B

.L8BA3
        CPX     #$30
        BCS     L8BBD

        JSR     L8D9C

        BNE     L8BC4

        JSR     L8D89

.L8BAF
        JSR     L9332

.L8BB2
        LDA     L002B
.L8BB4
        BEQ     L8B9E

.L8BB6
        BRK
        EQUB    $02

        EQUS    "Byte"

        EQUB    $00

.L8BBD
        CPX     #$41
        BNE     L8C24

        JSR     L8F9D

.L8BC4
        CMP     #$28
        BNE     L8C01

        JSR     L9332

        JSR     L8F9D

        CMP     #$29
        BNE     L8BE9

        JSR     L8D86

        JSR     L8DA2

        BEQ     L8BDE

        INC     L0029
        BRA     L8BB2

.L8BDE
        JSR     L8F9D

        AND     #$DF
        CMP     #$59
        BEQ     L8BB2

        BRA     L8BF9

.L8BE9
        CMP     #$2C
        BNE     L8BF9

        JSR     L8D94

        BNE     L8BF9

        JSR     L8F9D

        CMP     #$29
        BEQ     L8BB2

.L8BF9
        BRK
        EQUB    $03

        EQUS    "Index"

        EQUB    $00

.L8C01
        JSR     L9330

        JSR     L8DA2

        BNE     L8C1B

        JSR     L8D86

        JSR     L8D94

        BEQ     L8C1B

        CMP     #$59
        BNE     L8BF9

.L8C15
        JSR     L8D89

        JMP     L8CBB

.L8C1B
        JSR     L8D8C

.L8C1E
        LDA     L002B
        BNE     L8C15

        BRA     L8BB4

.L8C24
        CPX     #$36
        BCS     L8C5E

        JSR     L8F9D

        AND     #$DF
        CMP     #$41
        BEQ     L8C43

.L8C31
        JSR     L9330

        JSR     L8DA2

        BNE     L8C1E

        JSR     L8D86

        JSR     L8D94

        BEQ     L8C1E

.L8C41
        BRA     L8BF9

.L8C43
        INY
        LDA     (L000B),Y
        JSR     L8E41

        BCS     L8C31

        LDY     #$16
        CPX     #$34
        BCC     L8C57

        BNE     L8C55

        LDY     #$36
.L8C55
        STY     L0029
.L8C57
        JSR     L8D8C

        LDY     #$01
        BRA     L8CBD

.L8C5E
        CPX     #$38
        BCS     L8C87

        JSR     L9332

        LDY     #$03
        LDX     #$01
        LDA     L002B
        BNE     L8C74

        LDX     #$0F
        LDA     #$64
        STA     L0029
        DEY
.L8C74
        PHY
        JSR     L8DA2

        BNE     L8C84

        JSR     L8D94

        BNE     L8C41

        TXA
        ADC     L0029
        STA     L0029
.L8C84
        PLY
        BRA     L8CBD

.L8C87
        CPX     #$3C
        BCS     L8CA7

        CPX     #$3A
        BCS     L8C96

        JSR     L8D9C

        BEQ     L8CA4

        DEC     L000A
.L8C96
        JSR     L9332

.L8C99
        BRA     L8C1B

.L8C9B
        JSR     L8D9C

        BNE     L8C31

        LDY     #$89
        STY     L0029
.L8CA4
        JMP     L8BAF

.L8CA7
        BEQ     L8C9B

        CPX     #$3E
        BEQ     L8CB8

        BCS     L8CE6

        JSR     L8F9D

        CMP     #$28
        BEQ     L8CC0

        DEC     L000A
.L8CB8
        JSR     L9332

.L8CBB
        LDY     #$03
.L8CBD
        JMP     L8B1B

.L8CC0
        JSR     L8D86

        JSR     L8D86

        JSR     L9332

        JSR     L8F9D

        CMP     #$29
        BEQ     L8CBB

        CMP     #$2C
        BNE     L8CE3

        JSR     L8D86

        JSR     L8D94

        BNE     L8CE3

        JSR     L8F9D

        CMP     #$29
        BEQ     L8CBB

.L8CE3
        JMP     L8BF9

.L8CE6
        CPX     #$44
        BCS     L8D37

        LDA     L003D
        EOR     #$01
        AND     #$1F
        PHA
        CPX     #$41
        BCS     L8D16

        JSR     L8D9C

        BNE     L8CFD

        PLA
        BRA     L8CA4

.L8CFD
        JSR     L9330

        PLA
        STA     L0037
        JSR     L8DA2

        BNE     L8C99

        JSR     L8F9D

        AND     #$1F
        CMP     L0037
        BNE     L8CE3

        JSR     L8D86

        BRA     L8C99

.L8D16
        JSR     L9332

        PLA
        STA     L0037
        JSR     L8DA2

        BNE     L8D34

        JSR     L8F9D

        AND     #$1F
        CMP     L0037
        BNE     L8CE3

        JSR     L8D86

        LDA     L002B
        BEQ     L8D34

        JMP     L8BB6

.L8D34
        JMP     L8C1E

.L8D37
        BNE     L8D44

        JSR     L9332

        LDA     L002A
        STA     L0028
        LDY     #$00
        BRA     L8D6E

.L8D44
        LDX     #$01
        LDY     L000A
        INC     L000A
        LDA     (L000B),Y
        AND     #$DF
        CMP     #$42
        BEQ     L8D64

        INX
        CMP     #$57
        BEQ     L8D64

        LDX     #$04
        CMP     #$44
        BEQ     L8D64

        CMP     #$53
        BEQ     L8D74

        JMP     L9C2D

.L8D64
        PHX
        JSR     L9332

        LDX     #$29
        JSR     LBE06

        PLY
.L8D6E
        JMP     L8B1B

.L8D71
        JMP     L9155

.L8D74
        LDA     L0028
        PHA
        JSR     L9DF3

        BNE     L8D71

        PLA
        STA     L0028
        JSR     L9338

        LDY     #$FF
        BRA     L8D6E

.L8D86
        JSR     L8D89

.L8D89
        JSR     L8D8C

.L8D8C
        LDA     L0029
        CLC
        ADC     #$04
        STA     L0029
        RTS

.L8D94
        JSR     L8F9D

        AND     #$DF
        CMP     #$58
        RTS

.L8D9C
        JSR     L8F9D

        CMP     #$23
        RTS

.L8DA2
        JSR     L8F9D

        CMP     #$2C
        RTS

.L8DA8
        STA     (L0037)
        CLC
        TYA
        ADC     L0037
        STA     L0039
        LDY     #$00
        TYA
        ADC     L0038
        STA     L003A
.L8DB7
        INY
        LDA     (L0039),Y
        STA     (L0037),Y
        CMP     #$0D
        BNE     L8DB7

        RTS

.L8DC1
        AND     #$0F
        STA     L003D
        LDX     #$00
        LDY     #$00
.L8DC9
        INY
        LDA     (L0037),Y
        JSR     L8E51

        BCC     L8DFF

        AND     #$0F
        PHA
        STX     L003E
        LDA     L003D
        ASL     A
        ROL     L003E
        BMI     L8DFC

        ASL     A
        ROL     L003E
        BMI     L8DFC

        ADC     L003D
        STA     L003D
        TXA
        ADC     L003E
        ASL     L003D
        ROL     A
        BMI     L8DFC

        BCS     L8DFC

        TAX
        PLA
        ADC     L003D
        STA     L003D
        BCC     L8DC9

        INX
        BPL     L8DC9

        PHA
.L8DFC
        PLA
        SEC
        RTS

.L8DFF
        DEY
        LDA     #$8D
        JSR     L8DA8

        LDA     L0037
        STA     L0039
        LDA     L0038
        STA     L003A
        JSR     L8E5F

        JSR     L8E5F

        JSR     L8E5F

.L8E16
        LDA     (L0039),Y
        STA     (L0037),Y
        DEY
        BNE     L8E16

        LDY     #$03
.L8E1F
        TXA
        ORA     #$40
        STA     (L0039),Y
        DEY
        LDA     L003D
        AND     #$3F
        ORA     #$40
        STA     (L0039),Y
        DEY
        LDA     #$3F
        TRB     L003D
        TXA
        AND     #$C0
        LSR     A
        LSR     A
        ORA     L003D
        LSR     A
        LSR     A
        EOR     #$54
        STA     (L0039),Y
.L8E3F
        CLC
        RTS

.L8E41
        CMP     #$7B
        BCS     L8E3F

        CMP     #$5F
        BCS     L8E57

        CMP     #$5B
        BCS     L8E3F

        CMP     #$41
        BCS     L8E57

.L8E51
        CMP     #$3A
        BCS     L8E3F

        CMP     #$30
.L8E57
        RTS

.L8E58
        CMP     #$2E
        BNE     L8E51

        RTS

.L8E5D
        LDA     (L0037)
.L8E5F
        INC     L0037
        BNE     L8E9C

        INC     L0038
        RTS

.L8E66
        JSR     L8E5F

        LDA     (L0037)
        RTS

.L8E6C
        JSR     L8E5F

.L8E6F
        LDA     (L0037)
        CMP     #$0D
        BEQ     L8E9C

        CMP     #$20
        BEQ     L8E6C

        CMP     #$26
        BNE     L8E8D

.L8E7D
        JSR     L8E66

        JSR     L8E51

        BCS     L8E7D

        CMP     #$41
        BCC     L8E6F

        CMP     #$47
        BCC     L8E7D

.L8E8D
        CMP     #$22
        BNE     L8E9D

.L8E91
        JSR     L8E66

        CMP     #$22
        BEQ     L8E6C

        CMP     #$0D
        BNE     L8E91

.L8E9C
        RTS

.L8E9D
        CMP     #$3A
        BNE     L8EAA

        JSR     L8E5F

.L8EA4
        STZ     L003B
.L8EA6
        STZ     L003C
        BRA     L8E6F

.L8EAA
        CMP     #$2C
        BEQ     L8E6C

        CMP     #$2A
        BNE     L8EBE

        LDA     L003B
        BEQ     L8E9C

.L8EB6
        LDX     #$FF
        STX     L003B
        STZ     L003C
        BRA     L8E6C

.L8EBE
        CMP     #$2E
        BEQ     L8ED0

        JSR     L8E51

        BCC     L8EF3

        LDX     L003C
        BEQ     L8ED0

        JSR     L8DC1

        BCC     L8E6C

.L8ED0
        LDA     (L0037)
        JSR     L8E58

        BCC     L8EDC

        JSR     L8E5F

        BRA     L8ED0

.L8EDC
        LDX     #$FF
        STX     L003B
        BRA     L8EA6

.L8EE2
        JSR     L8E41

        BCC     L8EB6

.L8EE7
        LDA     (L0037)
        JSR     L8E41

        BCC     L8EDC

        JSR     L8E5F

        BRA     L8EE7

.L8EF3
        CMP     #$41
        BCC     L8EB6

        CMP     #$58
        BCS     L8EE2

        LDX     #$13
        STX     L0039
        LDX     #$85
        STX     L003A
.L8F03
        LDY     #$00
        CMP     (L0039)
        BCC     L8EE7

        BNE     L8F1A

.L8F0B
        INY
        LDA     (L0039),Y
        BMI     L8F41

        CMP     (L0037),Y
        BEQ     L8F0B

        LDA     (L0037),Y
        CMP     #$2E
        BEQ     L8F25

.L8F1A
        INY
        LDA     (L0039),Y
        BPL     L8F1A

        CMP     #$FE
        BNE     L8F32

        BCS     L8EE7

.L8F25
        INY
.L8F26
        LDA     (L0039),Y
        BMI     L8F41

        INC     L0039
        BNE     L8F26

        INC     L003A
        BRA     L8F26

.L8F32
        SEC
        INY
        TYA
        ADC     L0039
        STA     L0039
        BCC     L8F3D

        INC     L003A
.L8F3D
        LDA     (L0037)
        BRA     L8F03

.L8F41
        TAX
        INY
        LDA     (L0039),Y
        STA     L003D
        DEY
        LSR     A
        BCC     L8F52

        LDA     (L0037),Y
        JSR     L8E41

        BCS     L8EE7

.L8F52
        TXA
        BIT     L003D
        BVC     L8F5D

        LDX     L003B
        BNE     L8F5D

        ADC     #$40
.L8F5D
        DEY
        JSR     L8DA8

        LDX     #$FF
        LDA     L003D
        LSR     A
        LSR     A
        BCC     L8F6D

        STX     L003B
        STZ     L003C
.L8F6D
        LSR     A
        BCC     L8F74

        STZ     L003B
        STZ     L003C
.L8F74
        LSR     A
        BCC     L8F87

        PHA
        LDY     #$01
.L8F7A
        LDA     (L0037),Y
        JSR     L8E41

        BCC     L8F86

        JSR     L8E5F

        BRA     L8F7A

.L8F86
        PLA
.L8F87
        LSR     A
        BCC     L8F8C

        STX     L003C
.L8F8C
        LSR     A
        BCS     L8F9C

        JMP     L8E6C

.L8F92
        LDY     L001B
        INC     L001B
        LDA     (L0019),Y
        CMP     #$20
        BEQ     L8F92

.L8F9C
        RTS

.L8F9D
        LDY     L000A
        INC     L000A
        LDA     (L000B),Y
        CMP     #$20
        BEQ     L8F9D

.L8FA7
        RTS

.L8FA8
        JSR     L8F92

        CMP     #$2C
        RTS

.L8FAE
        JSR     L9774

        JSR     LBC66

.L8FB4
        JSR     L8F92

        CMP     #$2C
        BEQ     L8FA7

.L8FBB
        BRK
        EQUB    $05

        EQUS    $8D,","

        EQUB    $00

.L8FC0
        JSR     LBE17

        BRA     L8FDA

.L8FC5
        JSR     L9C6A

        LDA     L0018
        STA     L0038
        STZ     L0037
        LDA     #$00
        STA     (L0037),Y
        JSR     LBE25

        BRA     L9048

.L8FD7
        JSR     L9C6A

.L8FDA
        JSR     LBBDC

        LDA     L0018
        STA     L000C
        STZ     L000B
        BRA     L905C

.L8FE5
        JSR     LBE17

        BRA     L9048

.L8FEA
        JSR     L9C6A

        JSR     LBE25

        BRA     L904B

.L8FF2
        LDA     #$F2
        JSR     LAE60

        JSR     LBF22

        TAX
        JSR     LBF22

        STA     L002B
        STX     L002A
        LDX     #$14
.L9004
        DEX
        BEQ     L9045

        JSR     LBF22

        CMP     #$0D
        BEQ     L9045

        CMP     #$40
        BNE     L9004

        JSR     LBF22

        CMP     #$0D
        BNE     L9045

        JSR     LBF3E

.L901C
        LDY     #$00
        STZ     L000B
        LDA     #$07
        STA     L000C
.L9024
        LDA     (L0000)
        BEQ     L9048

        STA     (L000B),Y
        INY
        BEQ     L9045

        INC     L0000
        BNE     L9033

        INC     L0001
.L9033
        CMP     #$0D
        BNE     L9024

        LDA     L0001
        CMP     L0007
        BCS     L9048

        JSR     LBB1B

        BRA     L901C

.L9042
        JSR     L9C6A

.L9045
        JSR     LBF3E

.L9048
        JSR     LBBDC

.L904B
        LDY     #$07
        STY     L000C
        STZ     L000B
        JSR     LB2E0

        LDA     #$3E
        JSR     LFFEE

        JSR     LBAA4

.L905C
        LDX     #$FF
        TXS
        JSR     LB2E0

        JSR     LBB1B

        BCS     L9048

        BRA     L90E3

.L9069
        JSR     L9C80

        LDX     L000B
        LDY     L000C
        JSR     LFFF7

.L9073
        LDA     #$0D
        LDY     L000A
        DEY
.L9078
        INY
        CMP     (L000B),Y
        BNE     L9078

.L907D
        JSR     L9C80

        BRA     L9086

.L9082
        CMP     #$0D
        BNE     L9073

.L9086
        LDA     L000C
        CMP     #$07
        BEQ     L904B

        LDY     #$01
        LDA     (L000B),Y
        BMI     L904B

        LDX     L0020
        BEQ     L90A0

        STA     L002B
        INY
        LDA     (L000B),Y
        STA     L002A
        JSR     L9D0F

.L90A0
        LDY     #$04
        STY     L000A
        BRA     L90D2

.L90A6
        LDA     #$03
        STA     L0028
        JMP     L89DD

.L90AD
        JMP     LBED3

.L90B0
        LDY     L000A
        DEY
        LDA     (L000B),Y
        CMP     #$2A
        BEQ     L9069

        CMP     #$5B
        BEQ     L90A6

        CMP     #$A2
        BEQ     L90AD

        CMP     #$3D
        BEQ     L9123

.L90C5
        DEC     L000A
.L90C7
        JSR     L9C6A

.L90CA
        LDA     (L000B)
        CMP     #$3A
        BNE     L9082

.L90D0
        LDY     L000A
.L90D2
        INC     L000A
        LDA     (L000B),Y
        CMP     #$20
        BEQ     L90D0

        CMP     #$CF
        BCC     L90EA

.L90DE
        ASL     A
        TAX
        JMP     (L880A,X)
.L90E3
        JSR     L8F9D

        CMP     #$C6
        BCS     L90DE

.L90EA
        LDX     L000B
        STX     L0019
        LDX     L000C
        STX     L001A
        JSR     L99D6

        BNE     L9112

        BCS     L90B0

        STX     L001B
        JSR     L9C4A

        JSR     L9923

        LDX     #$05
        CPX     L002C
        BNE     L9108

        INX
.L9108
        JSR     L9952

        DEC     L000A
.L910D
        JSR     L997D

        BEQ     L9146

.L9112
        BCC     L9135

        JSR     LBC66

        JSR     L9C16

        LDA     L0027
        BNE     L9155

        JSR     L916E

        BRA     L90CA

.L9123
        TSX
        CPX     #$FC
        BCS     L914F

        LDA     L01FF
        CMP     #$A4
        BNE     L914F

        JSR     L9DF3

        JMP     L9C55

.L9135
        LDA     L002A
        PHA
        LDA     L002B
        PHA
        LDA     L002C
        PHA
        JSR     L9C16

        JSR     LB365

        BRA     L90CA

.L9146
        JMP     L9C2D

.L9149
        JSR     L9C6A

        BRK
        EQUB    $00

        EQUS    $FA

.L914F
        BRK
        EQUB    $07

        EQUS    "No ",$A4

.L9155
        BRK
        EQUB    $06

        EQUS    "Type mismatch"

.L9164
        BRK
        EQUB    $00

        EQUS    "No room"

        EQUB    $00

.L916E
        JSR     LBD26

.L9171
        LDA     L002C
        CMP     #$80
        BEQ     L91EF

        LDY     #$02
        LDA     (L002A),Y
        CMP     L0036
        BCS     L91D1

        LDA     L0002
        STA     L002C
        LDA     L0003
        STA     L002D
        LDA     L0036
        CMP     #$08
        BCC     L9193

        ADC     #$07
        BCC     L9193

        LDA     #$FF
.L9193
        CLC
        PHA
        TAX
        LDA     (L002A),Y
        ADC     (L002A)
        EOR     L0002
        BNE     L91AD

        DEY
        ADC     (L002A),Y
        EOR     L0003
        BNE     L91AD

        STA     L002D
        TXA
        INY
        SEC
        SBC     (L002A),Y
        TAX
.L91AD
        TXA
        CLC
        ADC     L0002
        TAY
        LDA     L0003
        ADC     #$00
        TAX
        CPY     L0004
        SBC     L0005
        BCS     L9164

        STY     L0002
        STX     L0003
        PLA
        LDY     #$02
        STA     (L002A),Y
        DEY
        LDA     L002D
        BEQ     L91D1

        STA     (L002A),Y
        LDA     L002C
        STA     (L002A)
.L91D1
        LDY     #$03
        LDA     L0036
        STA     (L002A),Y
        BEQ     L91EE

        LDY     #$01
        LDA     (L002A),Y
        STA     L002D
        LDA     (L002A)
        STA     L002C
        DEY
.L91E4
        LDA     L0600,Y
        STA     (L002C),Y
        INY
        CPY     L0036
        BNE     L91E4

.L91EE
        RTS

.L91EF
        JSR     LBE6B

        CPY     #$00
        BEQ     L9201

.L91F6
        LDA     L0600,Y
        STA     (L002A),Y
        DEY
        BNE     L91F6

        LDA     L0600
.L9201
        STA     (L002A)
        RTS

.L9204
        JSR     LBA6C

.L9207
        PHY
        JSR     L8FA8

        BNE     L924A

        JSR     L9DFF

        JSR     LA545

        PLY
        LDA     L0027
        JSR     LFFD4

        TAX
        BEQ     L9237

        BMI     L922A

        LDX     #$03
.L9220
        LDA     L002A,X
        JSR     LFFD4

        DEX
        BPL     L9220

        BRA     L9207

.L922A
        LDX     #$04
.L922C
        LDA     L046C,X
        JSR     LFFD4

        DEX
        BPL     L922C

        BRA     L9207

.L9237
        LDA     L0036
        JSR     LFFD4

        TAX
        BEQ     L9207

.L923F
        LDA     L05FF,X
        JSR     LFFD4

        DEX
        BNE     L923F

        BRA     L9207

.L924A
        PLA
        STY     L000A
        JMP     L90C7

.L9250
        JSR     L8D9C

        BEQ     L9204

        DEC     L000A
        BRA     L926E

.L9259
        LDA     L0400
        BEQ     L926E

        LDA     L001E
.L9260
        BEQ     L926E

        SBC     L0400
        BCS     L9260

        TAY
.L9268
        JSR     LBDD2

        INY
        BNE     L9268

.L926E
        CLC
        LDA     L0400
        STA     L0014
.L9274
        ROR     L0015
.L9276
        JSR     L8F9D

        CMP     #$3A
        BEQ     L9285

        CMP     #$0D
        BEQ     L9285

        CMP     #$8B
        BNE     L929E

.L9285
        JSR     LBAC2

.L9288
        JMP     L90C5

.L928B
        STZ     L0014
        STZ     L0015
        JSR     L8F9D

        CMP     #$3A
        BEQ     L9288

        CMP     #$0D
        BEQ     L9288

        CMP     #$8B
        BEQ     L9288

.L929E
        CMP     #$7E
        BEQ     L9274

        CMP     #$2C
        BEQ     L9259

        CMP     #$3B
        BEQ     L928B

        JSR     L933D

        BCC     L9276

        LDA     L0014
        PHA
        LDA     L0015
        PHA
        DEC     L001B
        JSR     L9DFF

        PLA
        STA     L0015
        PLA
        STA     L0014
        LDA     L001B
        STA     L000A
        TYA
        BEQ     L92DA

        JSR     LA181

        LDA     L0014
        SEC
        SBC     L0036
        BCC     L92DA

        BEQ     L92DA

        TAY
.L92D4
        JSR     LBDD2

        DEY
        BNE     L92D4

.L92DA
        LDA     L0036
        BEQ     L9276

        LDY     #$00
.L92E0
        LDA     L0600,Y
        JSR     LBDD8

        INY
        CPY     L0036
        BNE     L92E0

        BRA     L9276

.L92ED
        JMP     L8FBB

.L92F0
        LDA     L002A
        PHA
        JSR     L976C

        LDA     #$1F
        JSR     LFFEE

        PLA
        JSR     LFFEE

        JSR     L990F

        BRA     L932D

.L9304
        JSR     L9774

        JSR     L8FA8

        BEQ     L92F0

        CMP     #$29
        BNE     L92ED

        LDA     L002A
        SBC     L001E
        BEQ     L932D

        TAX
        BCS     L9325

        JSR     LBAC2

        BRA     L9321

.L931E
        JSR     L9779

.L9321
        LDX     L002A
        BEQ     L932D

.L9325
        JSR     LBDFF

        BRA     L932D

.L932A
        JSR     LBAC2

.L932D
        CLC
        BRA     L9338

.L9330
        DEC     L000A
.L9332
        JSR     L9DF3

        JSR     L9784

.L9338
        LDY     L001B
        STY     L000A
        RTS

.L933D
        LDX     L000B
        STX     L0019
        LDX     L000C
        STX     L001A
        LDX     L000A
        STX     L001B
        CMP     #$27
        BEQ     L932A

        CMP     #$8A
        BEQ     L9304

        CMP     #$89
        BEQ     L931E

.L9355
        SEC
.L9356
        RTS

.L9357
        BRK
        EQUB    $09

        EQUB    $8D,$22

        EQUB    $00

.L935C
        JSR     L8F9D

        JSR     L933D

        BCC     L9356

        CMP     #$22
        BNE     L9355

.L9368
        INY
        LDA     (L0019),Y
        CMP     #$0D
        BEQ     L9357

        CMP     #$22
        BNE     L937C

        INY
        STY     L001B
        LDA     (L0019),Y
        CMP     #$22
        BNE     L932D

.L937C
        JSR     LBDD8

        BRA     L9368

.L9381
        JSR     L9DF3

        JSR     L9781

        JSR     LBC66

        STZ     L0600
        LDY     #$00
.L938F
        PHY
        JSR     L8FA8

        BNE     L93B4

        LDY     L001B
        JSR     L99D0

        BEQ     L93C4

        PLY
        INY
        LDA     L002A
        STA     L0600,Y
        INY
        LDA     L002B
        STA     L0600,Y
        INY
        LDA     L002C
        STA     L0600,Y
        INC     L0600
        BRA     L938F

.L93B4
        PLY
        DEC     L001B
        JSR     L9C5A

        JSR     LBD26

        JSR     L93C7

        CLD
        JMP     L90CA

.L93C4
        JMP     LADCE

.L93C7
        LDA     L040C
        LSR     A
        LDA     L0404
        LDX     L0460
        LDY     L0464
        JMP     (L002A)

.L93D7
        JMP     L9C2D

.L93DA
        JSR     L9BE2

        BCC     L93D7

        JSR     LBC66

        JSR     L8DA2

        BNE     L93D7

        JSR     L9BE2

        BCC     L93D7

        JSR     L9C6A

        LDA     L002A
        STA     L0039
        LDA     L002B
        STA     L003A
        JSR     LBD26

.L93FA
        JSR     LBAC8

        JSR     L9C8E

        JSR     LBF2F

        LDA     L0039
        CMP     L002A
        LDA     L003A
        SBC     L002B
        BCS     L93FA

        JMP     L9048

.L9410
        LDA     #$0A
        JSR     LAE60

        JSR     L9BE2

        JSR     LBC66

        LDA     #$0A
        JSR     LAE60

        JSR     L8DA2

        BNE     L9433

        JSR     L9BE2

        LDA     L002B
        BNE     L947F

        LDA     L002A
        BEQ     L947F

        JMP     L9C6A

.L9433
        JMP     L9C74

.L9436
        LDA     L0012
        STA     L003B
        LDA     L0013
        STA     L003C
.L943E
        LDA     L0018
        STA     L0038
        LDY     #$01
        STY     L0037
        RTS

.L9447
        JSR     L9410

        LDX     #$39
        JSR     LBD48

        JSR     LBE25

        JSR     L9436

.L9455
        LDA     (L0037)
        BMI     L9487

        STA     (L003B)
        LDA     (L0037),Y
        STA     (L003B),Y
        SEC
        TYA
        ADC     L003B
        STA     L003B
        BCC     L9469

        INC     L003C
.L9469
        CMP     L0006
        LDA     L003C
        SBC     L0007
        BCS     L9476

        JSR     L953D

        BRA     L9455

.L9476
        BRK
        EQUB    $00

        EQUS    $CC," space"

.L947F
        BRK
        EQUB    $00

        EQUS    "Silly"

        EQUB    $00

.L9487
        JSR     L943E

.L948A
        LDA     (L0037)
        BMI     L94AA

        LDA     L003A
        STA     (L0037)
        LDA     L0039
        STA     (L0037),Y
        CLC
        LDA     L0039
        ADC     L002A
        STA     L0039
        LDA     #$00
        ADC     L003A
        AND     #$7F
        STA     L003A
        JSR     L953D

        BRA     L948A

.L94AA
        LDA     L0018
        STA     L000C
        STZ     L000B
.L94B0
        LDY     #$01
        LDA     (L000B),Y
        BMI     L951D

        LDY     #$04
        STZ     L002C
.L94BA
        LDA     (L000B),Y
        LDX     L002C
        BNE     L94C8

        CMP     #$8D
        BEQ     L94DE

        CMP     #$F4
        BEQ     L94D5

.L94C8
        INY
        CMP     #$22
        BNE     L94D1

        EOR     L002C
        STA     L002C
.L94D1
        CMP     #$0D
        BNE     L94BA

.L94D5
        LDY     #$03
        LDA     (L000B),Y
        JSR     L9CB8

        BRA     L94B0

.L94DE
        JSR     L9BEE

        JSR     L9436

.L94E4
        LDA     (L0037)
        BMI     L951F

        LDA     (L003B)
        CMP     L002B
        BNE     L950D

        LDA     (L003B),Y
        CMP     L002A
        BNE     L950D

        LDA     (L0037),Y
        STA     L003D
        LDA     (L0037)
        TAX
        LDY     L000A
        DEY
        LDA     L000B
        STA     L0039
        LDA     L000C
        STA     L003A
        JSR     L8E1F

.L9509
        LDY     L000A
        BRA     L94BA

.L950D
        CLC
        JSR     L953D

        LDA     L003B
        ADC     #$02
        STA     L003B
        BCC     L94E4

        INC     L003C
        BRA     L94E4

.L951D
        BRA     L9579

.L951F
        JSR     LBF0F

        EQUS    "Failed at "

        LDA     (L000B),Y
        STA     L002B
        INY
        LDA     (L000B),Y
        STA     L002A
        JSR     LA0E8

        JSR     LBAC2

        BRA     L9509

.L953D
        INY
        LDA     (L0037),Y
        LDY     #$01
        ADC     L0037
        STA     L0037
        BCC     L954B

        INC     L0038
        CLC
.L954B
        RTS

.L954C
        JSR     L9410

        LDA     L002A
        PHA
        JSR     LBD26

.L9555
        JSR     LBC66

        JSR     LA0EC

        JSR     LBAA4

        JSR     LBD26

        JSR     L8EA4

        LDY     #$00
        JSR     LBB38

        JSR     LBBDC

        PLA
        PHA
        CLC
        ADC     L002A
        STA     L002A
        BCC     L9555

        INC     L002B
        BPL     L9555

.L9579
        JMP     L9048

.L957C
        JMP     L96CA

.L957F
        DEC     L000A
        JSR     L997D

        BEQ     L95F1

        BCS     L95F1

        JSR     LBC83

        JSR     L9774

        JSR     LBF2F

        LDA     L002D
        ORA     L002C
        BNE     L95F1

        CLC
        LDA     L002A
        ADC     L0002
        TAY
        LDA     L002B
        ADC     L0003
        TAX
        CPY     L0004
        SBC     L0005
        BCS     L957C

        LDA     L0002
        STA     L002A
        LDA     L0003
        STA     L002B
        STY     L0002
        STX     L0003
        LDA     #$40
        STA     L0027
        JSR     LB365

        JSR     L9338

.L95BE
        JSR     L8DA2

        BEQ     L95F9

        JMP     L90C5

.L95C6
        LDX     #$3F
        JSR     LBD48

.L95CB
        LDX     #$00
        LDY     #$00
.L95CF
        LSR     L0040
        ROR     L003F
        BCC     L95E0

        CLC
        TYA
        ADC     L002A
        TAY
        TXA
        ADC     L002B
        TAX
        BCS     L95F1

.L95E0
        ASL     L002A
        ROL     L002B
        BCS     L95F1

        LDA     L003F
        ORA     L0040
        BNE     L95CF

        STY     L002A
        STX     L002B
        RTS

.L95F1
        BRK
        EQUB    $0A

        EQUS    "Bad ",$DE

        EQUB    $00

.L95F9
        JSR     L8F9D

        TYA
        CLC
        ADC     L000B
        LDX     L000C
        BCC     L9606

        INX
        CLC
.L9606
        SBC     #$00
        STA     L0037
        TXA
        SBC     #$00
        STA     L0038
        LDX     #$05
        STX     L003F
        LDX     L000A
        JSR     L9BBA

        CPY     #$01
        BEQ     L95F1

        CMP     #$28
        BEQ     L9635

        CMP     #$24
        BEQ     L9628

        CMP     #$25
        BNE     L9632

.L9628
        DEC     L003F
        INY
        INX
        LDA     (L0037),Y
        CMP     #$28
        BEQ     L9635

.L9632
        JMP     L957F

.L9635
        INY
        STX     L000A
        JSR     L8149

.L963B
        BNE     L95F1

        JSR     L9923

        LDX     #$01
        JSR     L9952

        LDA     L003F
        PHA
        LDA     #$01
        PHA
        JSR     LAE60

.L964E
        JSR     LBC66

        JSR     L9332

        LDA     L002B
        AND     #$C0
        ORA     L002C
        ORA     L002D
        BNE     L95F1

        JSR     LBF2F

        PLY
        LDA     L002A
        STA     (L0002),Y
        INY
        LDA     L002B
        STA     (L0002),Y
        INY
        PHY
        JSR     L95C6

        JSR     L8DA2

        BEQ     L964E

        CMP     #$29
        BNE     L963B

        PLX
        PLA
        PHX
        STA     L003F
        STZ     L0040
        JSR     L95CB

        PLA
        PHA
        ADC     L002A
        STA     L002A
        BCC     L968D

        INC     L002B
.L968D
        LDA     L0003
        STA     L0038
        LDA     L0002
        STA     L0037
        CLC
        ADC     L002A
        TAY
        LDA     L002B
        ADC     L0003
        BCS     L96CA

        TAX
        CPY     L0004
        SBC     L0005
        BCS     L96CA

        STY     L0002
        STX     L0003
        PLA
        STA     (L0037)
        ADC     L0037
        TAY
        LDA     #$00
        STZ     L0037
        BCC     L96B8

        INC     L0038
.L96B8
        STA     (L0037),Y
        INY
        BNE     L96BF

        INC     L0038
.L96BF
        CPY     L0002
        BNE     L96B8

        CPX     L0038
        BNE     L96B8

        JMP     L95BE

.L96CA
        BRK
        EQUB    $0B

        EQUS    $DE," space"

        EQUB    $00

.L96D4
        JSR     L977E

        LDA     L002A
        STA     L0006
        STA     L0004
        LDA     L002B
        STA     L0007
        STA     L0005
        BRA     L9700

.L96E5
        JSR     L977E

        LDA     L002A
        STA     L0000
        STA     L0002
        LDA     L002B
        STA     L0001
        STA     L0003
        JSR     LBBEB

        BRA     L9700

.L96F9
        JSR     L977E

        LDA     L002B
        STA     L0018
.L9700
        JMP     L90CA

.L9703
        JSR     L9C6A

        JSR     LBBDC

        BRA     L9700

.L970B
        JSR     L9BE2

        BCS     L971B

        CMP     #$EE
        BEQ     L972C

        CMP     #$87
        BEQ     L9735

        JSR     L9332

.L971B
        JSR     L9C6A

        LDA     L002A
        STA     L0021
        LDA     L002B
.L9724
        STA     L0022
        LDA     #$FF
.L9728
        STA     L0020
        BRA     L9700

.L972C
        INC     L000A
        JSR     L9C6A

        LDA     #$FF
        BNE     L9724

.L9735
        INC     L000A
        JSR     L9C6A

        LDA     #$00
        BRA     L9728

.L973E
        INY
        LDA     (L000B),Y
        CMP     #$24
        BEQ     L9753

        JSR     L977E

        STZ     L002E
        LDX     #$2A
        LDY     #$00
        LDA     #$02
.L9750
        JMP     LB34C

.L9753
        INC     L000A
        JSR     L9C0A

        LDA     L0027
        BNE     L979C

        LDA     #$0F
        LDY     L0036
        STY     L05FF
        LDX     #$FF
        LDY     #$05
        BRA     L9750

.L9769
        JSR     LBC91

.L976C
        JSR     LADEE

        BRA     L9784

.L9771
        JSR     L8FB4

.L9774
        JSR     L9DFF

        BRA     L9784

.L9779
        JSR     LAD78

        BRA     L9784

.L977E
        JSR     L9C0A

.L9781
        LDA     L0027
.L9783
        TAY
.L9784
        BEQ     L979C

        BPL     L979B

.L9788
        JSR     L834F

.L978B
        LDA     L0031
        STA     L002D
        LDA     L0032
        STA     L002C
        LDA     L0033
        STA     L002B
        LDA     L0034
        STA     L002A
.L979B
        RTS

.L979C
        JMP     L9155

.L979F
        JSR     LAD78

.L97A2
        BEQ     L979C

        BMI     L979B

        JMP     L828D

.L97A9
        LDA     L000B
        STA     L0019
        LDA     L000C
        STA     L001A
        LDA     L000A
        STA     L001B
        LDA     #$F2
        JSR     LB057

        JSR     L9C5A

        JMP     L90CA

.L97C0
        LDA     #$0D
        STA     (L002A)
        BRA     L97EE

.L97C6
        CPY     #$80
        BEQ     L97C0

        LDY     #$03
        LDA     #$00
        STA     (L002A),Y
        BEQ     L97EE

.L97D2
        TSX
        CPX     #$FC
        BCS     L9801

        JSR     L997D

        BEQ     L97FE

        JSR     LB1BF

        LDY     L002C
        BMI     L97C6

        JSR     LBC83

        JSR     LAC38

        STA     L0027
        JSR     LB365

.L97EE
        TSX
        INC     L0106,X
        LDY     L001B
        STY     L000A
        JSR     L8DA2

        BEQ     L97D2

        JMP     L90C5

.L97FE
        JMP     L90C7

.L9801
        BRK
        EQUB    $0C

        EQUS    "Not ",$EA

.L9808
        BRK
        EQUB    $19

        EQUS    "Bad ",$EB

        EQUB    $00

.L9810
        JSR     L9332

        LDA     L002A
        PHA
        JSR     L9771

        JSR     L9C5A

        LDA     #$12
        JSR     LFFEE

        PLA
        BRA     L986A

.L9824
        JSR     L9332

        JSR     L9C6A

        LDA     #$11
        BRA     L986A

.L982E
        JSR     L9332

        JSR     L9C6A

        JSR     LBE8B

        INX
        BNE     L9866

        INY
        BNE     L9866

        LDA     L0004
        CMP     L0006
        BNE     L9808

        LDA     L0005
        CMP     L0007
        BNE     L9808

        LDX     L002A
        LDA     #$85
        JSR     LFFF4

        CPX     L0002
        TYA
        SBC     L0003
        BCC     L9808

        CPX     L0012
        TYA
        SBC     L0013
        BCC     L9808

        STX     L0006
        STX     L0004
        STY     L0007
        STY     L0005
.L9866
        STZ     L001E
        LDA     #$16
.L986A
        JSR     LFFEE

        LDA     L002A
        BRA     L98BD

.L9871
        LDA     #$04
        BRA     L9877

.L9875
        LDA     #$05
.L9877
        PHA
        JSR     L9DF3

        JSR     L9781

        BRA     L9889

.L9880
        JSR     L9332

        LDA     L002A
        PHA
        JSR     L9771

.L9889
        JSR     LBC66

        JSR     L9771

        JSR     L9C5A

        LDA     #$19
        JSR     LFFEE

        PLA
        JSR     LFFEE

        JSR     LBD46

        LDA     L0037
        JSR     LFFEE

        LDA     L0038
        JSR     LFFEE

        JSR     L990F

        LDA     L002B
        BRA     L98BD

.L98AF
        JSR     L9C6A

        LDA     #$10
        BRA     L98BD

.L98B6
        JSR     L9C6A

        STZ     L001E
        LDA     #$0C
.L98BD
        JSR     LFFEE

.L98C0
        JMP     L90CA

.L98C3
        JSR     L9C6A

        JSR     LBAC2

        LDY     #$01
.L98CB
        LDA     (L00FD),Y
        BEQ     L98C0

        JSR     LBD77

        INY
        BNE     L98CB

        BRA     L98C0

.L98D7
        LDA     L002B
        JSR     LFFEE

.L98DC
        JSR     L8F9D

.L98DF
        CMP     #$3A
        BEQ     L990C

        CMP     #$0D
        BEQ     L990C

        CMP     #$8B
        BEQ     L990C

        DEC     L000A
        JSR     L9332

        JSR     L990F

        JSR     L8DA2

        BEQ     L98DC

        CMP     #$3B
        BEQ     L98D7

        CMP     #$7C
        BNE     L98DF

        LDA     #$00
        LDY     #$09
.L9904
        JSR     LFFEE

        DEY
        BNE     L9904

        BRA     L98DC

.L990C
        JMP     L90C5

.L990F
        LDA     L002A
        JMP     (L020E)

.L9914
        LDY     #$01
        LDA     (L0037),Y
        TAX
        LDA     #$F6
        CPX     #$F2
        BEQ     L9928

        LDA     #$F8
        BRA     L9928

.L9923
        LDY     #$01
        LDA     (L0037),Y
        ASL     A
.L9928
        LDX     #$04
.L992A
        STA     L003A
        STX     L003B
        LDA     (L003A),Y
        BEQ     L9937

        TAX
        LDA     (L003A)
        BRA     L992A

.L9937
        LDA     L0003
        STA     (L003A),Y
        LDA     L0002
        STA     (L003A)
        LDA     #$00
        STA     (L0002),Y
        INY
        CPY     L0039
        BEQ     L9979

.L9948
        LDA     (L0037),Y
        STA     (L0002),Y
        INY
        CPY     L0039
        BNE     L9948

        RTS

.L9952
        LDA     #$00
.L9954
        STA     (L0002),Y
        INY
        DEX
        BNE     L9954

.L995A
        CLC
        TYA
        ADC     L0002
        BCC     L9962

        INC     L0003
.L9962
        LDY     L0003
        CPY     L0005
        BCC     L9977

        BNE     L996E

        CMP     L0004
        BCC     L9977

.L996E
        LDA     #$00
        LDY     #$01
        STA     (L003A),Y
        JMP     L9164

.L9977
        STA     L0002
.L9979
        RTS

.L997A
        JSR     L9952

.L997D
        JSR     L99C4

        BNE     L999F

        BCS     L999F

        JSR     L9923

        LDX     #$05
        CPX     L002C
        BNE     L997A

        INX
        BRA     L997A

.L9990
        CMP     #$21
        BEQ     L99A0

        CMP     #$24
        BEQ     L99AB

        EOR     #$3F
        BEQ     L99A2

        LDA     #$00
        SEC
.L999F
        RTS

.L99A0
        LDA     #$04
.L99A2
        PHA
        INC     L001B
        JSR     L9779

        JMP     L9A99

.L99AB
        INC     L001B
        JSR     L9779

        LDA     L002B
        BEQ     L99BA

        LDA     #$80
        STA     L002C
        SEC
        RTS

.L99BA
        BRK
        EQUB    $08

        EQUS    "$ range"

        EQUB    $00

.L99C4
        LDA     L000B
        STA     L0019
        LDA     L000C
        STA     L001A
        LDY     L000A
        DEY
.L99CF
        INY
.L99D0
        LDA     (L0019),Y
        CMP     #$20
        BEQ     L99CF

.L99D6
        STY     L001B
.L99D8
        CMP     #$40
        BCC     L9990

        CMP     #$5B
        BCS     L99FA

        ASL     A
        ASL     A
        STA     L002A
        INY
        LDA     (L0019),Y
        CMP     #$25
        BNE     L99FA

        LDA     #$04
        STA     L002B
        LDX     #$04
        STX     L002C
        INY
        LDA     (L0019),Y
        CMP     #$28
        BNE     L9A67

.L99FA
        LDX     #$05
        STX     L002C
        CLC
        LDY     L001A
        LDA     L001B
        TAX
        BNE     L9A0E

        DEC     A
        ADC     L0019
        BCS     L9A14

        DEY
        BRA     L9A14

.L9A0E
        DEC     A
        ADC     L0019
        BCC     L9A14

        INY
.L9A14
        STA     L0037
        STY     L0038
        LDY     #$01
        LDA     (L0037),Y
        CMP     #$41
        BCS     L9A3A

        CMP     #$30
        BCC     L9A46

        CMP     #$3A
        BCS     L9A46

.L9A28
        INX
        INY
        LDA     (L0037),Y
        CMP     #$41
        BCS     L9A3A

        CMP     #$30
        BCC     L9A46

        CMP     #$3A
        BCC     L9A28

        BRA     L9A46

.L9A3A
        CMP     #$5B
        BCC     L9A28

        CMP     #$5F
        BCC     L9A46

        CMP     #$7B
        BCC     L9A28

.L9A46
        CPY     #$01
        BEQ     L9A76

        CMP     #$24
        BEQ     L9AA5

        CMP     #$25
        BNE     L9A58

        DEC     L002C
        INX
        INY
        LDA     (L0037),Y
.L9A58
        CMP     #$28
        BEQ     L9AA0

        JSR     L8149

        BEQ     L9A75

        STX     L001B
.L9A63
        LDY     L001B
        LDA     (L0019),Y
.L9A67
        CMP     #$21
        BEQ     L9A79

        EOR     #$3F
        BEQ     L9A7B

        CLC
        STY     L001B
        LDA     #$FF
        RTS

.L9A75
        CLC
.L9A76
        LDA     #$00
        RTS

.L9A79
        LDA     #$04
.L9A7B
        PHA
        INY
        STY     L001B
        JSR     LB1DE

        JSR     L9784

        LDA     L002B
        PHA
        LDA     L002A
        PHA
        JSR     L9779

        CLC
        PLA
        ADC     L002A
        STA     L002A
        PLA
        ADC     L002B
        STA     L002B
.L9A99
        PLA
        STA     L002C
        CLC
        LDA     #$FF
        RTS

.L9AA0
        JSR     L9AC9

        BRA     L9A63

.L9AA5
        DEC     L002C
        INX
        INY
        LDA     (L0037),Y
        CMP     #$28
        BEQ     L9ABC

        JSR     L8149

        BEQ     L9A75

        STX     L001B
.L9AB6
        LDA     #$81
        STA     L002C
        SEC
        RTS

.L9ABC
        JSR     L9AC9

        BRA     L9AB6

.L9AC1
        BRK
        EQUB    $0E

        EQUS    "Array"

        EQUB    $00

.L9AC9
        INX
        INY
        JSR     L8149

        BEQ     L9AC1

        STX     L001B
        LDA     L002C
        PHA
        LDA     L002A
        PHA
        LDA     L002B
        PHA
        LDA     (L002A)
        CMP     #$04
        BCC     L9B4C

        JSR     LAC38

        INC     L002D
.L9AE6
        JSR     LBC66

        JSR     L9774

        INC     L001B
        CPX     #$2C
        BNE     L9AC1

        LDX     #$39
        JSR     LBD48

        PLA
        STA     L0038
        PLY
        STY     L0037
        PHY
        PHA
        LDY     L003C
        JSR     L9B97

        STY     L002D
        LDA     (L0037),Y
        STA     L003F
        INY
        LDA     (L0037),Y
        STA     L0040
        LDA     L002A
        ADC     L0039
        STA     L002A
        LDA     L002B
        ADC     L003A
        STA     L002B
        JSR     L95CB

        SEC
        LDA     (L0037)
        SBC     L002D
        CMP     #$03
        BCS     L9AE6

        JSR     LBC66

        JSR     L976C

        PLA
        STA     L0038
        PLA
        STA     L0037
        LDX     #$39
        JSR     LBD48

        LDY     L003C
        JSR     L9B97

        CLC
        LDA     L0039
        ADC     L002A
        STA     L002A
        LDA     L003A
        ADC     L002B
        STA     L002B
        BCC     L9B5A

.L9B4C
        JSR     L976C

        PLA
        STA     L0038
        PLA
        STA     L0037
        LDY     #$01
        JSR     L9B97

.L9B5A
        PLA
        STA     L002C
        CMP     #$05
        BNE     L9B78

        LDX     L002B
        LDA     L002A
        ASL     L002A
        ROL     L002B
        ASL     L002A
        ROL     L002B
        ADC     L002A
        STA     L002A
        TXA
        ADC     L002B
        STA     L002B
        BRA     L9B80

.L9B78
        ASL     L002A
        ROL     L002B
        ASL     L002A
        ROL     L002B
.L9B80
        TYA
        ADC     L002A
        STA     L002A
        BCC     L9B8A

        INC     L002B
        CLC
.L9B8A
        LDA     L0037
        ADC     L002A
        STA     L002A
        LDA     L0038
        ADC     L002B
        STA     L002B
        RTS

.L9B97
        LDA     L002B
        AND     #$C0
        ORA     L002C
        ORA     L002D
        BNE     L9BAE

        LDA     L002A
        CMP     (L0037),Y
        INY
        LDA     L002B
        SBC     (L0037),Y
        BCS     L9BAE

        INY
        RTS

.L9BAE
        BRK
        EQUB    $0F

        EQUS    "Subscript"

        EQUB    $00

.L9BBA
        LDY     #$01
.L9BBC
        LDA     (L0037),Y
        CMP     #$30
        BCC     L9BDA

        CMP     #$40
        BCS     L9BD2

        CMP     #$3A
        BCS     L9BDA

        CPY     #$01
        BEQ     L9BDA

.L9BCE
        INX
        INY
        BNE     L9BBC

.L9BD2
        CMP     #$5F
        BCS     L9BDB

        CMP     #$5B
        BCC     L9BCE

.L9BDA
        RTS

.L9BDB
        CMP     #$7B
        BCC     L9BCE

        RTS

.L9BE0
        INC     L000A
.L9BE2
        LDY     L000A
        LDA     (L000B),Y
        CMP     #$20
        BEQ     L9BE0

        CMP     #$8D
        BNE     L9C08

.L9BEE
        INY
        LDA     (L000B),Y
        ASL     A
        ASL     A
        TAX
        AND     #$C0
        INY
        EOR     (L000B),Y
        STA     L002A
        TXA
        ASL     A
        ASL     A
        INY
        EOR     (L000B),Y
        STA     L002B
        INY
        STY     L000A
        SEC
        RTS

.L9C08
        CLC
        RTS

.L9C0A
        LDA     L000B
        STA     L0019
        LDA     L000C
        STA     L001A
        LDA     L000A
        STA     L001B
.L9C16
        LDY     L001B
        INC     L001B
        LDA     (L0019),Y
        CMP     #$20
        BEQ     L9C16

        CMP     #$3D
        BEQ     L9C52

.L9C24
        BRK
        EQUB    $04

        EQUS    "Mistake"

.L9C2D
        BRK
        EQUB    $10

        EQUS    "Syntax error"

.L9C3B
        BRK
        EQUB    $0D

        EQUS    "No ",$F2

.L9C41
        BRK
        EQUB    $11

        EQUS    "Escape"

        EQUB    $00

.L9C4A
        JSR     L8F92

        CMP     #$3D
        BNE     L9C24

        RTS

.L9C52
        JSR     L9DFF

.L9C55
        TXA
        LDY     L001B
        BRA     L9C74

.L9C5A
        LDY     L001B
        BRA     L9C6C

.L9C5E
        TSX
        CPX     #$FC
        BCS     L9C3B

        LDA     L01FF
        CMP     #$F2
        BNE     L9C3B

.L9C6A
        LDY     L000A
.L9C6C
        DEY
.L9C6D
        INY
        LDA     (L000B),Y
        CMP     #$20
        BEQ     L9C6D

.L9C74
        CMP     #$3A
        BEQ     L9C80

        CMP     #$0D
        BEQ     L9C80

        CMP     #$8B
        BNE     L9C2D

.L9C80
        CLC
        TYA
        ADC     L000B
        STA     L000B
        BCC     L9C8A

        INC     L000C
.L9C8A
        LDY     #$01
        STY     L000A
.L9C8E
        BIT     L00FF
        BMI     L9C41

.L9C92
        RTS

.L9C93
        JSR     L9C6A

        LDA     (L000B)
        CMP     #$3A
        BEQ     L9C92

        LDA     L000C
        CMP     #$07
        BEQ     L9CC6

.L9CA2
        LDY     #$01
        LDA     (L000B),Y
        BMI     L9CC6

        LDX     L0020
        BEQ     L9CB6

        STA     L002B
        INY
        LDA     (L000B),Y
        STA     L002A
        JSR     L9D0F

.L9CB6
        LDA     #$03
.L9CB8
        CLC
        ADC     L000B
        STA     L000B
        BCC     L9CC1

        INC     L000C
.L9CC1
        LDY     #$01
        STY     L000A
.L9CC5
        RTS

.L9CC6
        JMP     L904B

.L9CC9
        JMP     L9155

.L9CCC
        JSR     L9DF3

        BEQ     L9CC9

        BPL     L9CD6

        JSR     L9788

.L9CD6
        LDY     L001B
        STY     L000A
        LDA     L002A
        ORA     L002B
        ORA     L002C
        ORA     L002D
        BEQ     L9CFB

        CPX     #$8C
        BEQ     L9CEB

.L9CE8
        JMP     L90D0

.L9CEB
        INC     L000A
.L9CED
        JSR     L9BE2

        BCC     L9CE8

        JSR     LB866

        JSR     L9C8A

        JMP     LB753

.L9CFB
        LDY     L000A
.L9CFD
        LDA     (L000B),Y
        CMP     #$0D
        BEQ     L9D0C

        INY
        CMP     #$8B
        BNE     L9CFD

        STY     L000A
        BEQ     L9CED

.L9D0C
        JMP     L907D

.L9D0F
        LDA     L002A
        CMP     L0021
        LDA     L002B
        SBC     L0022
        BCS     L9CC5

        LDA     #$5B
        JSR     LBDD8

        JSR     LA0E8

        LDA     #$5D
        JSR     LBDD8

        JMP     LBDD2

.L9D29
        JSR     LBC3A

        JSR     L9F07

        TAY
        JSR     L97A2

        JSR     LBC24

.L9D36
        JSR     LA514

        LDA     L002E
        EOR     L003B
        BPL     L9D57

        ASL     L002E
        BRA     L9D79

.L9D43
        STY     L002D
        PLA
        STA     L002C
        PLA
        STA     L002B
        PLA
        STA     L002A
        JSR     L828A

        LDA     L003B
        EOR     #$80
        STA     L003B
.L9D57
        LDA     L003C
        CMP     L0030
        BNE     L9D75

        LDA     L003D
        CMP     L0031
        BNE     L9D75

        LDA     L003E
        CMP     L0032
        BNE     L9D75

        LDA     L003F
        CMP     L0033
        BNE     L9D75

        LDA     L0040
        SBC     L0034
        BEQ     L9D7B

.L9D75
        ROR     A
        EOR     L003B
        ROL     A
.L9D79
        LDA     #$FF
.L9D7B
        RTS

.L9D7C
        JMP     L9155

.L9D7F
        INC     L001B
.L9D81
        TXA
.L9D82
        BEQ     L9DC4

        BMI     L9D29

        LDA     L002A
        PHA
        LDA     L002B
        PHA
        LDA     L002C
        PHA
        LDA     L002D
        PHA
        JSR     L9F07

        TAY
        BMI     L9DB4

        BEQ     L9D7C

        PLA
        TAY
        EOR     L002D
        BMI     L9DBA

        CPY     L002D
        BNE     L9DBE

        PLA
        CMP     L002C
        BNE     L9DBF

        PLA
        CMP     L002B
        BNE     L9DC0

        PLA
        SBC     L002A
        BNE     L9DC1

        RTS

.L9DB4
        PLA
        TAY
        EOR     L002E
        BPL     L9D43

.L9DBA
        TYA
        EOR     #$FF
        ASL     A
.L9DBE
        PLA
.L9DBF
        PLA
.L9DC0
        PLA
.L9DC1
        LDA     #$FF
        RTS

.L9DC4
        JSR     LBC91

        JSR     L9F07

        TAY
        BNE     L9D7C

        LDA     (L0004)
        CMP     L0036
        BCC     L9DD5

        LDA     L0036
.L9DD5
        STA     L0037
.L9DD7
        CPY     L0037
        BEQ     L9DE5

        INY
        LDA     (L0004),Y
        CMP     L05FF,Y
        BEQ     L9DD7

        BRA     L9DE9

.L9DE5
        LDA     (L0004)
        CMP     L0036
.L9DE9
        PHP
        JSR     LBD21

        PLP
        BNE     L9DC1

        LDA     #$00
        RTS

.L9DF3
        LDA     L000B
        STA     L0019
        LDA     L000C
        STA     L001A
        LDA     L000A
        STA     L001B
.L9DFF
        JSR     L9E45

.L9E02
        CPX     #$84
        BEQ     L9E10

        CPX     #$82
        BEQ     L9E2A

        DEC     L001B
        TAY
        STA     L0027
        RTS

.L9E10
        JSR     L9E3F

        JSR     L9783

        LDY     #$03
.L9E18
        LDA     (L0004),Y
        ORA     L002A,Y
        STA     L002A,Y
        DEY
        BPL     L9E18

.L9E23
        JSR     LBD3A

        LDA     #$40
        BRA     L9E02

.L9E2A
        JSR     L9E3F

        JSR     L9783

        LDY     #$03
.L9E32
        LDA     (L0004),Y
        EOR     L002A,Y
        STA     L002A,Y
        DEY
        BPL     L9E32

        BRA     L9E23

.L9E3F
        JSR     L9783

        JSR     LBC66

.L9E45
        JSR     L9E6D

.L9E48
        CPX     #$80
        BEQ     L9E4D

        RTS

.L9E4D
        JSR     L9783

        JSR     LBC66

        JSR     L9E6D

        JSR     L9783

        LDY     #$03
.L9E5B
        LDA     (L0004),Y
        AND     L002A,Y
        STA     L002A,Y
        DEY
        BPL     L9E5B

        JSR     LBD3A

        LDA     #$40
        BRA     L9E48

.L9E6D
        JSR     L9F07

        CPX     #$3F
        BCS     L9E78

        CPX     #$3C
        BCS     L9E79

.L9E78
        RTS

.L9E79
        BEQ     L9E90

        CPX     #$3E
        BEQ     L9EB2

        TAX
        JSR     L9D82

.L9E83
        EOR     #$FF
.L9E85
        STA     L002A
        STA     L002B
        STA     L002C
        STA     L002D
        LDA     #$40
        RTS

.L9E90
        TAX
        LDY     L001B
        LDA     (L0019),Y
        CMP     #$3D
        BEQ     L9EA6

        CMP     #$3E
        BEQ     L9EAD

        JSR     L9D81

        BCC     L9E85

        BEQ     L9E85

        BRA     L9E83

.L9EA6
        JSR     L9D7F

        BCC     L9E85

        BRA     L9E83

.L9EAD
        JSR     L9D7F

        BRA     L9E85

.L9EB2
        TAX
        LDY     L001B
        LDA     (L0019),Y
        CMP     #$3D
        BEQ     L9EC2

        JSR     L9D81

        BCS     L9E85

        BRA     L9E83

.L9EC2
        JSR     L9D7F

        BCC     L9E83

        BEQ     L9E83

        BRA     L9E85

.L9ECB
        BRK
        EQUB    $13

        EQUS    "String too long"

        EQUB    $00

.L9EDD
        JSR     LBC91

        JSR     LA06C

        TAY
        BNE     L9F4C

        CLC
        PHX
        LDA     (L0004)
        ADC     L0036
        BCS     L9ECB

        TAX
        PHA
        LDY     L0036
.L9EF2
        LDA     L05FF,Y
        STA     L05FF,X
        DEX
        DEY
        BNE     L9EF2

        JSR     LBD12

        PLA
        STA     L0036
        PLX
        LDA     #$00
        BRA     L9F0A

.L9F07
        JSR     LA026

.L9F0A
        CPX     #$2B
        BEQ     L9F13

        CPX     #$2D
        BEQ     L9F70

        RTS

.L9F13
        TAY
        BMI     L9F4F

        BEQ     L9EDD

        JSR     LA023

        TAY
        BMI     L9F64

        BEQ     L9F4C

        CLC
        LDA     (L0004)
        ADC     L002A
        STA     L002A
        LDY     #$01
        LDA     (L0004),Y
        ADC     L002B
        STA     L002B
        INY
        LDA     (L0004),Y
        ADC     L002C
        STA     L002C
        INY
        LDA     (L0004),Y
        ADC     L002D
.L9F3B
        STA     L002D
        CLC
        LDA     L0004
        ADC     #$04
        STA     L0004
        LDA     #$40
        BCC     L9F0A

        INC     L0005
        BRA     L9F0A

.L9F4C
        JMP     L9155

.L9F4F
        JSR     LBC18

        JSR     LA70A

.L9F55
        LDX     L0027
        BRA     L9F0A

.L9F59
        JSR     LBC18

        JSR     LA704

        BRA     L9F55

.L9F61
        JSR     LAD10

.L9F64
        STX     L0027
        JSR     L8287

        LDA     L003D
        JSR     LA70D

        BRA     L9F55

.L9F70
        TAY
        BMI     L9F59

        BEQ     L9F4C

        JSR     LA023

        TAY
        BMI     L9F61

        BEQ     L9F4C

        SEC
        LDA     (L0004)
        SBC     L002A
        STA     L002A
        LDY     #$01
        LDA     (L0004),Y
        SBC     L002B
        STA     L002B
        INY
        LDA     (L0004),Y
        SBC     L002C
        STA     L002C
        INY
        LDA     (L0004),Y
        SBC     L002D
        BRA     L9F3B

.L9F9A
        JSR     L828D

.L9F9D
        JSR     L8287

        AND     L003D
        JSR     LA6EB

        BRA     L9FB6

.L9FA7
        JSR     L828D

.L9FAA
        JSR     LBC3A

        JSR     LA06C

        JSR     LBC20

        JSR     LA6E4

.L9FB6
        BRA     LA029

.L9FB8
        TAY
        BMI     L9FAA

.L9FBB
        BEQ     L9F4C

        LDA     L002B
        ASL     A
        LDA     L002C
        ADC     #$00
        BNE     L9FA7

        ADC     L002D
        BNE     L9FA7

        JSR     LA069

        TAY
        BMI     L9F9D

        BEQ     L9FBB

        LDA     L002B
        STA     L0038
        ASL     A
        LDA     L002C
        ADC     #$00
        BNE     L9F9A

        ADC     L002D
        BNE     L9F9A

        BCC     L9FE6

        JSR     LAD20

.L9FE6
        STX     L0027
        LDX     #$3D
        JSR     LBE06

        JSR     LBD26

        LDY     #$00
        LDX     #$00
.L9FF4
        LSR     L003E
        ROR     L003D
        BCC     LA00F

        CLC
        TYA
        ADC     L002A
        TAY
        TXA
        ADC     L002B
        TAX
        LDA     L003F
        ADC     L002C
        STA     L003F
        LDA     L0040
        ADC     L002D
        STA     L0040
.LA00F
        ASL     L002A
        ROL     L002B
        ROL     L002C
        ROL     L002D
        LDA     L003D
        ORA     L003E
        BNE     L9FF4

        STY     L003D
        STX     L003E
        BRA     LA04D

.LA023
        JSR     LBC66

.LA026
        JSR     LA06C

.LA029
        CPX     #$2A
        BEQ     L9FB8

        CPX     #$2F
        BCC     LA03B

        BEQ     LA03C

        CPX     #$83
        BEQ     LA04A

        CPX     #$81
        BEQ     LA05F

.LA03B
        RTS

.LA03C
        JSR     LBC36

        JSR     LA06C

        JSR     LBC1E

        JSR     LA634

        BRA     LA05B

.LA04A
        JSR     L81BD

.LA04D
        LDA     L0038
        PHP
        LDX     #$3D
.LA052
        JSR     LAAD8

        PLP
        BPL     LA05B

        JSR     LAD20

.LA05B
        LDX     L0027
        BRA     LA029

.LA05F
        JSR     L81BD

        BIT     L0037
        PHP
        LDX     #$39
        BRA     LA052

.LA069
        JSR     LBC66

.LA06C
        JSR     LAD78

.LA06F
        PHA
.LA070
        LDY     L001B
        INC     L001B
        LDA     (L0019),Y
        CMP     #$20
        BEQ     LA070

        TAX
        PLA
        CPX     #$5E
        BEQ     LA081

        RTS

.LA081
        JSR     LBC36

        JSR     LAD78

        BMI     LA09F

        BEQ     LA081

        LDA     L002A
        ASL     A
        LDA     #$00
        ADC     L002B
        BNE     LA09C

        ADC     L002C
        BNE     LA09C

        ADC     L002D
        BEQ     LA0C7

.LA09C
        JSR     L828D

.LA09F
        LDA     L0030
        BEQ     LA0C5

        CMP     #$87
        BCS     LA0D1

        CMP     #$81
        BCC     LA0D1

        ORA     #$78
        TAY
        LDA     L0032
        ORA     L0033
        ORA     L0034
        BNE     LA0D1

        LDA     L0031
.LA0B8
        LSR     A
        BCS     LA0D1

        INY
        BMI     LA0B8

        LDY     L002E
        BPL     LA0C5

        EOR     #$FF
        INC     A
.LA0C5
        STA     L002A
.LA0C7
        JSR     LA56D

        LDA     L002A
        JSR     LA5F9

        BRA     LA06F

.LA0D1
        LDA     #$71
        JSR     LA547

        JSR     LA56D

        JSR     LA7AF

        LDA     #$71
        LDY     #$04
        JSR     LA9C3

        JSR     LAA1A

        BRA     LA06F

.LA0E8
        LDA     #$00
        BRA     LA0EE

.LA0EC
        LDA     #$05
.LA0EE
        STA     L0014
        LDX     #$04
.LA0F2
        STZ     L003F,X
        SEC
.LA0F5
        LDA     L002A
        SBC     L80E2,X
        TAY
        LDA     L002B
        SBC     L80DD,X
        BCC     LA10A

        STA     L002B
        STY     L002A
        INC     L003F,X
        BRA     LA0F5

.LA10A
        DEX
        BPL     LA0F2

        LDX     #$05
.LA10F
        DEX
        BEQ     LA116

        LDA     L003F,X
        BEQ     LA10F

.LA116
        STX     L0037
        LDA     L0014
        BEQ     LA126

        SBC     L0037
        BEQ     LA126

        TAX
        JSR     LBDFF

        LDX     L0037
.LA126
        LDA     L003F,X
        ORA     #$30
        JSR     LBDD4

        DEX
        BPL     LA126

        RTS

.LA131
        TYA
        BPL     LA137

        JSR     L9788

.LA137
        LDX     #$00
        LDY     #$00
.LA13B
        LDA     L002A,Y
        PHA
        AND     #$0F
        STA     L003F,X
        PLA
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        INX
        STA     L003F,X
        INX
        INY
        CPY     #$04
        BNE     LA13B

.LA151
        DEX
        BEQ     LA158

        LDA     L003F,X
        BEQ     LA151

.LA158
        LDA     L003F,X
        CMP     #$0A
        BCC     LA160

        ADC     #$06
.LA160
        ADC     #$30
        JSR     LA2CC

        DEX
        BPL     LA158

        RTS

.LA169
        LDA     L002E
        BPL     LA174

        LDA     #$2D
        STZ     L002E
        JSR     LA2CC

.LA174
        LDA     L0030
        CMP     #$81
        BCS     LA1C1

        JSR     LA46B

        DEC     L0048
        BRA     LA174

.LA181
        LDX     L0402
        CPX     #$03
        BCC     LA18A

        LDX     #$00
.LA18A
        STX     L0037
        LDA     L0401
        BEQ     LA197

        CMP     #$0A
        BCS     LA19B

        BRA     LA19D

.LA197
        CPX     #$02
        BEQ     LA19D

.LA19B
        LDA     #$0A
.LA19D
        STA     L0038
        STA     L004D
        STZ     L0036
        STZ     L0048
        BIT     L0015
        BMI     LA131

        TYA
        BMI     LA1AF

        JSR     L828D

.LA1AF
        LDA     L0031
        BNE     LA169

        LDA     L0037
        BNE     LA21C

        LDA     #$30
        JMP     LA2CC

.LA1BC
        JSR     LA622

        BRA     LA1D0

.LA1C1
        CMP     #$84
        BCC     LA1D4

        BNE     LA1CD

        LDA     L0031
        CMP     #$A0
        BCC     LA1D4

.LA1CD
        JSR     LA4BA

.LA1D0
        INC     L0048
        BRA     LA174

.LA1D4
        JSR     LA3ED

        LDA     L004D
        STA     L0038
        LDX     L0037
        CPX     #$02
        BNE     LA1EF

        ADC     L0048
        BMI     LA220

        CMP     #$0B
        BCC     LA1ED

        LDA     #$0A
        STZ     L0037
.LA1ED
        STA     L0038
.LA1EF
        LDA     L0038
        EOR     #$FF
        LSR     A
        PHP
        ASL     A
        ASL     A
        ADC     #$BC
        JSR     LA572

        DEC     L0030
        PLP
        BCC     LA204

        JSR     LA46B

.LA204
        JSR     L8429

.LA207
        LDA     L0030
        CMP     #$84
        BCS     LA212

        JSR     LA4A9

        BNE     LA207

.LA212
        LDA     L0031
        CMP     #$A0
        BCS     LA1BC

        LDA     L0038
        BNE     LA22A

.LA21C
        CMP     #$01
        BEQ     LA261

.LA220
        JSR     LA72B

        STZ     L0048
        LDA     L004D
        INC     A
        STA     L0038
.LA22A
        LDA     #$01
        CMP     L0037
        BEQ     LA261

        LDY     L0048
        BMI     LA23E

        CPY     L0038
        BCS     LA261

        STZ     L0048
        INY
        TYA
        BNE     LA261

.LA23E
        LDA     L0037
        CMP     #$02
        BEQ     LA24A

        LDA     #$01
        CPY     #$FF
        BNE     LA261

.LA24A
        LDA     #$30
        JSR     LA2CC

        LDA     #$2E
        JSR     LA2CC

        LDA     #$30
.LA256
        INC     L0048
        BEQ     LA25F

        JSR     LA2CC

        BRA     LA256

.LA25F
        LDA     #$80
.LA261
        STA     L004D
.LA263
        JSR     LA40A

        DEC     L004D
        BNE     LA26F

        LDA     #$2E
        JSR     LA2CC

.LA26F
        DEC     L0038
        BNE     LA263

        LDY     L0037
        DEY
        BEQ     LA290

        DEY
        BEQ     LA28C

        LDY     L0036
.LA27D
        DEY
        LDA     L0600,Y
        CMP     #$30
        BEQ     LA27D

        CMP     #$2E
        BEQ     LA28A

        INY
.LA28A
        STY     L0036
.LA28C
        LDA     L0048
        BEQ     LA2B7

.LA290
        LDA     #$45
        JSR     LA2CC

        LDA     L0048
        BPL     LA2A3

        LDA     #$2D
        JSR     LA2CC

        SEC
        LDA     #$00
        SBC     L0048
.LA2A3
        JSR     LA2B8

        LDA     L0037
        BEQ     LA2B7

        LDA     #$20
        LDY     L0048
        BMI     LA2B3

        JSR     LA2CC

.LA2B3
        CPX     #$00
        BEQ     LA2CC

.LA2B7
        RTS

.LA2B8
        LDX     #$FF
        SEC
.LA2BB
        INX
        SBC     #$0A
        BCS     LA2BB

        ADC     #$0A
        PHA
        TXA
        BEQ     LA2C9

        JSR     LA2CA

.LA2C9
        PLA
.LA2CA
        ORA     #$30
.LA2CC
        PHX
        LDX     L0036
        STA     L0600,X
        PLX
        INC     L0036
        RTS

.LA2D6
        CLC
        LDA     #$FF
        JMP     L82DD

        RTS

.LA2DD
        STZ     L0031
        STZ     L0032
        STZ     L0033
        STZ     L0034
        STZ     L0035
        STZ     L0047
        STZ     L0048
        LDX     #$FF
        STX     L0049
        CMP     #$2E
        BEQ     LA348

        CMP     #$3A
        BCS     LA2D6

        SBC     #$2F
        BMI     LA2D6

.LA2FB
        STA     L0035
.LA2FD
        LDA     L0047
        BEQ     LA303

        DEC     L0048
.LA303
        INY
        LDA     (L0019),Y
        CMP     #$3A
        BCS     LA34C

        SBC     #$2F
        BCC     LA342

        STA     L0042
        LDX     L0049
        BPL     LA325

        LDA     L0035
        ASL     A
        ASL     A
        ADC     L0035
        ASL     A
        ADC     L0042
        CMP     #$19
        BCC     LA2FB

        STZ     L0049
        BRA     LA2FB

.LA325
        CPX     #$02
        BCS     LA33E

        JSR     LA419

        CMP     #$19
        BCC     LA333

        INC     L0049
        CLC
.LA333
        LDA     L0042
        ADC     L0035
        BCC     LA2FB

        JSR     LA503

        BRA     LA2FB

.LA33E
        INC     L0048
        BRA     LA2FD

.LA342
        EOR     #$FE
        ORA     L0047
        BNE     LA357

.LA348
        INC     L0047
        BRA     LA303

.LA34C
        CMP     #$45
        BNE     LA357

        JSR     LA3B5

        ADC     L0048
        STA     L0048
.LA357
        STY     L001B
        LDY     L0031
        BNE     LA385

        LDA     L0032
        BMI     LA385

        STA     L002D
        BEQ     LA36B

        LDA     L0048
        ORA     L0047
        BNE     LA385

.LA36B
        LDA     L0035
        STA     L002A
        LDA     L0034
        STA     L002B
        LDA     L0033
        STA     L002C
        LDA     L0048
        BNE     LA37E

        INC     A
        SEC
        RTS

.LA37E
        JSR     L828D

        BNE     LA393

        BRA     LA3AA

.LA385
        LDA     #$A8
        STA     L0030
        STZ     L002E
        STZ     L002F
        TYA
        STA     L0031
        JSR     L8304

.LA393
        LDY     L0048
        BMI     LA3A1

        BEQ     LA3A7

.LA399
        JSR     LA46B

        DEY
        BNE     LA399

        BRA     LA3A7

.LA3A1
        JSR     LA4BA

        INY
        BNE     LA3A1

.LA3A7
        JSR     LA712

.LA3AA
        SEC
        LDA     #$FF
        RTS

.LA3AE
        JSR     LA3C0

        EOR     #$FF
        SEC
        RTS

.LA3B5
        INY
        LDA     (L0019),Y
        CMP     #$2D
        BEQ     LA3AE

        CMP     #$2B
        BNE     LA3C3

.LA3C0
        INY
        LDA     (L0019),Y
.LA3C3
        CMP     #$3A
        BCS     LA3E9

        SBC     #$2F
        BCC     LA3E9

        STA     L0049
        INY
        LDA     (L0019),Y
        CMP     #$3A
        BCS     LA3E5

        SBC     #$2F
        BCC     LA3E5

        INY
        STA     L0042
        LDA     L0049
        ASL     A
        ASL     A
        ADC     L0049
        ASL     A
        ADC     L0042
        RTS

.LA3E5
        LDA     L0049
        CLC
        RTS

.LA3E9
        LDA     #$00
        CLC
        RTS

.LA3ED
        LDA     L002E
        STA     L003B
        LDA     L0030
        STA     L003C
        LDA     L0031
        STA     L003D
        LDA     L0032
        STA     L003E
        LDA     L0033
        STA     L003F
        LDA     L0034
        STA     L0040
        LDA     L0035
        STA     L0041
        RTS

.LA40A
        LDA     L0031
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     LA2CA

        LDA     #$F0
        TRB     L0031
        LDX     #$01
.LA419
        ASL     L0035
        ROL     L0034
        ROL     L0033
        TXA
        BEQ     LA42C

        ROL     L0032
        ROL     L0031
.LA426
        LDA     L0031
        PHA
        LDA     L0032
        PHA
.LA42C
        LDA     L0033
        PHA
        LDA     L0034
        PHA
        LDA     L0035
        CPX     #$00
        BMI     LA47A

        BNE     LA446

        ASL     A
        ROL     L0034
        ROL     L0033
        ASL     A
        ROL     L0034
        ROL     L0033
        BRA     LA452

.LA446
        ASL     A
        ROL     L0034
        ROL     L0033
        ROL     L0032
        ROL     L0031
        DEX
        BPL     LA446

.LA452
        ADC     L0035
        STA     L0035
        PLA
        ADC     L0034
        STA     L0034
        PLA
        ADC     L0033
        STA     L0033
        INX
        BNE     LA4B9

        PLA
        ADC     L0032
        STA     L0032
        PLA
        BRA     LA4A3

.LA46B
        CLC
        LDA     L0030
        ADC     #$03
        LDX     #$FE
        STA     L0030
        BCC     LA426

        INC     L002F
        BRA     LA426

.LA47A
        LSR     L0031
        ROR     L0032
        ROR     L0033
        ROR     L0034
        ROR     A
        INX
        BNE     LA47A

        DEX
        BRA     LA452

.LA489
        LDA     L0035
        ADC     L0041
        STA     L0035
        LDA     L0034
        ADC     L0040
        STA     L0034
        LDA     L0033
        ADC     L003F
        STA     L0033
        LDA     L0032
        ADC     L003E
        STA     L0032
        LDA     L003D
.LA4A3
        ADC     L0031
        STA     L0031
        BCC     LA4B9

.LA4A9
        ROR     L0031
        ROR     L0032
        ROR     L0033
        ROR     L0034
        ROR     L0035
        INC     L0030
        BNE     LA4B9

        INC     L002F
.LA4B9
        RTS

.LA4BA
        CLC
        LDA     #$FC
        TAX
        ADC     L0030
        BCS     LA4C4

        DEC     L002F
.LA4C4
        STA     L0030
        JSR     LA426

        DEX
        JSR     LA426

        INX
.LA4CE
        LDA     L0034,X
        ROL     A
        LDA     L0033,X
        ADC     L0035
        STA     L0035
        LDA     L0032,X
        ADC     L0034
        STA     L0034
        LDA     L0031,X
        ADC     L0033
        STA     L0033
        TXA
        BEQ     LA4E8

        LDA     L0031
.LA4E8
        ADC     L0032
        STA     L0032
        BCC     LA4F5

        INC     L0031
        BNE     LA4F5

        JSR     LA4A9

.LA4F5
        DEX
        BPL     LA4CE

        LDA     L0032
        ROL     A
        LDA     L0031
        ADC     L0035
        STA     L0035
        BCC     LA513

.LA503
        INC     L0034
        BNE     LA513

.LA507
        INC     L0033
        BNE     LA513

.LA50B
        INC     L0032
        BNE     LA513

        INC     L0031
        BEQ     LA4A9

.LA513
        RTS

.LA514
        STZ     L0041
        LDY     #$04
        LDA     (L004A),Y
        STA     L0040
        DEY
        LDA     (L004A),Y
        STA     L003F
        DEY
        LDA     (L004A),Y
        STA     L003E
        DEY
        LDA     (L004A),Y
        STA     L003B
        TAY
        LDA     (L004A)
        STA     L003C
        BNE     LA53B

        TYA
        ORA     L003E
        ORA     L003F
        ORA     L0040
        BEQ     LA53E

.LA53B
        TYA
        ORA     #$80
.LA53E
        STA     L003D
        RTS

.LA541
        LDA     #$76
        BRA     LA547

.LA545
        LDA     #$6C
.LA547
        STA     L004A
        LDA     #$04
        STA     L004B
.LA54D
        LDA     L0030
        STA     (L004A)
        LDY     #$01
        LDA     L002E
        EOR     L0031
        AND     #$80
        EOR     L0031
        STA     (L004A),Y
        LDA     L0032
        INY
        STA     (L004A),Y
        LDA     L0033
        INY
        STA     (L004A),Y
        LDA     L0034
        INY
        STA     (L004A),Y
        RTS

.LA56D
        JSR     LBC24

        BRA     LA57E

.LA572
        LDY     #$BF
        BRA     LA57A

.LA576
        LDA     #$6C
        LDY     #$04
.LA57A
        STA     L004A
        STY     L004B
.LA57E
        STZ     L0035
        STZ     L002F
        LDY     #$04
        LDA     (L004A),Y
        STA     L0034
        DEY
        LDA     (L004A),Y
        STA     L0033
        DEY
        LDA     (L004A),Y
        STA     L0032
        DEY
        LDA     (L004A),Y
        STA     L002E
        TAY
        LDA     (L004A)
        STA     L0030
        BNE     LA5A7

        TYA
        ORA     L0032
        ORA     L0033
        ORA     L0034
        BEQ     LA5AA

.LA5A7
        TYA
        ORA     #$80
.LA5AA
        STA     L0031
        RTS

.LA5AD
        CLC
        LDA     L004C
        ADC     #$05
.LA5B2
        STA     L004C
.LA5B4
        LDY     #$BF
.LA5B6
        STA     L004A
        STY     L004B
.LA5BA
        RTS

.LA5BB
        LDA     #$6C
.LA5BD
        LDY     #$04
        BRA     LA5B6

.LA5C1
        JSR     LAD10

.LA5C4
        JSR     LA545

        JSR     LA5F4

        INC     L0030
.LA5CC
        JSR     LAD10

.LA5CF
        STZ     L003B
.LA5D1
        LDY     #$80
        STY     L003D
        INY
        STY     L003C
        STZ     L003E
        STZ     L003F
        STZ     L0040
        STZ     L0041
        JMP     LA70F

.LA5E3
        JSR     LA5CC

        LDX     L0031
        BEQ     LA5BA

        DEC     L0030
        JSR     LA545

        TXA
        EOR     L002E
.LA5F2
        STA     L002E
.LA5F4
        JSR     LA5CF

        BRA     LA634

.LA5F9
        LDX     #$00
        TAY
        BEQ     LA622

        BPL     LA608

        DEC     A
        EOR     #$FF
        PHA
        JSR     LA62F

.LA607
        PLA
.LA608
        LSR     A
        BEQ     LA61D

        PHA
        BCC     LA612

        INX
        JSR     LBC3A

.LA612
        JSR     LA6CE

        BRA     LA607

.LA617
        JSR     LBC24

        JSR     LA6E4

.LA61D
        DEX
        BPL     LA617

        TXA
        RTS

.LA622
        LDA     #$80
        STA     L0031
        INC     A
        STA     L0030
        JMP     LA72F

.LA62C
        JMP     L81EA

.LA62F
        LDA     #$B9
.LA631
        JSR     LA5B4

.LA634
        LDA     L0031
        BEQ     LA62C

        JSR     LA514

        BNE     LA640

        JMP     LA72B

.LA640
        LDA     L003B
        EOR     L002E
        STA     L002E
        SEC
        LDA     L003C
        ADC     #$81
        ROL     L002F
        SBC     L0030
        BCS     LA653

        DEC     L002F
.LA653
        STA     L0030
        LDA     L003D
        CLC
        LDY     #$04
        STY     L003C
.LA65C
        LDX     #$08
.LA65E
        BCS     LA676

        CMP     L0031
        BNE     LA674

        LDY     L003E
        CPY     L0032
        BNE     LA674

        LDY     L003F
        CPY     L0033
        BNE     LA674

        LDY     L0040
        CPY     L0034
.LA674
        BCC     LA68D

.LA676
        TAY
        LDA     L0040
        SBC     L0034
        STA     L0040
        LDA     L003F
        SBC     L0033
        STA     L003F
        LDA     L003E
        SBC     L0032
        STA     L003E
        TYA
        SBC     L0031
        SEC
.LA68D
        ROL     L003B
        ASL     L0040
        ROL     L003F
        ROL     L003E
        ROL     A
        DEX
        BNE     LA65E

        LDX     L003B
        PHX
        DEC     L003C
        BNE     LA65C

        PLX
        ROR     A
.LA6A2
        LSR     L0031
        STX     L0034
        LDX     #$03
.LA6A8
        CMP     L0031
        BCC     LA6AE

        SBC     L0031
.LA6AE
        PHP
        ASL     A
        DEX
        BNE     LA6A8

        PLP
        ROR     A
        PLP
        ROR     A
        PLP
        ROR     A
        STA     L0035
        PLA
        STA     L0033
        PLA
        STA     L0032
        PLA
        STA     L0031
.LA6C4
        BMI     LA712

        JSR     L8306

        BRA     LA712

.LA6CB
        JSR     LA545

.LA6CE
        JSR     LA3ED

        LDA     L0030
        BEQ     LA72B

        STZ     L0034
        ASL     L0040
        BCC     LA6ED

        INC     L0033
        BNE     LA6ED

        JSR     LA50B

        BRA     LA6ED

.LA6E4
        LDA     L0031
        BEQ     LA73B

        JSR     LA514

.LA6EB
        BEQ     LA72B

.LA6ED
        JSR     LA73E

        BRA     LA712

.LA6F2
        BRK
        EQUB    $14

        EQUS    "Too big"

        EQUB    $00

.LA6FC
        JSR     LA901

.LA6FF
        LDA     #$90
        JSR     LA5B4

.LA704
        LDA     L0031
        EOR     L002E
        STA     L002E
.LA70A
        JSR     LA514

.LA70D
        BEQ     LA73B

.LA70F
        JSR     L8429

.LA712
        LDA     L0035
        BPL     LA725

        ASL     A
        BNE     LA71E

        ROL     A
        AND     L0034
        BNE     LA725

.LA71E
        INC     L0034
        BNE     LA725

        JSR     LA507

.LA725
        LDA     L002F
        BEQ     LA739

        BPL     LA6F2

.LA72B
        STZ     L0030
        STZ     L0031
.LA72F
        STZ     L002E
.LA731
        STZ     L002F
        STZ     L0032
        STZ     L0033
        STZ     L0034
.LA739
        STZ     L0035
.LA73B
        LDA     #$FF
.LA73D
        RTS

.LA73E
        CLC
        LDA     L0030
        ADC     L003C
        ROL     L002F
        SBC     #$7F
        STA     L0030
        BCS     LA74D

        DEC     L002F
.LA74D
        LDA     L002E
        EOR     L003B
        STA     L002E
        PHX
        LDX     #$F8
        LDY     #$04
.LA758
        LDA     L0039,X
        STZ     L0039,X
        STA     L0041,Y
        INX
        DEY
        BNE     LA758

        STZ     L003C
        STZ     L003B
        STZ     L003A
        BRA     LA79B

.LA76B
        PHX
        LSR     L003D
        ROR     L003E
        ROR     L003F
        ROR     L0040
        ROR     L0041
.LA776
        ASL     L0046,X
        BCC     LA797

        CLC
        TYA
        ADC     L0042,X
        TAY
        LDA     L0034
        ADC     L0041,X
        STA     L0034
        LDA     L0033
        ADC     L0040,X
        STA     L0033
        LDA     L0032
        ADC     L003F,X
        STA     L0032
        LDA     L0031
        ADC     L003E,X
        STA     L0031
.LA797
        INX
        BMI     LA776

        PLX
.LA79B
        LDA     L0046,X
        BNE     LA76B

        INX
        BMI     LA79B

        PLX
        STY     L0035
        LDA     L0031
        BMI     LA73D

        JMP     L8306

.LA7AC
        JSR     L979F

.LA7AF
        LDA     L0031
        EOR     L002E
        BMI     LA7CD

        BRK
        EQUB    $16

        EQUS    "Log range"

.LA7C0
        BRK
        EQUB    $15

        EQUS    "-ve roo"

.LA7C9
        EQUS    "t"

        EQUB    $00,$86,$8E

.LA7CD
        LDY     #$80
        LDX     L0030
        BEQ     LA7DB

        LDA     L0031
        CMP     #$B5
        BCS     LA7DB

        DEX
        INY
.LA7DB
        PHX
        STY     L0030
        JSR     LA5E3

        LDA     L0030
        BEQ     LA7EF

        CMP     #$6E
        BCC     LA7ED

        CLC
        JSR     LA8B9

.LA7ED
        INC     L0030
.LA7EF
        JSR     LA545

        PLA
        EOR     #$80
        BEQ     LA805

        JSR     L82E6

        LDA     #$9F
        JSR     LA5B4

        JSR     LA9A3

        JSR     LA712

.LA805
        JMP     LAD10

.LA808
        JSR     L979F

.LA80B
        LDA     L0031
        BEQ     LA805

        LDA     L002E
        BMI     LA7C0

        LDA     L0030
        LSR     A
        PHP
        ADC     #$41
        STA     L0030
        LDA     L0031
        PLP
        BCC     LA829

        LSR     A
        ROR     L0032
        ROR     L0033
        ROR     L0034
        ROR     L0035
.LA829
        STZ     L003E
        STZ     L003F
        LDX     #$68
        SEC
        SBC     #$90
        BCS     LA838

        ADC     #$50
        LDX     #$48
.LA838
        STA     L0031
        TXA
        LDX     #$FC
        LDY     #$0C
.LA83F
        STA     L0041,X
.LA841
        ASL     L0033
        ROL     L0032
        ROL     L0031
        LDA     L0031
        CMP     L003D
        BNE     LA857

        LDA     L0032
        CMP     L003E
        BNE     LA857

        LDA     L0033
        CMP     L003F
.LA857
        BCC     LA875

        LDA     L0033
        SBC     L003F
        STA     L0033
        LDA     L0032
        SBC     L003E
        STA     L0032
        LDA     L0031
        SBC     L003D
        STA     L0031
        TYA
        CLC
        ADC     L0041,X
        BCC     LA878

        INC     L0040,X
        BRA     LA878

.LA875
        TYA
        EOR     L0041,X
.LA878
        STA     L0041,X
        TYA
        LSR     A
        TAY
        BNE     LA841

        LDY     L0040,X
        PHY
        CPX     #$FD
        BNE     LA88A

        LDA     L0034
        STA     L0033
.LA88A
        BCS     LA899

        PLY
        LDY     #$04
.LA88F
        ASL     L0035
        ROL     L0034
        ROL     A
        DEY
        BNE     LA88F

        TSB     L0033
.LA899
        LDA     #$80
        LDY     #$C0
        INX
        BNE     LA83F

        LDX     L003D
        LDA     L0031
        STX     L0031
        LDX     L0040
        ASL     A
        CMP     L0031
        BCC     LA8B0

        SBC     L0031
        INX
.LA8B0
        JMP     LA6A2

.LA8B3
        LDX     #$CA
        DEC     L0030
        BRA     LA8BB

.LA8B9
        LDX     #$E7
.LA8BB
        PHP
        JSR     LA6CB

        PLP
        ROR     L002E
        TXA
        JSR     LAA55

        DEC     A
        DEC     A
        STA     L0047
        TXA
        INY
        CLC
.LA8CD
        ADC     #$0A
        DEY
        BPL     LA8CD

        ADC     #$F1
        STA     L004C
        LDA     #$BE
        JSR     LA631

        JSR     LA541

        BRA     LA8EE

.LA8E0
        JSR     LA5AD

        JSR     LA634

        LDA     #$76
        JSR     LA5BD

        JSR     LA70A

.LA8EE
        JSR     LA5AD

        JSR     LA70A

        INC     L0047
        BMI     LA8E0

        JSR     LA5BB

        JSR     LA634

        JMP     LA70A

.LA901
        JSR     L979F

        LDA     L002E
        PHA
        JSR     LA6CB

        JSR     LA5CC

        LDA     L0031
        BEQ     LA948

        JSR     LA80B

        JSR     LA634

        BRA     LA91F

.LA919
        JSR     L979F

        LDA     L002E
        PHA
.LA91F
        STZ     L002E
        LDA     #$C7
        JSR     LAA55

        PHP
        BNE     LA92D

        JSR     LA5E3

        SEC
.LA92D
        BCS     LA932

        JSR     LA62F

.LA932
        LDA     L0030
        CMP     #$6D
        BCC     LA93B

        JSR     LA8B9

.LA93B
        PLP
        BNE     LA946

        INC     L0030
        JSR     LA6FF

        DEC     L0030
        SEC
.LA946
        BCS     LA94B

.LA948
        JSR     LA6FF

.LA94B
        PLA
        JMP     LAD14

.LA94F
        JSR     LA9D1

        BRA     LA959

.LA954
        JSR     LA9D1

        INC     L0049
.LA959
        LSR     L0049
        BCC     LA962

        JSR     LA5C4

        BRA     LA965

.LA962
        JSR     LA5F4

.LA965
        LSR     L0049
        BCS     LA978

.LA969
        TAY
        RTS

.LA96B
        JSR     LA9D1

        JSR     LA5F2

        LSR     L0049
        BCC     LA969

        JSR     LA62F

.LA978
        JMP     LAD10

.LA97B
        JSR     LA545

        LDA     L0030
        LDX     #$00
.LA982
        DEY
        STX     L0031,Y
        CMP     LA7C9,Y
        BCC     LA982

        LDA     L004C
        JSR     LA9C1

        LDA     L002E
        STA     L003B
        JSR     LA5D1

        DEC     L0030
        JSR     L9788

        STA     L0049
        JSR     L828D

        JSR     LA5AD

.LA9A3
        JSR     LA514

        LDY     #$05
        LDA     (L004A),Y
        STA     L0041
        JSR     LA73E

        JSR     LA5BB

        JMP     LA704

.LA9B5
        JSR     L979F

        LDA     #$CA
        BRA     LA9C1

.LA9BC
        JSR     LA7AC

        LDA     #$82
.LA9C1
        LDY     #$BF
.LA9C3
        STY     L004B
        STA     L004A
        JMP     LA6E4

.LA9CA
        JSR     L979F

        LDA     #$CF
        BRA     LA9C1

.LA9D1
        JSR     L979F

        LDA     #$8B
        JSR     LAA50

        BCC     LAA07

        BNE     LA9E0

        JSR     LA97B

.LA9E0
        LDA     #$6E
        CMP     L0030
        BCS     LA9F2

        JSR     LA8B3

        JSR     LA545

        INC     L046C
.LA9EF
        JMP     LA6CE

.LA9F2
        JSR     LA545

.LA9F5
        JMP     LA72B

.LA9F8
        LDA     L002E
        BMI     LA9F5

        BRK
        EQUB    $18

        EQUS    "Exp range"

.LAA07
        BRK
        EQUB    $17

        EQUS    "Accuracy lost"

        EQUB    $00

.LAA17
        JSR     L979F

.LAA1A
        LDA     #$9A
        JSR     LAA50

        BCC     LA9F8

        BNE     LAA2C

        LDA     L0030
        INC     A
        AND     #$08
        BEQ     LAA2C

        DEC     L0030
.LAA2C
        DEC     A
        PHA
        BEQ     LAA33

        JSR     LA97B

.LAA33
        LDA     L0030
        CMP     #$6A
        BCS     LAA3E

        JSR     LA5CF

        BRA     LAA44

.LAA3E
        JSR     LA8B3

        JSR     LA5C1

.LAA44
        CLC
        LDA     L0030
        ADC     L0049
        STA     L0030
        PLA
        DEC     A
        BPL     LA9EF

        RTS

.LAA50
        JSR     LA5B2

        STZ     L0049
.LAA55
        PHX
        TAX
        LDY     #$01
.LAA59
        DEX
        LDA     LBF00,X
        CMP     L0030
        BNE     LAA66

        LDA     LBEFE,X
        CMP     L0031
.LAA66
        BCS     LAA6B

        DEY
        BPL     LAA59

.LAA6B
        PLX
        TYA
        RTS

.LAA6E
        JSR     L9779

        LDA     #$81
        LDX     L002A
        LDY     L002B
        JMP     LFFF4

.LAA7A
        JSR     L83D3

.LAA7D
        STZ     L002E
        STZ     L002F
        STZ     L0035
        LDA     #$80
        STA     L0030
        EOR     L000D
        STA     L0034
        EOR     L000E
        STA     L0033
        EOR     L000F
        STA     L0032
        EOR     L0010
        STA     L0031
        JMP     LA6C4

.LAA9A
        INC     L001B
        JSR     L976C

        LDA     L002D
        BMI     LAAC1

        ORA     L002C
        ORA     L002B
        BNE     LAAB0

        LDA     L002A
        BEQ     LAA7D

        DEC     A
        BEQ     LAA7A

.LAAB0
        JSR     LAA7A

        JSR     L828A

        JSR     LA73E

        JSR     L9788

        JSR     LBF2F

        BRA     LAAE8

.LAAC1
        LDX     #$0D
        JSR     LBE06

        LDA     #$40
        STA     L0011
        RTS

.LAACB
        LDY     L001B
        LDA     (L0019),Y
        CMP     #$28
        BEQ     LAA9A

        JSR     L83D3

        LDX     #$0D
.LAAD8
        LDA     L0000,X
        STA     L002A
        LDA     L0001,X
        STA     L002B
        LDA     L0002,X
        STA     L002C
        LDA     L0003,X
        STA     L002D
.LAAE8
        LDA     #$40
        RTS

.LAAEB
        JSR     L9779

        LDX     #$03
.LAAF0
        LDA     L002A,X
        EOR     #$FF
        STA     L002A,X
        DEX
        BPL     LAAF0

        BRA     LAAE8

.LAAFB
        JSR     LAB14

        STX     L002A
        RTS

.LAB01
        JSR     L9779

        JSR     L93C7

        STA     L002A
        STX     L002B
        STY     L002C
        PHP
        PLA
        STA     L002D
        CLD
        BRA     LAAE8

.LAB14
        LDA     #$86
        JSR     LFFF4

        TYA
.LAB1A
        JMP     LAE60

.LAB1D
        LDA     #$02
        BRA     LAB23

.LAB21
        LDA     #$00
.LAB23
        PHA
        JSR     LBA7A

        LDX     #$2A
        PLA
        JSR     LFFDA

        BRA     LAAE8

.LAB2F
        JSR     LBA7A

        JSR     LFFD7

        BRA     LAB1A

.LAB37
        LDA     #$40
        BRA     LAB41

.LAB3B
        LDA     #$80
        BRA     LAB41

.LAB3F
        LDA     #$C0
.LAB41
        PHA
        JSR     LAD78

        BNE     LAB9D

        JSR     LBE6B

        LDX     #$00
        LDY     #$06
        PLA
        JSR     LFFCE

        BRA     LAB1A

.LAB54
        STZ     L0031
        JSR     LA6FF

        INC     L0030
        RTS

.LAB5C
        JSR     LAD78

        BNE     LAB9D

        INC     L0036
        LDY     L0036
        LDA     #$0D
        STA     L05FF,Y
        JSR     LBC91

        LDA     L0019
        PHA
        LDA     L001A
        PHA
        LDA     L001B
        PHA
        LDY     L0004
        LDX     L0005
        INY
        STY     L0019
        STY     L0037
        BNE     LAB82

        INX
.LAB82
        STX     L001A
        STX     L0038
        JSR     L8EDC

        STZ     L001B
        JSR     L9DFF

        JSR     LBD21

.LAB91
        PLA
        STA     L001B
        PLA
        STA     L001A
        PLA
        STA     L0019
        LDA     L0027
        RTS

.LAB9D
        JMP     L9155

.LABA0
        JSR     LAD78

        BNE     LAB9D

.LABA5
        LDX     L0036
        STZ     L0600,X
        LDA     L0019
        PHA
        LDA     L001A
        PHA
        LDA     L001B
        PHA
        STZ     L001B
        STZ     L0019
        LDA     #$06
        STA     L001A
        JSR     L8F92

        CMP     #$2D
        BEQ     LABD0

        CMP     #$2B
        BNE     LABC9

        JSR     L8F92

.LABC9
        DEC     L001B
        JSR     LA2DD

        BRA     LABDD

.LABD0
        JSR     L8F92

        DEC     L001B
        JSR     LA2DD

        BCC     LABDD

        JSR     LAD1C

.LABDD
        STA     L0027
        BRA     LAB91

.LABE1
        JSR     LAD78

        BEQ     LAC1C

        BPL     LAC02

        LDA     L002E
        PHP
        STZ     L002E
        JSR     L8349

        PLP
        BPL     LABFD

        LDA     L003D
        BEQ     LABFA

        JSR     L83C2

.LABFA
        JSR     L83AA

.LABFD
        JSR     L978B

        LDA     #$40
.LAC02
        RTS

.LAC03
        JSR     LAD78

        BNE     LAC1C

        LDA     L0036
        BEQ     LAC2B

        LDA     L0600
.LAC0F
        JMP     LAE60

.LAC12
        JSR     LAA6E

        TYA
        BNE     LAC2B

        TXA
        JMP     LAE62

.LAC1C
        JMP     L9155

.LAC1F
        JSR     LBA7A

        TAX
        LDA     #$7F
        JSR     LFFF4

        TXA
        BEQ     LAC2D

.LAC2B
        LDX     #$FF
.LAC2D
        STX     L002A
        STX     L002B
        STX     L002C
        STX     L002D
.LAC35
        LDA     #$40
        RTS

.LAC38
        LDX     #$00
        BRA     LAC2D

.LAC3C
        LDA     L0031
        BEQ     LAC38

        LDA     L002E
        BPL     LAC59

        BRA     LAC2B

.LAC46
        JSR     LAD78

        BMI     LAC3C

        BEQ     LAC1C

        LDA     L002D
        BMI     LAC2B

        ORA     L002C
        ORA     L002B
        ORA     L002A
        BEQ     LAC35

.LAC59
        LDA     #$01
.LAC5B
        BRA     LAC0F

.LAC5D
        JSR     L8FAE

        JSR     L976C

        LDA     L002A
        PHA
        LDX     L002B
        JSR     LBD26

        STX     L002D
        PLA
        STA     L002C
        LDY     #$00
        LDX     #$2A
        LDA     #$09
        JSR     LFFF1

        LDA     L002E
        BMI     LAC2B

        BRA     LAC5B

.LAC7F
        JSR     L9DFF

        BNE     LAC1C

        CPX     #$2C
        BNE     LACA0

        INC     L001B
        JSR     LBC91

        JSR     L9DFF

        BNE     LAC1C

        LDA     #$01
        STA     L002A
        INC     L001B
        CPX     #$29
        BEQ     LACA9

        CPX     #$2C
        BEQ     LACA3

.LACA0
        JMP     L8FBB

.LACA3
        JSR     L9769

        JSR     LBD12

.LACA9
        LDX     L002A
        BNE     LACAF

        LDX     #$01
.LACAF
        STX     L002A
        TXA
        DEX
        STX     L002D
        CLC
        ADC     L0004
        STA     L0037
        LDA     #$00
        ADC     L0005
        STA     L0038
        LDA     (L0004)
        SEC
        SBC     L002D
        BCC     LACE8

        SBC     L0036
        BCC     LACE8

        ADC     #$00
        STA     L002B
        JSR     LBD21

.LACD2
        LDY     #$00
        LDX     L0036
        BEQ     LACE3

.LACD8
        LDA     (L0037),Y
        CMP     L0600,Y
        BNE     LACEF

        INY
        DEX
        BNE     LACD8

.LACE3
        LDA     L002A
.LACE5
        JMP     LAE60

.LACE8
        JSR     LBD21

.LACEB
        LDA     #$00
        BRA     LACE5

.LACEF
        INC     L002A
        DEC     L002B
        BEQ     LACEB

        INC     L0037
        BNE     LACD2

        INC     L0038
        BRA     LACD2

.LACFD
        JMP     L9155

.LAD00
        JSR     LAD78

        BMI     LAD0D

        BEQ     LACFD

.LAD07
        BIT     L002D
        BMI     LAD20

        BRA     LAD37

.LAD0D
        STZ     L002E
        RTS

.LAD10
        LDA     L0031
        EOR     L002E
.LAD14
        STA     L002E
        LDA     #$FF
        RTS

.LAD19
        JSR     LAD8E

.LAD1C
        BEQ     LACFD

        BMI     LAD10

.LAD20
        SEC
        LDA     #$00
        TAY
        SBC     L002A
        STA     L002A
        TYA
        SBC     L002B
        STA     L002B
        TYA
        SBC     L002C
        STA     L002C
        TYA
        SBC     L002D
        STA     L002D
.LAD37
        LDA     #$40
        RTS

.LAD3A
        JSR     L8F92

        CMP     #$22
        BEQ     LAD5B

        LDX     #$00
.LAD43
        LDA     (L0019),Y
        STA     L0600,X
        INY
        INX
        CMP     #$0D
        BEQ     LAD52

        CMP     #$2C
        BNE     LAD43

.LAD52
        DEY
.LAD53
        DEX
        STX     L0036
        STY     L001B
        LDA     #$00
        RTS

.LAD5B
        LDX     #$00
.LAD5D
        INY
.LAD5E
        LDA     (L0019),Y
        CMP     #$0D
        BEQ     LAD75

        STA     L0600,X
        INY
        INX
        CMP     #$22
        BNE     LAD5E

        LDA     (L0019),Y
        CMP     #$22
        BEQ     LAD5D

        BNE     LAD53

.LAD75
        JMP     L9357

.LAD78
        LDY     L001B
        INC     L001B
        LDA     (L0019),Y
        CMP     #$20
        BEQ     LAD78

        CMP     #$2D
        BEQ     LAD19

        CMP     #$22
        BEQ     LAD5B

        CMP     #$2B
        BNE     LAD91

.LAD8E
        JSR     L8F92

.LAD91
        CMP     #$8E
        BCC     LAD9C

        CMP     #$C6
        BCS     LADCE

        JMP     L90DE

.LAD9C
        CMP     #$3F
        BCS     LADAC

        CMP     #$2E
        BCS     LADB6

        CMP     #$26
        BEQ     LADF9

        CMP     #$28
        BEQ     LADEE

.LADAC
        DEC     L001B
        JSR     L99D8

        BEQ     LADBC

        JMP     LB1DE

.LADB6
        JSR     LA2DD

        BCC     LADCE

        RTS

.LADBC
        LDA     L0028
        AND     #$02
        BNE     LADCE

        BCS     LADCE

        STX     L001B
.LADC6
        LDA     L0440
        LDY     L0441
        BRA     LAE3F

.LADCE
        BRK
        EQUB    $1A

        EQUS    "No such variable"

.LADE0
        BRK
        EQUB    $1B

        EQUS    $8D,")"

.LADE4
        BRK
        EQUB    $1C

        EQUS    "Bad Hex"

        EQUB    $00

.LADEE
        JSR     L9DFF

        INC     L001B
        CPX     #$29
        BNE     LADE0

        TAY
        RTS

.LADF9
        JSR     LAC38

        BRA     LAE00

.LADFE
        INX
        PHA
.LAE00
        INY
        LDA     (L0019),Y
        CMP     #$41
        BCC     LAE0D

        SBC     #$37
        CMP     #$10
        BRA     LAE11

.LAE0D
        SBC     #$2F
        CMP     #$0A
.LAE11
        BCC     LADFE

        STY     L001B
        DEX
        CPX     #$08
        BCS     LADE4

        TXA
        TAY
        LDX     #$00
.LAE1E
        PLA
        STA     L002A,X
        DEY
        BMI     LAE31

        INX
        PLA
        ASL     A
        ASL     A
        ASL     A
        ASL     A
        ORA     L0029,X
        STA     L0029,X
        DEY
        BPL     LAE1E

.LAE31
        LDA     #$40
        RTS

.LAE34
        JSR     L9779

        LDX     L002A
        LDA     #$80
        JSR     LFFF4

        TXA
.LAE3F
        BRA     LAE62

.LAE41
        INY
        LDA     (L0019),Y
        CMP     #$50
        BNE     LADCE

        INC     L001B
        LDA     L0012
        LDY     L0013
        BRA     LAE62

.LAE50
        LDY     L0018
        LDA     #$00
        BRA     LAE62

.LAE56
        JMP     L9155

.LAE59
        JSR     LAD78

        BNE     LAE56

        LDA     L0036
.LAE60
        LDY     #$00
.LAE62
        STA     L002A
        STY     L002B
        STZ     L002C
        STZ     L002D
        LDA     #$40
        RTS

.LAE6D
        LDA     L001E
        BRA     LAE60

.LAE71
        LDA     L0000
        LDY     L0001
        BRA     LAE62

.LAE77
        LDA     L0006
        LDY     L0007
        BRA     LAE62

.LAE7D
        LDY     L0009
        LDA     L0008
        BRA     LAE62

.LAE83
        LDA     (L00FD)
        BRA     LAE60

.LAE87
        JSR     LFFE0

        BRA     LAE60

.LAE8C
        INY
        LDA     (L0019),Y
        CMP     #$24
        BEQ     LAE9F

        LDX     #$2A
        LDY     #$00
        LDA     #$01
        JSR     LFFF1

        LDA     #$40
        RTS

.LAE9F
        INC     L001B
        LDA     #$0E
        LDX     #$00
        LDY     #$06
        STZ     L0600
        JSR     LFFF1

        LDA     #$18
        BRA     LAED7

.LAEB1
        JSR     LFFE0

.LAEB4
        STA     L0600
        LDA     #$01
        BRA     LAED7

.LAEBB
        CLC
.LAEBC
        PHP
        JSR     L9DFF

        BNE     LAE56

        CPX     #$2C
        BNE     LAF07

        INC     L001B
        JSR     L9769

        JSR     LBD12

        PLP
        BCS     LAEDC

        LDA     L002A
        CMP     L0036
        BCS     LAED9

.LAED7
        STA     L0036
.LAED9
        LDA     #$00
.LAEDB
        RTS

.LAEDC
        LDA     L0036
        SBC     L002A
        BCC     LAED9

        BEQ     LAEDB

        TAX
        LDA     L002A
        STA     L0036
        BEQ     LAEDB

        LDY     #$00
.LAEED
        LDA     L0600,X
        STA     L0600,Y
        INX
        INY
        DEC     L002A
        BNE     LAEED

        BRA     LAED9

.LAEFB
        JSR     LAA6E

        TXA
        CPY     #$00
        BEQ     LAEB4

.LAF03
        LDA     #$00
        BRA     LAED7

.LAF07
        JMP     L8FBB

.LAF0A
        JSR     L9DFF

        BNE     LAF88

        CPX     #$2C
        BNE     LAF07

        JSR     LBC91

        INC     L001B
        JSR     L9774

        LDA     L002A
        PHA
        LDA     #$FF
        STA     L002A
        INC     L001B
        CPX     #$29
        BEQ     LAF2F

        CPX     #$2C
        BNE     LAF07

        JSR     L976C

.LAF2F
        JSR     LBD12

        PLA
        TAY
        CLC
        BEQ     LAF3D

        SBC     L0036
        BCS     LAF03

        DEY
        TYA
.LAF3D
        STA     L002C
        TAX
        LDY     #$00
        LDA     L0036
        SEC
        SBC     L002C
        CMP     L002A
        BCS     LAF4D

        STA     L002A
.LAF4D
        LDA     L002A
        BEQ     LAF03

.LAF51
        LDA     L0600,X
        STA     L0600,Y
        INY
        INX
        CPY     L002A
        BNE     LAF51

        STY     L0036
        BRA     LAFB8

.LAF61
        JSR     L8F92

        LDY     #$FF
        CMP     #$7E
        BEQ     LAF6D

        INY
        DEC     L001B
.LAF6D
        PHY
        JSR     LAD78

        BEQ     LAF88

        TAY
        PLA
        STA     L0015
        LDA     L0403
        BNE     LAF83

        STA     L0037
        JSR     LA19B

        BRA     LAFB8

.LAF83
        JSR     LA181

        BRA     LAFB8

.LAF88
        JMP     L9155

.LAF8B
        JSR     L8FAE

        JSR     LADEE

        BNE     LAF88

        JSR     LBD26

        LDY     L0036
        BEQ     LAFB8

        LDA     L002A
        BEQ     LAFBB

        DEC     L002A
        BEQ     LAFB8

.LAFA2
        LDX     #$00
.LAFA4
        LDA     L0600,X
        STA     L0600,Y
        INX
        INY
        BEQ     LAFBE

        CPX     L0036
        BCC     LAFA4

        DEC     L002A
        BNE     LAFA2

        STY     L0036
.LAFB8
        LDA     #$00
        RTS

.LAFBB
        STA     L0036
        RTS

.LAFBE
        JMP     L9ECB

.LAFC1
        PLA
        STA     L000C
        PLA
        STA     L000B
        BRK
        EQUB    $1D

        EQUS    "No such ",$A4,"/",$F2

        EQUB    $00

.LAFD5
        LDA     L0018
        STA     L000C
        STZ     L000B
.LAFDB
        LDY     #$01
        LDA     (L000B),Y
        BMI     LAFC1

        LDY     #$03
.LAFE3
        INY
        LDA     (L000B),Y
        CMP     #$20
        BEQ     LAFE3

        CMP     #$DD
        BEQ     LAFFD

.LAFEE
        LDY     #$03
        LDA     (L000B),Y
        CLC
        ADC     L000B
        STA     L000B
        BCC     LAFDB

        INC     L000C
        BRA     LAFDB

.LAFFD
        INY
        STY     L000A
        JSR     L8F9D

        TYA
        TAX
        CLC
        ADC     L000B
        LDY     L000C
        BCC     LB00E

        INY
        CLC
.LB00E
        SBC     #$00
        STA     L003C
        TYA
        SBC     #$00
        STA     L003D
        LDY     #$01
.LB019
        INX
        LDA     (L003C),Y
        CMP     (L0037),Y
        BNE     LAFEE

        INY
        CPY     L0039
        BNE     LB019

        LDA     (L003C),Y
        JSR     L8E41

        BCS     LAFEE

        TXA
        TAY
        JSR     L9C80

        JSR     L9914

        LDX     #$01
        JSR     L9952

        LDA     L000B
        STA     (L0002)
        LDY     #$01
        LDA     L000C
        STA     (L0002),Y
        INY
        JSR     L995A

        JMP     LB0B0

.LB04A
        BRK
        EQUB    $1E

        EQUS    "Bad call"

        EQUB    $00

.LB055
        LDA     #$A4
.LB057
        STA     L0027
        TSX
        TXA
        CLC
        ADC     L0004
        JSR     LBD5E

        TXA
        STA     (L0004)
        LDY     #$00
.LB066
        INX
        INY
        LDA     L0100,X
        STA     (L0004),Y
        CPX     #$FF
        BNE     LB066

        TXS
        LDA     L0027
        PHA
        LDA     L000A
        PHA
        LDA     L000B
        PHA
        LDA     L000C
        PHA
        LDA     L001B
        TAX
        CLC
        ADC     L0019
        LDY     L001A
        BCC     LB08A

        INY
        CLC
.LB08A
        SBC     #$01
        STA     L0037
        TYA
        SBC     #$00
        STA     L0038
        LDY     #$02
        JSR     L9BBC

        CPY     #$02
        BEQ     LB04A

        STX     L001B
        JSR     L8139

        BNE     LB0A6

        JMP     LAFD5

.LB0A6
        LDA     (L002A)
        STA     L000B
        LDY     #$01
        LDA     (L002A),Y
        STA     L000C
.LB0B0
        LDA     #$00
        PHA
        STZ     L000A
        JSR     L8F9D

        CMP     #$28
        BEQ     LB109

        DEC     L000A
.LB0BE
        LDA     L001B
        PHA
        LDA     L0019
        PHA
        LDA     L001A
        PHA
        JSR     L90D0

        PLA
        STA     L001A
        PLA
        STA     L0019
        PLA
        STA     L001B
        PLA
        BEQ     LB0E2

        STA     L003F
.LB0D8
        JSR     LBD46

        JSR     LBCAA

        DEC     L003F
        BNE     LB0D8

.LB0E2
        PLA
        STA     L000C
        PLA
        STA     L000B
        PLA
        STA     L000A
        PLA
        LDA     (L0004)
        TAX
        TXS
        LDY     #$00
.LB0F2
        INY
        INX
        LDA     (L0004),Y
        STA     L0100,X
        CPX     #$FF
        BNE     LB0F2

        TYA
        ADC     L0004
        STA     L0004
        BCC     LB106

        INC     L0005
.LB106
        LDA     L0027
        RTS

.LB109
        LDA     L001B
        PHA
        LDA     L0019
        PHA
        LDA     L001A
        PHA
        JSR     L997D

        BEQ     LB169

        LDA     L001B
        STA     L000A
        PLA
        STA     L001A
        PLA
        STA     L0019
        PLA
        STA     L001B
        PLX
        LDA     L002C
        PHA
        LDA     L002B
        PHA
        LDA     L002A
        PHA
        INX
        PHX
        JSR     LB1BF

        JSR     L8DA2

        BEQ     LB109

        CMP     #$29
        BNE     LB169

        LDA     #$00
        PHA
        JSR     L8F92

        CMP     #$28
        BNE     LB169

.LB146
        JSR     L9DFF

        JSR     LBC62

        LDA     L0027
        STA     L002D
        JSR     LBC66

        PLX
        INX
        PHX
        JSR     L8FA8

        BEQ     LB146

        CMP     #$29
        BNE     LB169

        PLA
        PLA
        STA     L004C
        STA     L004D
        CPX     L004C
        BEQ     LB17E

.LB169
        LDX     #$FB
        TXS
        PLA
        STA     L000C
        PLA
        STA     L000B
        BRK
        EQUB    $1F

        EQUS    "Arguments"

        EQUB    $00

.LB17E
        JSR     LBD26

        PLA
        STA     L002A
        PLA
        STA     L002B
        PLA
        STA     L002C
        BMI     LB1AB

        LDA     L002D
        BEQ     LB169

        STA     L0027
        LDX     #$37
        JSR     LBE06

        LDA     L0027
        BPL     LB1A3

        JSR     LBC24

        JSR     LA57E

        BRA     LB1A6

.LB1A3
        JSR     LBD26

.LB1A6
        JSR     LB372

        BRA     LB1B5

.LB1AB
        LDA     L002D
        BNE     LB169

        JSR     LBD12

        JSR     L9171

.LB1B5
        DEC     L004C
        BNE     LB17E

        LDA     L004D
        PHA
        JMP     LB0BE

.LB1BF
        LDY     L002C
        CPY     #$05
        BCS     LB1CA

        LDX     #$37
        JSR     LBE06

.LB1CA
        JSR     LB1DE

        PHP
        JSR     LBC62

        PLP
        BEQ     LB1DB

        BMI     LB1DB

        LDX     #$37
        JSR     LAAD8

.LB1DB
        JMP     LBC66

.LB1DE
        LDY     L002C
        BMI     LB235

        BEQ     LB200

        CPY     #$05
        BEQ     LB205

        LDY     #$03
        LDA     (L002A),Y
        STA     L002D
        DEY
        LDA     (L002A),Y
        STA     L002C
        DEY
        LDA     (L002A),Y
        TAX
        LDA     (L002A)
        STA     L002A
        STX     L002B
        LDA     #$40
        RTS

.LB200
        LDA     (L002A),Y
        JMP     LAE62

.LB205
        STZ     L0035
        STZ     L002F
        DEY
        LDA     (L002A),Y
        STA     L0034
        DEY
        LDA     (L002A),Y
        STA     L0033
        DEY
        LDA     (L002A),Y
        STA     L0032
        DEY
        LDA     (L002A),Y
        STA     L002E
        TAY
        LDA     (L002A)
        STA     L0030
        BNE     LB22D

        TYA
        ORA     L0032
        ORA     L0033
        ORA     L0034
        BEQ     LB230

.LB22D
        TYA
        ORA     #$80
.LB230
        STA     L0031
        LDA     #$FF
        RTS

.LB235
        CPY     #$80
        BEQ     LB257

        LDY     #$03
        LDA     (L002A),Y
        STA     L0036
        BEQ     LB256

        LDY     #$01
        LDA     (L002A),Y
        STA     L0038
        LDA     (L002A)
        STA     L0037
        LDY     L0036
.LB24D
        DEY
        LDA     (L0037),Y
        STA     L0600,Y
        TYA
        BNE     LB24D

.LB256
        RTS

.LB257
        LDY     #$00
.LB259
        LDA     (L002A),Y
        STA     L0600,Y
        EOR     #$0D
        BEQ     LB266

        INY
        BNE     LB259

        TYA
.LB266
        STY     L0036
        RTS

.LB269
        JSR     L9779

        LDA     L002A
        JMP     LAEB4

.LB271
        LDY     L000A
        BEQ     LB276

        DEY
.LB276
        JSR     L9C80

        STZ     L0008
        STZ     L0009
        LDX     L0018
        STX     L0038
        STZ     L0037
        LDY     L000C
        CPY     #$07
        BEQ     LB2B1

        LDX     L000B
.LB28B
        JSR     L8E5D

        CMP     #$0D
        BNE     LB2AA

        CPX     L0037
        TYA
        SBC     L0038
        BCC     LB2B1

        JSR     L8E5D

        ORA     #$00
        BMI     LB2B1

        STA     L0009
        JSR     L8E5D

        STA     L0008
        JSR     L8E5D

.LB2AA
        CPX     L0037
        TYA
        SBC     L0038
        BCS     LB28B

.LB2B1
        RTS

        LDX     #$FF
        STX     L0028
        TXS
        INX
        LDY     #$00
        LDA     #$DA
        JSR     LFFF4

        LDA     #$7E
        JSR     LFFF4

        JSR     LB271

        STZ     L0020
        LDA     (L00FD)
        BNE     LB2D0

        JSR     LB2E0

.LB2D0
        LDA     L0016
        STA     L000B
        LDA     L0017
        STA     L000C
        STZ     L000A
        JSR     LBBFF

        JMP     L90D0

.LB2E0
        LDA     #$E9
        STA     L0016
        LDA     #$B2
        STA     L0017
        RTS

        EQUB    $F6,$3A,$E7,$9E,$F1,$22

        EQUS    " at line "

        EQUB    $22,$3B,$9E,$3A,$E0,$8B,$F1,$3A
        EQUB    $E0,$0D

.LB302
        JSR     L9332

        LDX     #$03
.LB307
        LDA     L002A
        PHA
        LDA     L002B
        PHA
        PHX
        JSR     L9771

        PLX
        DEX
        BNE     LB307

        JSR     L9C5A

        LDA     L002A
        STA     L003D
        LDA     L002B
        STA     L003E
        LDY     #$07
        LDX     #$05
        BRA     LB341

.LB326
        JSR     L9332

        LDX     #$0D
.LB32B
        LDA     L002A
        PHA
        PHX
        JSR     L9771

        PLX
        DEX
        BNE     LB32B

        JSR     L9C5A

        LDA     L002A
        STA     L0044
        LDX     #$0C
        LDY     #$08
.LB341
        PLA
        STA     L0037,X
        DEX
        BPL     LB341

        TYA
        LDX     #$37
        LDY     #$00
.LB34C
        JSR     LFFF1

        BRA     LB35C

.LB351
        JSR     L9332

        JSR     L9C5A

        LDY     L002A
        DEY
        STY     L0023
.LB35C
        JMP     L90CA

.LB35F
        JMP     L9155

.LB362
        JSR     L9DFF

.LB365
        PLY
        PLX
        PLA
        STA     L0039
        PLA
        STA     L0038
        PLA
        STA     L0037
        PHX
        PHY
.LB372
        LDA     L0039
        LSR     A
        LDA     L0027
        BEQ     LB35F

        BCS     LB399

        BPL     LB380

        JSR     L9788

.LB380
        LDA     L002A
        STA     (L0037)
        LDA     L0039
        BEQ     LB398

        LDA     L002B
        LDY     #$01
        STA     (L0037),Y
        LDA     L002C
        INY
        STA     (L0037),Y
        LDA     L002D
        INY
        STA     (L0037),Y
.LB398
        RTS

.LB399
        BMI     LB39E

        JSR     L828D

.LB39E
        LDA     L0030
        STA     (L0037)
        LDY     #$01
        LDA     L002E
        EOR     L0031
        AND     #$80
        EOR     L0031
        STA     (L0037),Y
        INY
        LDA     L0032
        STA     (L0037),Y
        INY
        LDA     L0033
        STA     (L0037),Y
        INY
        LDA     L0034
        STA     (L0037),Y
        RTS

.LB3BE
        EQUS    "EDIT 12,2",$0D

.LB3C8
        JSR     LBBDC

        LDA     #$80
        STA     L001F
.LB3CF
        STZ     L003B
        STZ     L003C
        JSR     LAC38

        JSR     L9BE2

        PHP
        JSR     LBC66

        JSR     LAC2B

        LSR     L002B
        PLP
        BCC     LB3F4

        JSR     L8DA2

        BEQ     LB3FB

        JSR     LBD26

        JSR     LBC66

        DEC     L000A
        BRA     LB3FE

.LB3F4
        JSR     L8DA2

        BEQ     LB3FB

        DEC     L000A
.LB3FB
        JSR     L9BE2

.LB3FE
        LDX     #$31
        JSR     LBE06

        JSR     L8F9D

        CMP     #$E7
        BNE     LB428

        JSR     L8F9D

        JSR     L9C80

        BRA     LB42B

.LB412
        INY
        LDA     (L000B),Y
        CMP     #$4F
        BNE     LB3CF

        INC     L000A
        JSR     L9332

        JSR     L9C6A

        LDA     L002A
        STA     L001F
.LB425
        JMP     L904B

.LB428
        JSR     L9C74

.LB42B
        LDA     L000B
        STA     L0019
        JSR     LBE25

        JSR     LBD26

        JSR     L8191

        LDA     L003D
        STA     L000B
        LDA     L003E
        STA     L000C
        BCS     LB45D

        DEY
        BRA     LB454

.LB445
        JSR     LBDD4

        BIT     L001F
        BMI     LB451

        LDA     #$0A
        JSR     LFFEE

.LB451
        JSR     L9C80

.LB454
        LDA     (L000B),Y
        STA     L002B
        INY
        LDA     (L000B),Y
        STA     L002A
.LB45D
        LDA     L002A
        CLC
        SBC     L0031
        LDA     L002B
        SBC     L0032
        BCC     LB46F

        BIT     L001F
        BPL     LB425

        JMP     LBF54

.LB46F
        STZ     L004C
        STZ     L004D
        LDY     #$04
        STY     L000A
        STY     L001B
        BIT     L003B
        BPL     LB47F

        STZ     L003B
.LB47F
        BIT     L003C
        BPL     LB485

        STZ     L003C
.LB485
        LDA     (L000B),Y
        CMP     #$0D
        BEQ     LB4C2

        CMP     #$F4
        BEQ     LB495

        CMP     #$22
        BNE     LB497

        EOR     L004C
.LB495
        STA     L004C
.LB497
        LDX     L004C
        BNE     LB4A7

        CMP     #$ED
        BNE     LB4A1

        DEC     L003B
.LB4A1
        CMP     #$FD
        BNE     LB4A7

        DEC     L003C
.LB4A7
        LDX     L0019
.LB4A9
        LDA     L0700,X
        CMP     #$0D
        BEQ     LB4BA

        CMP     (L000B),Y
        BNE     LB4BC

        INY
        INX
        BRA     LB4A9

.LB4B8
        BRA     LB445

.LB4BA
        STA     L004D
.LB4BC
        INC     L001B
        LDY     L001B
        BRA     LB485

.LB4C2
        LDA     L004D
        BEQ     LB451

        JSR     LA0EC

        LDA     #$01
        INX
        SEC
        JSR     LBDF4

        LDX     L003B
        LDA     #$02
        JSR     LBDF3

        LDX     L003C
        LDA     #$04
        JSR     LBDF3

        STZ     L004C
.LB4E0
        LDY     L000A
.LB4E2
        LDA     (L000B),Y
        CMP     #$0D
        BEQ     LB4B8

        CMP     #$22
        BNE     LB4F8

        EOR     L004C
        STA     L004C
        LDA     #$22
.LB4F2
        JSR     LBDD4

        INY
        BRA     LB4E2

.LB4F8
        LDX     L004C
        BNE     LB4F2

        CMP     #$8D
        BNE     LB50A

        JSR     L9BEE

        STY     L000A
        JSR     LA0E8

        BRA     LB4E0

.LB50A
        CMP     #$E3
        BNE     LB510

        INC     L003B
.LB510
        CMP     #$F5
        BNE     LB516

        INC     L003C
.LB516
        CMP     #$F4
        BNE     LB51C

        STA     L004C
.LB51C
        JSR     LBD77

        INY
        BRA     LB4E2

.LB522
        JSR     L99C4

        BNE     LB530

        LDX     L0026
        BEQ     LB563

        BCS     LB56A

.LB52D
        JMP     L9C2D

.LB530
        BCS     LB52D

        LDX     L0026
        BEQ     LB563

.LB536
        LDA     L002A
        CMP     L0519,X
        BNE     LB54B

        LDA     L002B
        CMP     L051A,X
        BNE     LB54B

        LDA     L002C
        CMP     L051B,X
        BEQ     LB56A

.LB54B
        TXA
        SEC
        SBC     #$0F
        TAX
        STX     L0026
        BNE     LB536

        BRK
        EQUB    $21

        EQUS    "Can't match ",$E3

.LB563
        BRK
        EQUB    $20

        EQUS    "No ",$E3

        EQUB    $00

.LB56A
        LDA     L0519,X
        STA     L002A
        LDA     L051A,X
        STA     L002B
        LDY     L051B,X
        CPY     #$05
        BEQ     LB5F1

        LDA     (L002A)
        ADC     L051C,X
        STA     (L002A)
        STA     L0037
        LDY     #$01
        LDA     (L002A),Y
        ADC     L051D,X
        STA     (L002A),Y
        STA     L0038
        INY
        LDA     (L002A),Y
        ADC     L051E,X
        STA     (L002A),Y
        STA     L0039
        INY
        LDA     (L002A),Y
        ADC     L051F,X
        STA     (L002A),Y
        TAY
        LDA     L0037
        SEC
        SBC     L0521,X
        STA     L0037
        LDA     L0038
        SBC     L0522,X
        TSB     L0037
        LDA     L0039
        SBC     L0523,X
        TSB     L0037
        TYA
        SBC     L0524,X
        ORA     L0037
        BEQ     LB5CF

        TYA
        EOR     L051F,X
        EOR     L0524,X
        BPL     LB5CD

        BCS     LB5CF

        BRA     LB5DF

.LB5CD
        BCS     LB5DF

.LB5CF
        LDY     L0526,X
        LDA     L0527,X
        STY     L000B
        STA     L000C
        JSR     L9C8A

        JMP     L90D0

.LB5DF
        TXA
        SEC
        SBC     #$0F
        STA     L0026
        LDY     L001B
        STY     L000A
        JSR     L8DA2

        BNE     LB626

        JMP     LB522

.LB5F1
        JSR     LB205

        TXA
        CLC
        ADC     #$1C
        STA     L004A
        LDA     #$05
        STA     L004B
        JSR     LA70A

        LDA     L002A
        STA     L0037
        LDA     L002B
        STA     L0038
        JSR     LB39E

        LDX     L0026
        TXA
        CLC
        ADC     #$21
        STA     L004A
        JSR     L9D36

        BEQ     LB5CF

        LDA     L051D,X
        BMI     LB622

        BCS     LB5CF

        BRA     LB5DF

.LB622
        BCC     LB5CF

        BRA     LB5DF

.LB626
        JMP     L90C5

.LB629
        BRK
        EQUB    $22

        EQUS    $E3," variable"

.LB635
        BRK
        EQUB    $23

        EQUS    "Too many ",$E3,"s"

.LB642
        BRK
        EQUB    $24

        EQUS    "No ",$B8

        EQUB    $00

.LB649
        JSR     L997D

        BEQ     LB629

        BCS     LB629

        JSR     LBC83

        JSR     L9C4A

        JSR     LB362

        JSR     L8F92

        CMP     #$B8
        BNE     LB642

        LDY     L0026
        CPY     #$96
        BCS     LB635

        TYA
        ADC     #$0F
        STA     L0026
        LDA     L0037
        STA     L0528,Y
        LDA     L0038
        STA     L0529,Y
        LDA     L0039
        STA     L052A,Y
        LSR     A
        BCS     LB6D1

        JSR     L9774

        LDY     L0026
        LDA     L002A
        STA     L0521,Y
        LDA     L002B
        STA     L0522,Y
        LDA     L002C
        STA     L0523,Y
        LDA     L002D
        STA     L0524,Y
        LDA     #$01
        JSR     LAE60

        JSR     L8F92

        CMP     #$88
        BNE     LB6A7

        JSR     L9774

        LDY     L001B
.LB6A7
        STY     L000A
        LDY     L0026
        LDA     L002A
        STA     L051C,Y
        LDA     L002B
        STA     L051D,Y
        LDA     L002C
        STA     L051E,Y
        LDA     L002D
        STA     L051F,Y
.LB6BF
        JSR     L9C93

        LDY     L0026
        LDA     L000B
        STA     L0526,Y
        LDA     L000C
        STA     L0527,Y
        JMP     L90D0

.LB6D1
        JSR     L9DFF

        JSR     L97A2

        LDA     L0026
        CLC
        ADC     #$21
        STA     L004A
        LDA     #$05
        STA     L004B
        JSR     LA54D

        JSR     LA622

        JSR     L8F92

        CMP     #$88
        BNE     LB6F7

        JSR     L9DFF

        JSR     L97A2

        LDY     L001B
.LB6F7
        STY     L000A
        LDA     L0026
        CLC
        ADC     #$1C
        STA     L004A
        LDA     #$05
        STA     L004B
        JSR     LA54D

        BRA     LB6BF

.LB709
        JSR     LB85A

.LB70C
        JSR     L9C6A

        LDY     L0025
        CPY     #$1A
        BCS     LB723

        LDA     L000B
        STA     L05CC,Y
        LDA     L000C
        STA     L05E6,Y
        INC     L0025
        BRA     LB753

.LB723
        BRK
        EQUB    $25

        EQUS    "Too many ",$E4,"s"

.LB730
        BRK
        EQUB    $26

        EQUS    "No ",$E4

        EQUB    $00

.LB737
        JSR     L9C6A

        LDX     L0025
        BEQ     LB730

        DEC     L0025
        LDY     L05CB,X
        LDA     L05E5,X
        STY     L000B
        STA     L000C
.LB74A
        JMP     L90CA

.LB74D
        JSR     LB85A

        JSR     L9C6A

.LB753
        LDA     L0020
        BEQ     LB75A

        JSR     L9D0F

.LB75A
        LDY     #$04
        STY     L000A
        LDY     L003D
        LDA     L003E
.LB762
        STY     L000B
        STA     L000C
        JMP     L90D0

.LB769
        JSR     L9C6A

        JSR     LB2E0

        BRA     LB74A

.LB771
        JSR     L8F9D

        CMP     #$87
        BEQ     LB769

        LDY     L000A
        DEY
        JSR     L9C80

        STZ     L000A
        LDA     L000B
        STA     L0016
        LDA     L000C
        STA     L0017
        JMP     L9073

.LB78B
        JSR     L8F9D

        CMP     #$85
        BEQ     LB771

        DEC     L000A
        JSR     L9332

        CPX     #$F2
        BEQ     LB7A4

        INY
        CPX     #$E5
        BEQ     LB7A4

        CPX     #$E4
        BNE     LB81A

.LB7A4
        PHX
        LDA     L002B
        ORA     L002C
        ORA     L002D
        BNE     LB805

        DEC     L002A
        BEQ     LB7E6

        BMI     LB805

.LB7B3
        LDA     (L000B),Y
        CMP     #$0D
        BEQ     LB805

        CMP     #$3A
        BEQ     LB805

        CMP     #$8B
        BEQ     LB805

        INY
        CMP     #$22
        BNE     LB7CA

        EOR     L002B
        STA     L002B
.LB7CA
        LDX     L002B
        BNE     LB7B3

        CMP     #$29
        BNE     LB7D4

        DEC     L002C
.LB7D4
        CMP     #$28
        BNE     LB7DA

        INC     L002C
.LB7DA
        CMP     #$2C
        BNE     LB7B3

        LDX     L002C
        BNE     LB7B3

        DEC     L002A
        BNE     LB7B3

.LB7E6
        PLA
        CMP     #$F2
        BEQ     LB833

        STY     L000A
        CMP     #$E4
        BEQ     LB7FA

        JSR     LB85A

        JSR     L9C8A

        JMP     LB753

.LB7FA
        JSR     LB85A

        LDY     L000A
        JSR     LB84D

        JMP     LB70C

.LB805
        PLA
.LB806
        LDA     (L000B),Y
        INY
        CMP     #$8B
        BEQ     LB847

        CMP     #$0D
        BNE     LB806

        BRK
        EQUB    $28

        EQUS    $EE," range"

.LB81A
        BRK
        EQUB    $27

        EQUS    $EE," syntax"

.LB824
        BRK
        EQUB    $29

        EQUS    "No such line"

        EQUB    $00

.LB833
        STY     L001B
        JSR     L8F92

        CMP     #$F2
        BNE     LB81A

        JSR     LB057

        LDY     L001B
        JSR     LB84D

        JMP     L90C7

.LB847
        STY     L000A
        JMP     L9CED

.LB84C
        INY
.LB84D
        LDA     (L000B),Y
        CMP     #$0D
        BEQ     LB857

        CMP     #$3A
        BNE     LB84C

.LB857
        STY     L000A
        RTS

.LB85A
        JSR     L9BE2

        BCS     LB866

        JSR     L9332

        LDA     #$80
        TRB     L002B
.LB866
        JSR     L8191

        BCC     LB824

        RTS

.LB86C
        JMP     L9155

.LB86F
        JMP     L9C2D

.LB872
        STY     L000A
.LB874
        JMP     L90C7

.LB877
        JSR     LBA6C

        STY     L004C
        JSR     L9338

.LB87F
        JSR     L8DA2

        BNE     LB872

        LDA     L004C
        PHA
        JSR     L997D

        BEQ     LB86F

        JSR     L9338

        PLA
        STA     L004C
        PHP
        JSR     LBC66

        LDY     L004C
        JSR     LFFD7

        STA     L0027
        PLP
        BCC     LB8BA

        LDA     L0027
        BNE     LB86C

        JSR     LFFD7

        STA     L0036
        TAX
        BEQ     LB8B5

.LB8AC
        JSR     LFFD7

        STA     L05FF,X
        DEX
        BNE     LB8AC

.LB8B5
        JSR     L916E

        BRA     LB87F

.LB8BA
        LDA     L0027
        BEQ     LB86C

        BMI     LB8CC

        LDX     #$03
.LB8C2
        JSR     LFFD7

        STA     L002A,X
        DEX
        BPL     LB8C2

        BRA     LB8DA

.LB8CC
        LDX     #$04
.LB8CE
        JSR     LFFD7

        STA     L046C,X
        DEX
        BPL     LB8CE

        JSR     LA576

.LB8DA
        JSR     LBD46

        JSR     LB372

        BRA     LB87F

.LB8E2
        PLA
        PLA
        BRA     LB874

.LB8E6
        JSR     L8D9C

        BEQ     LB877

        CMP     #$86
        BEQ     LB8F2

        DEC     L000A
        CLC
.LB8F2
        ROR     L004C
        LSR     L004C
        LDA     #$FF
        STA     L004D
.LB8FA
        JSR     L935C

        BCS     LB909

.LB8FF
        JSR     L935C

        BCC     LB8FF

        LDX     #$FF
        STX     L004D
        CLC
.LB909
        PHP
        ASL     L004C
        PLP
        ROR     L004C
        CMP     #$2C
        BEQ     LB8FA

        CMP     #$3B
        BEQ     LB8FA

        DEC     L000A
        LDA     L004C
        PHA
        LDA     L004D
        PHA
        JSR     L997D

        BEQ     LB8E2

        PLA
        STA     L004D
        PLA
        STA     L004C
        JSR     L9338

        PHP
        BIT     L004C
        BVS     LB938

        LDA     L004D
        CMP     #$FF
        BNE     LB94F

.LB938
        BIT     L004C
        BPL     LB941

        LDA     #$3F
        JSR     LFFEE

.LB941
        JSR     LBAA0

        STY     L0036
        ASL     L004C
        CLC
        ROR     L004C
        BIT     L004C
        BVS     LB968

.LB94F
        STA     L001B
        STZ     L0019
        LDA     #$06
        STA     L001A
        JSR     LAD3A

.LB95A
        JSR     L8FA8

        BEQ     LB965

        CMP     #$0D
        BNE     LB95A

        LDY     #$FE
.LB965
        INY
        STY     L004D
.LB968
        PLP
        BCS     LB976

        JSR     LBC83

        JSR     LABA5

        JSR     LB365

.LB974
        BRA     LB8FA

.LB976
        STZ     L0027
        JSR     L9171

        BRA     LB974

.LB97D
        STZ     L003D
        LDY     L0018
        STY     L003E
        JSR     L8F9D

        DEC     L000A
        CMP     #$3A
        BEQ     LB997

        CMP     #$0D
        BEQ     LB997

        CMP     #$8B
        BEQ     LB997

        JSR     LB85A

.LB997
        JSR     L9C6A

        LDA     L003D
        STA     L001C
        LDA     L003E
        STA     L001D
        JMP     L90CA

.LB9A5
        JSR     L8DA2

        BEQ     LB9AD

        JMP     L90C5

.LB9AD
        JSR     L997D

        BEQ     LB9A5

        BCS     LB9BF

        JSR     LB9DC

        JSR     LBC83

        JSR     LB362

        BRA     LB9CD

.LB9BF
        JSR     LB9DC

        JSR     LBC66

        JSR     LAD3A

        STA     L0027
        JSR     L916E

.LB9CD
        CLC
        LDA     L001B
        ADC     L0019
        STA     L001C
        LDA     L001A
        ADC     #$00
        STA     L001D
        BRA     LB9A5

.LB9DC
        JSR     L9338

        LDA     L001C
        STA     L0019
        LDA     L001D
        STA     L001A
        STZ     L001B
        JSR     L8FA8

        BEQ     LBA46

        CMP     #$DC
        BEQ     LBA46

        CMP     #$0D
        BEQ     LB9FF

.LB9F6
        JSR     L8FA8

        BEQ     LBA46

        CMP     #$0D
        BNE     LB9F6

.LB9FF
        LDY     L001B
        LDA     (L0019),Y
        BMI     LBA21

        INY
        INY
        LDA     (L0019),Y
        TAX
.LBA0A
        INY
        LDA     (L0019),Y
        CMP     #$20
        BEQ     LBA0A

        CMP     #$DC
        BEQ     LBA43

        TXA
        CLC
        ADC     L0019
        STA     L0019
        BCC     LB9FF

        INC     L001A
        BRA     LB9FF

.LBA21
        BRK
        EQUB    $2A

        EQUS    "Out of ",$DC

.LBA2B
        BRK
        EQUB    $2B

        EQUS    "No ",$F5

.LBA31
        BRK
        EQUB    $2D

        EQUS    $8D,"#"

.LBA35
        BRK
        EQUB    $2C

        EQUS    "Too many ",$F5,"s"

        EQUB    $00

.LBA43
        INY
        STY     L001B
.LBA46
        RTS

.LBA47
        JSR     L9DF3

        JSR     L9C55

        JSR     L9781

        LDX     L0024
        BEQ     LBA2B

        LDA     L002A
        ORA     L002B
        ORA     L002C
        ORA     L002D
        BEQ     LBA63

        DEC     L0024
        JMP     L90CA

.LBA63
        LDY     L04FF,X
        LDA     L0513,X
        JMP     LB762

.LBA6C
        DEC     L000A
.LBA6E
        LDA     L000A
        STA     L001B
        LDA     L000B
        STA     L0019
        LDA     L000C
        STA     L001A
.LBA7A
        JSR     L8F92

        CMP     #$23
        BNE     LBA31

        JSR     L9779

        LDY     L002A
        TYA
        RTS

.LBA88
        LDX     L0024
        CPX     #$14
        BCS     LBA35

        JSR     L9C80

        LDA     L000B
        STA     L0500,X
        LDA     L000C
        STA     L0514,X
        INC     L0024
        JMP     L90D0

.LBAA0
        LDA     #$06
        BRA     LBAA6

.LBAA4
        LDA     #$07
.LBAA6
        STZ     L0037
        STA     L0038
        LDA     #$EE
        STA     L0039
        LDA     #$20
        STA     L003A
        LDY     #$FF
        STY     L003B
        INY
        LDX     #$37
        TYA
        JSR     LFFF1

        BCC     LBAC5

        JMP     L9C41

.LBAC2
        JSR     LFFE7

.LBAC5
        STZ     L001E
        RTS

.LBAC8
        JSR     L8191

        BCC     LBB1A

        LDA     L003D
        STA     L0037
        STA     L0012
        LDA     L003E
        STA     L0038
        STA     L0013
        LDY     #$03
        LDA     (L0037),Y
        CLC
        ADC     L0037
        STA     L0037
        BCC     LBAE6

        INC     L0038
.LBAE6
        LDY     #$00
.LBAE8
        LDA     (L0037),Y
        STA     (L0012),Y
        CMP     #$0D
        BNE     LBB03

        INY
        BNE     LBAF7

        INC     L0038
        INC     L0013
.LBAF7
        LDA     (L0037),Y
        STA     (L0012),Y
        BMI     LBB0C

        JSR     LBB0F

        JSR     LBB0F

.LBB03
        INY
        BNE     LBAE8

        INC     L0038
        INC     L0013
        BRA     LBAE8

.LBB0C
        JMP     LBE45

.LBB0F
        INY
        BNE     LBB16

        INC     L0013
        INC     L0038
.LBB16
        LDA     (L0037),Y
        STA     (L0012),Y
.LBB1A
        RTS

.LBB1B
        LDX     #$FF
        STX     L0028
        STX     L003C
        JSR     LBBFF

        LDA     L000B
        STA     L0037
        LDA     L000C
        STA     L0038
        STZ     L003B
        STZ     L000A
        JSR     L8E6F

        JSR     L9BE2

        BCC     LBB1A

.LBB38
        LDA     L001F
        BEQ     LBB45

.LBB3C
        LDA     L0700,Y
        INY
        CMP     #$20
        BEQ     LBB3C

        DEY
.LBB45
        STY     L003B
        JSR     LBAC8

        LDY     #$07
        STY     L003C
        LDY     #$00
        LDA     #$0D
        CMP     (L003B)
        BEQ     LBB1A

.LBB56
        INY
        CMP     (L003B),Y
        BNE     LBB56

        LDA     #$20
.LBB5D
        DEY
        BEQ     LBB64

        CMP     (L003B),Y
        BEQ     LBB5D

.LBB64
        INY
        LDA     #$0D
        STA     (L003B),Y
        INY
        INY
        INY
        INY
        STY     L003F
        LDA     L0012
        STA     L0039
        LDA     L0013
        STA     L003A
        JSR     LBE44

        STA     L0037
        LDA     L0013
        STA     L0038
        DEY
        LDA     L0006
        CMP     L0012
        LDA     L0007
        SBC     L0013
        BCS     LBB9B

        JSR     LBE25

        JSR     LBBDC

        BRK
        EQUB    $00

        EQUS    $86," space"

        EQUB    $00

.LBB9B
        LDA     (L0039),Y
        STA     (L0037),Y
        TYA
        BNE     LBBA6

        DEC     L003A
        DEC     L0038
.LBBA6
        DEY
        TYA
        ADC     L0039
        LDX     L003A
        BCC     LBBAF

        INX
.LBBAF
        CMP     L003D
        TXA
        SBC     L003E
        BCS     LBB9B

        LDY     #$01
        LDA     L002B
        STA     (L003D),Y
        INY
        LDA     L002A
        STA     (L003D),Y
        INY
        LDA     L003F
        STA     (L003D),Y
        SEC
        TYA
        ADC     L003D
        STA     L003D
        BCC     LBBD0

        INC     L003E
.LBBD0
        LDY     #$FF
.LBBD2
        INY
        LDA     (L003B),Y
        STA     (L003D),Y
        CMP     #$0D
        BNE     LBBD2

        RTS

.LBBDC
        LDA     L0012
        STA     L0000
        STA     L0002
        LDA     L0013
        STA     L0001
        STA     L0003
        JSR     LBBFF

.LBBEB
        LDX     #$10
.LBBED
        LDA     LBF71,X
        STA     L07EF,X
        DEX
        BNE     LBBED

        LDX     #$80
.LBBF8
        STZ     L047F,X
        DEX
        BNE     LBBF8

        RTS

.LBBFF
        LDA     L0018
        STA     L001D
        LDA     L0006
        STA     L0004
        LDA     L0007
        STA     L0005
        LDA     #$80
        TRB     L001F
        STZ     L0024
        STZ     L0026
        STZ     L0025
        STZ     L001C
        RTS

.LBC18
        JSR     LBC3A

        JSR     LA026

.LBC1E
        STX     L0027
.LBC20
        TAY
        JSR     L97A2

.LBC24
        LDA     L0004
        CLC
        STA     L004A
        ADC     #$05
        STA     L0004
        LDA     L0005
        STA     L004B
        ADC     #$00
        STA     L0005
        RTS

.LBC36
        TAY
        JSR     L97A2

.LBC3A
        LDA     L0004
        SEC
        SBC     #$05
        JSR     LBD5E

        LDA     L0030
        STA     (L0004)
        LDY     #$01
        LDA     L002E
        EOR     L0031
        AND     #$80
        EOR     L0031
        STA     (L0004),Y
        INY
        LDA     L0032
        STA     (L0004),Y
        INY
        LDA     L0033
        STA     (L0004),Y
        INY
        LDA     L0034
        STA     (L0004),Y
        RTS

.LBC62
        BEQ     LBC91

        BMI     LBC3A

.LBC66
        LDA     L0004
        SEC
        SBC     #$04
        JSR     LBD5E

        LDY     #$03
        LDA     L002D
        STA     (L0004),Y
        DEY
        LDA     L002C
        STA     (L0004),Y
        DEY
        LDA     L002B
        STA     (L0004),Y
        LDA     L002A
        STA     (L0004)
        RTS

.LBC83
        PLY
        PLX
        LDA     L002A
        PHA
        LDA     L002B
        PHA
        LDA     L002C
        PHA
        PHX
        PHY
        RTS

.LBC91
        CLC
        LDA     L0004
        SBC     L0036
        JSR     LBD5E

        LDY     L0036
        BEQ     LBCA5

.LBC9D
        LDA     L05FF,Y
        STA     (L0004),Y
        DEY
        BNE     LBC9D

.LBCA5
        LDA     L0036
        STA     (L0004)
        RTS

.LBCAA
        LDA     L0039
        CMP     #$80
        BEQ     LBCD5

        BCC     LBCEA

        LDA     (L0004)
        TAX
        BEQ     LBCCD

        LDA     (L0037)
        SBC     #$01
        STA     L0039
        LDY     #$01
        LDA     (L0037),Y
        SBC     #$00
        STA     L003A
.LBCC5
        LDA     (L0004),Y
        STA     (L0039),Y
        INY
        DEX
        BNE     LBCC5

.LBCCD
        LDA     (L0004)
        LDY     #$03
.LBCD1
        STA     (L0037),Y
        BRA     LBD21

.LBCD5
        LDA     (L0004)
        LDY     #$00
        TAX
        BEQ     LBCE6

.LBCDC
        INY
        LDA     (L0004),Y
        DEY
        STA     (L0037),Y
        INY
        DEX
        BNE     LBCDC

.LBCE6
        LDA     #$0D
        BNE     LBCD1

.LBCEA
        LDA     (L0004)
        STA     (L0037)
        LDY     #$04
        LDA     L0039
        BEQ     LBD0E

        LDY     #$01
        LDA     (L0004),Y
        STA     (L0037),Y
        INY
        LDA     (L0004),Y
        STA     (L0037),Y
        INY
        LDA     (L0004),Y
        STA     (L0037),Y
        INY
        CPY     L0039
        BCS     LBD0E

        LDA     (L0004),Y
        STA     (L0037),Y
        INY
.LBD0E
        TYA
        CLC
        BRA     LBD3D

.LBD12
        LDA     (L0004)
        STA     L0036
        BEQ     LBD23

        TAY
.LBD19
        LDA     (L0004),Y
        STA     L05FF,Y
        DEY
        BNE     LBD19

.LBD21
        LDA     (L0004)
.LBD23
        SEC
        BRA     LBD3D

.LBD26
        LDY     #$03
        LDA     (L0004),Y
        STA     L002D
        DEY
        LDA     (L0004),Y
        STA     L002C
        DEY
        LDA     (L0004),Y
        STA     L002B
        LDA     (L0004)
        STA     L002A
.LBD3A
        CLC
        LDA     #$04
.LBD3D
        ADC     L0004
        STA     L0004
        BCC     LBD45

        INC     L0005
.LBD45
        RTS

.LBD46
        LDX     #$37
.LBD48
        LDY     #$03
        LDA     (L0004),Y
        STA     L0003,X
        DEY
        LDA     (L0004),Y
        STA     L0002,X
        DEY
        LDA     (L0004),Y
        STA     L0001,X
        LDA     (L0004)
        STA     L0000,X
        BRA     LBD3A

.LBD5E
        STA     L0004
        BCS     LBD64

        DEC     L0005
.LBD64
        LDY     L0005
        CPY     L0003
        BCC     LBD74

        BNE     LBD70

        CMP     L0002
        BCC     LBD74

.LBD70
        RTS

.LBD71
        JSR     LBBDC

.LBD74
        JMP     L9164

.LBD77
        STA     L0037
        CMP     #$80
        BCC     LBDD4

        LDA     #$13
        STA     L0038
        LDA     #$85
        STA     L0039
        PHY
.LBD86
        LDY     #$00
.LBD88
        INY
        LDA     (L0038),Y
        BPL     LBD88

        CMP     L0037
        BEQ     LBD9E

        INY
        TYA
        SEC
        ADC     L0038
        STA     L0038
        BCC     LBD86

        INC     L0039
        BRA     LBD86

.LBD9E
        LDY     #$00
.LBDA0
        LDA     (L0038),Y
        BMI     LBDAA

        JSR     LBDD4

        INY
        BNE     LBDA0

.LBDAA
        PLY
        RTS

.LBDAC
        PHA
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     LBDB7

        PLA
        AND     #$0F
.LBDB7
        CMP     #$0A
        BCC     LBDBD

        ADC     #$06
.LBDBD
        ADC     #$30
.LBDBF
        PHA
        LDA     L0023
        CMP     L001E
        BCS     LBDC9

        JSR     LBAC2

.LBDC9
        PLA
        INC     L001E
        JMP     (L020E)

.LBDCF
        JSR     LBDAC

.LBDD2
        LDA     #$20
.LBDD4
        BIT     L001F
        BMI     LBDE2

.LBDD8
        CMP     #$0D
        BNE     LBDBF

        JSR     LFFEE

        JMP     LBAC5

.LBDE2
        STA     (L0002)
        INC     L0002
        BNE     LBE05

        INC     L0003
        PHA
        LDA     L0003
        EOR     L0007
        BEQ     LBD71

        PLA
        RTS

.LBDF3
        CLC
.LBDF4
        AND     L001F
        BEQ     LBE05

        TXA
        BMI     LBE05

        ROL     A
        TAX
        BEQ     LBE05

.LBDFF
        JSR     LBDD2

        DEX
        BNE     LBDFF

.LBE05
        RTS

.LBE06
        LDA     L002A
        STA     L0000,X
        LDA     L002B
        STA     L0001,X
        LDA     L002C
        STA     L0002,X
        LDA     L002D
        STA     L0003,X
        RTS

.LBE17
        JSR     LBE81

        STZ     L003D
        LDY     #$00
        LDA     #$FF
        LDX     #$37
        JSR     LFFDD

.LBE25
        LDA     L0018
        STA     L0013
        STZ     L0012
        LDY     #$01
.LBE2D
        LDA     (L0012)
        CMP     #$0D
        BNE     LBE51

        LDA     (L0012),Y
        BMI     LBE43

        LDY     #$03
        LDA     (L0012),Y
        BEQ     LBE51

        CLC
        JSR     LBE46

        BRA     LBE2D

.LBE43
        INY
.LBE44
        CLC
.LBE45
        TYA
.LBE46
        ADC     L0012
        STA     L0012
        BCC     LBE4E

        INC     L0013
.LBE4E
        LDY     #$01
        RTS

.LBE51
        JSR     LBF0F

        EQUS    $0D,"Bad program",$0D

        NOP
        JMP     L904B

.LBE65
        STZ     L0037
        LDA     #$06
        STA     L0038
.LBE6B
        LDY     L0036
        LDA     #$0D
        STA     L0600,Y
        RTS

.LBE73
        JMP     L9155

.LBE76
        JSR     L9DF3

        BNE     LBE73

        JSR     LBE65

        JMP     L9C55

.LBE81
        JSR     LBE76

        DEY
        STY     L0039
        LDA     L0018
        STA     L003A
.LBE8B
        LDA     #$82
        JSR     LFFF4

        STX     L003B
        STY     L003C
        RTS

.LBE95
        JSR     LBE25

        JSR     LBE81

        STX     L003F
        STY     L0040
        STX     L0043
        STY     L0044
        STX     L0047
        STY     L0048
        STZ     L0041
        LDX     L0012
        STX     L0045
        LDX     L0013
        STX     L0046
        LDX     #$E7
        STX     L003D
        LDX     #$80
        STX     L003E
        LDX     L0018
        STX     L0042
        LDA     #$00
        TAY
        LDX     #$37
        JSR     LFFDD

        BRA     LBEEB

.LBEC7
        JSR     LBE76

        LDX     #$00
        LDY     #$06
        JSR     LFFF7

        BRA     LBEEB

.LBED3
        LDA     #$03
        BRA     LBED9

.LBED7
        LDA     #$01
.LBED9
        PHA
        JSR     LBA6E

        PHY
        JSR     L9C16

        JSR     L9781

        PLY
        LDX     #$2A
        PLA
        JSR     LFFDA

.LBEEB
        JMP     L90CA

.LBEEE
        JSR     LBA6E

        JSR     L9C5A

        LDY     L002A
        LDA     #$00
        JSR     LFFCE

        BRA     LBEEB

.LBEFD
        JSR     LBA6E

LBEFE = LBEFD+1
.LBF00
        PHA
        JSR     L9771

        JSR     L9C5A

        PLY
        LDA     L002A
        JSR     LFFD4

        BRA     LBEEB

.LBF0F
        PLA
        STA     L0037
        PLA
        STA     L0038
        BRA     LBF1A

.LBF17
        JSR     LFFE3

.LBF1A
        JSR     L8E66

        BPL     LBF17

        JMP     (L0037)

.LBF22
        LDA     #$05
        PHX
        LDX     #$2A
        LDY     #$00
        JSR     LFFF1

        PLX
        LDA     L002E
.LBF2F
        INC     L002A
        BNE     LBF3D

        INC     L002B
        BNE     LBF3D

        INC     L002C
        BNE     LBF3D

        INC     L002D
.LBF3D
        RTS

.LBF3E
        LDA     #$0D
        LDY     L0018
        STY     L0013
        STZ     L0012
        STZ     L0020
        STA     (L0012)
        LDA     #$FF
        LDY     #$01
        STA     (L0012),Y
        INY
        STY     L0012
        RTS

.LBF54
        LDY     #$09
.LBF56
        LDA     LB3BE,Y
        STA     L0600,Y
        DEY
        BPL     LBF56

        LDX     #$00
        LDY     #$06
        JMP     LFFF7

.LBF66
        LDA     #$EA
        LDX     #$00
        LDY     #$FF
        JSR     LFFF4

        TXA
        RTS

.LBF71
        EQUB    $52

        EQUW    LA80B,LA634,LA6E4,LA70A
        EQUW    LAD10,LA57E,LA54D

        EQUB    $4A,$2E,$7F,$5E,$5B,$D8,$AA,$00
        EQUB    $CA,$98,$80,$81,$22,$F9,$83,$6E
        EQUB    $81,$49,$0F,$DA,$A2,$21,$B3,$B2
        EQUB    $87,$80,$82,$38,$AA,$3B,$29,$80
        EQUB    $31,$72,$17,$F7,$D1,$5F,$5B,$E6
        EQUB    $FF,$66,$2B,$CC,$77,$6D,$06,$37
        EQUB    $BD,$73,$51,$B7,$17,$7A,$23,$D7
        EQUB    $0A,$81,$00,$00,$00,$00,$82,$40
        EQUB    $00,$00,$00,$9A,$D4,$82,$7F,$B9
        EQUB    $FF,$78,$7B,$0E,$FA,$35,$12,$86
        EQUB    $65,$2E,$E0,$D3,$7E,$88,$88,$88
        EQUB    $89,$7B,$8C,$6F,$2D,$59,$81,$99
        EQUB    $99,$99,$9A,$F3,$9E,$7B,$77,$81
        EQUB    $C0,$00,$00,$00,$80,$93,$E6,$90
        EQUB    $00,$81,$C4,$44,$44,$44,$80,$9D
        EQUB    $FD,$13,$04,$81,$E6,$66,$66,$66

.BeebDisEndAddr
SAVE "Basic432.bin",BeebDisStartAddr,BeebDisEndAddr

