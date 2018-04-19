; Enable 65C02 opcodes
CPU           1

L00     = $0000
L01     = $0001
L02     = $0002
L03     = $0003
L04     = $0004
L05     = $0005
L06     = $0006
L07     = $0007
L08     = $0008
L09     = $0009
L0A     = $000A
L0B     = $000B
L0C     = $000C
L0D     = $000D
L0E     = $000E
L0F     = $000F
L10     = $0010
L11     = $0011
L12     = $0012
L13     = $0013
L14     = $0014
L15     = $0015
L16     = $0016
L17     = $0017
L18     = $0018
L19     = $0019
L1A     = $001A
L1B     = $001B
L1C     = $001C
L1D     = $001D
L1E     = $001E
L1F     = $001F
L20     = $0020
L21     = $0021
L22     = $0022
L23     = $0023
L24     = $0024
L25     = $0025
L26     = $0026
L27     = $0027
L28     = $0028
L29     = $0029
L2A     = $002A
L2B     = $002B
L2C     = $002C
L2D     = $002D
L2E     = $002E
L2F     = $002F
L30     = $0030
L31     = $0031
L32     = $0032
L33     = $0033
L34     = $0034
L35     = $0035
L36     = $0036
L37     = $0037
L38     = $0038
L39     = $0039
L3A     = $003A
L3B     = $003B
L3C     = $003C
L3D     = $003D
L3E     = $003E
L3F     = $003F
L40     = $0040
L41     = $0041
L42     = $0042
L43     = $0043
L44     = $0044
L45     = $0045
L46     = $0046
L47     = $0047
L48     = $0048
L49     = $0049
L4A     = $004A
L4B     = $004B
L4C     = $004C
L4D     = $004D
L4E     = $004E
LF2     = $00F2
LF4     = $00F4
LFD     = $00FD
LFE     = $00FE
LFF     = $00FF
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
OSFIND  = $FFCE
OSBPUT  = $FFD4
OSBGET  = $FFD7
OSARGS  = $FFDA
OSFILE  = $FFDD
OSRDCH  = $FFE0
OSASCI  = $FFE3
OSNEWL  = $FFE7
OSWRCH  = $FFEE
OSWORD  = $FFF1
OSBYTE  = $FFF4
OSCLI   = $FFF7

        org     $8000
.BeebDisStartAddr
        JMP     L80E7

        JMP     L802C

        EQUB    $E2,$13,$07

        EQUS    "BASIC",$00

        EQUS    "4r32",$00

        EQUS    "(C)1988 Acorn",$0A,$0D,$00

        EQUW    $B800,L8028

.L8028
        EQUW    $C000,$0082

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
        LDX     LF4
        LDY     #$00
        JSR     OSBYTE

        JMP     L806A

.L804C
        LDA     (LF2),Y
        CMP     #$0D
        BNE     L806A

        JSR     OSNEWL

        LDX     #$F6
.L8057
        LDA     L7F13,X
        BNE     L805E

        LDA     #$20
.L805E
        JSR     OSASCI

        INX
        BNE     L8057

        JSR     OSNEWL

.L8067
        JSR     L80D8

.L806A
        PLA
        TAY
        LDX     LF4
        PLA
        RTS

.L8070
        LDA     (LF2),Y
        AND     #$DF
        CMP     #$48
        BNE     L808F

        INY
        LDA     #$40
        TSB     LF4
        LDA     (LF2),Y
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
        LDA     (LF2),Y
        CMP     #$2E
        BEQ     L80A8

        AND     #$DF
        CMP     L7F0E,X
        BNE     L8067

        INY
        INX
        BNE     L8091

        LDA     (LF2),Y
        CMP     #$21
        BCS     L8067

.L80A8
        BIT     LF4
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
        LDA     LF4
        EOR     #$40
        TAX
        LDA     #$8E
        LDY     #$00
        JMP     OSBYTE

.L80D8
        LDA     #$40
        TRB     LF4
        RTS

.L80DD
        EQUB    $00,$00,$00,$03,$27

.L80E2
        EQUB    $01,$0A,$64,$E8,$10

.L80E7
        AND     L11
        ORA     L0D
        ORA     L0E
        ORA     L0F
        ORA     L10
        BNE     L80FF

        LDA     #$41
        STA     L0D
        EOR     #$13
        STA     L0E
        EOR     #$05
        STA     L0F
.L80FF
        LDA     #$84
        JSR     OSBYTE

        STX     L06
        STY     L07
        DEC     A
        JSR     OSBYTE

        STY     L18
        LDX     #$13
        STX     LFD
        LDX     #$80
        STX     LFE
        STZ     L1F
        STZ     L0402
        STZ     L0403
        LDX     #$FF
        STX     L23
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
        STY     L39
        LDY     #$01
        LDA     (L37),Y
        LDY     #$F6
        CMP     #$F2
        BEQ     L8151

        LDY     #$F8
        BRA     L8151

.L8149
        STY     L39
        LDY     #$01
        LDA     (L37),Y
        ASL     A
        TAY
.L8151
        LDA     L0401,Y
        BEQ     L8190

        STA     L2B
        LDA     L0400,Y
        BRA     L8168

.L815D
        LDY     #$01
        LDA     (L2A),Y
        BEQ     L8190

        TAY
        LDA     (L2A)
        STY     L2B
.L8168
        STA     L2A
        LDY     #$02
        LDA     (L2A),Y
        BNE     L817A

        CPY     L39
        BNE     L815D

        BRA     L8187

.L8176
        LDA     (L2A),Y
        BEQ     L815D

.L817A
        CMP     (L37),Y
        BNE     L815D

        INY
        CPY     L39
        BNE     L8176

        LDA     (L2A),Y
        BNE     L815D

.L8187
        TYA
        ADC     L2A
        STA     L2A
        BCC     L8190

        INC     L2B
.L8190
        RTS

.L8191
        STZ     L3D
        LDA     L18
        STA     L3E
.L8197
        LDY     #$01
        LDA     (L3D),Y
        CMP     L2B
        BCS     L81AD

.L819F
        LDY     #$03
        LDA     (L3D),Y
        ADC     L3D
        STA     L3D
        BCC     L8197

        INC     L3E
        BRA     L8197

.L81AD
        BNE     L81B9

        INY
        LDA     (L3D),Y
        CMP     L2A
        BCC     L819F

        BNE     L81B9

        RTS

.L81B9
        LDY     #$02
        CLC
        RTS

.L81BD
        JSR     L9783

        LDA     L2D
        PHA
        BPL     L81C8

        JSR     LAD20

.L81C8
        JSR     LA069

        STX     L27
        JSR     L9783

        PLA
        STA     L38
        EOR     L2D
        STA     L37
        JSR     LAD07

        LDX     #$39
        JSR     LBD48

        LDX     #$03
.L81E1
        STZ     L3D,X
        LDA     L2A,X
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
        STA     L42
        LDX     #$03
.L8206
        LDA     L39,X
        STZ     L3D,X
        BNE     L8230

        DEX
        BPL     L8206

.L820F
        RTS

.L8210
        TYA
        BEQ     L820F

        LDA     L3D,Y
        STA     L3D
        LDA     L3E,Y
        STA     L3E
        LDA     L3F,Y
        STA     L3F
        STZ     L40
        DEY
        BEQ     L820F

        STZ     L3F
        DEY
        BEQ     L820F

        STZ     L3E
        BRA     L820F

.L8230
        CMP     L2A,Y
        BCS     L823F

.L8235
        LDA     L39,X
        STA     L3D,Y
        STZ     L39,X
        DEX
        BMI     L8210

.L823F
        DEY
        BPL     L8235

.L8242
        LDY     #$08
        STX     L41
.L8246
        ROL     L39,X
        ROL     L3D
        ROL     L3E
        ROL     L3F
        ROL     L40
        LDX     L42
.L8252
        LDA     L3D,X
        CMP     L2A,X
        BNE     L825B

        DEX
        BPL     L8252

.L825B
        BCC     L827C

        LDA     L3D
        SBC     L2A
        STA     L3D
        LDX     L42
        BEQ     L827C

        LDA     L3E
        SBC     L2B
        STA     L3E
        DEX
        BEQ     L827C

        LDA     L3F
        SBC     L2C
        STA     L3F
        LDA     L40
        SBC     L2D
        STA     L40
.L827C
        LDX     L41
        DEY
        BNE     L8246

        ROL     L39,X
        DEX
        BPL     L8242

        RTS

.L8287
        JSR     LBD26

.L828A
        JSR     LA3ED

.L828D
        STZ     L35
        LDA     L2D
        STA     L2E
        BPL     L829A

        JSR     LAD20

        LDA     L2D
.L829A
        BNE     L82C8

        STZ     L34
        LDY     L2A
        LDA     L2C
        BNE     L82BE

        STZ     L33
        LDA     L2B
        BEQ     L82D8

        STY     L32
        LDY     #$90
.L82AE
        ORA     #$00
        BMI     L82FB

.L82B2
        DEY
        ASL     L34
        ROL     L33
        ROL     L32
        ROL     A
        BPL     L82B2

        BRA     L82FB

.L82BE
        STY     L33
        LDY     L2B
        STY     L32
        LDY     #$98
        BRA     L82AE

.L82C8
        LDY     L2C
        STY     L32
        LDY     L2B
        STY     L33
        LDY     L2A
        STY     L34
        LDY     #$A0
        BRA     L82AE

.L82D8
        STZ     L32
        TYA
        BNE     L82F4

.L82DD
        STZ     L31
        STZ     L2E
        STZ     L30
        STZ     L2F
        RTS

.L82E6
        STA     L2E
        JSR     LA731

        LDA     L2E
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
        STY     L30
        STZ     L2F
        STA     L31
        RTS

        LDA     L31
.L8304
        BMI     L8346

.L8306
        BNE     L832F

        ORA     L32
        ORA     L33
        ORA     L34
        ORA     L35
        BEQ     L82DD

        LDY     L30
.L8314
        LDA     L32
        PHA
        LDA     L33
        STA     L32
        LDA     L34
        STA     L33
        LDA     L35
        STA     L34
        STZ     L35
        TYA
        SEC
        SBC     #$08
        TAY
        PLA
        BEQ     L8314

        BRA     L833B

.L832F
        LDY     L30
.L8331
        DEY
        ASL     L35
        ROL     L34
        ROL     L33
        ROL     L32
        ROL     A
.L833B
        BPL     L8331

        CPY     L30
        STY     L30
        BCC     L8345

        DEC     L2F
.L8345
        TAY
.L8346
        STA     L31
        RTS

.L8349
        STZ     L3D
        LDY     L31
        BRA     L8353

.L834F
        LDY     L31
        STY     L3D
.L8353
        LDA     L30
        CMP     #$81
        BCS     L835E

        STY     L3D
        JMP     LA72B

.L835E
        CMP     #$A0
        BCC     L8372

.L8362
        JMP     LA6F2

.L8365
        LSR     L31
        ROR     L32
        ROR     L33
        ROR     L34
        BCC     L8371

        STA     L3D
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
        LDA     L3D
        BNE     L8392

        STZ     L35
        LDA     L34
        ORA     L31,Y
        ORA     L32,Y
        STA     L3D
.L8392
        LDA     L33
        STA     L34
        LDA     L32
        STA     L33,X
        LDA     L31
        STA     L32,X
.L839E
        STZ     L31,X
        DEX
        BPL     L839E

        PLX
        STZ     L35
.L83A6
        LDA     L2E
        BPL     L83C1

.L83AA
        SEC
        LDY     #$00
        TYA
        SBC     L34
        STA     L34
        TYA
        SBC     L33
        STA     L33
        TYA
        SBC     L32
        STA     L32
        TYA
        SBC     L31
        STA     L31
.L83C1
        RTS

.L83C2
        INC     L34
        BNE     L83D2

        INC     L33
        BNE     L83D2

        INC     L32
        BNE     L83D2

        INC     L31
        BEQ     L8362

.L83D2
        RTS

.L83D3
        LDY     #$02
.L83D5
        ROR     L11
        ROR     L10
        LDA     L0F
        STA     L11
        ROR     A
        PHA
        LDA     L0E
        LDX     L0D
        LSR     L0F
        ROR     A
        ROR     L0D
        LSR     L0F
        ROR     A
        ROR     L0D
        LSR     L0F
        ROR     A
        ROR     L0D
        LSR     L0F
        ROR     A
        ROR     L0D
        EOR     L10
        STX     L0F
        LDX     L0E
        STX     L10
        STA     L0E
        PLA
        EOR     L0D
        STA     L0D
        DEY
        BNE     L83D5

        RTS

.L840A
        LDA     L3B
        STA     L2E
        STZ     L2F
        LDA     L3C
        STA     L30
        LDA     L3D
        STA     L31
        LDA     L3E
        STA     L32
        LDA     L3F
        STA     L33
        LDA     L40
        STA     L34
        LDA     L41
        STA     L35
.L8428
        RTS

.L8429
        LDA     L31
        BEQ     L840A

        SEC
        LDA     L30
        SBC     L3C
        BEQ     L84A3

        BCC     L846A

        CMP     #$25
        BCS     L8428

        TAY
        AND     #$38
        BEQ     L8456

        SEC
.L8440
        LDX     L40
        STX     L41
        LDX     L3F
        STX     L40
        LDX     L3E
        STX     L3F
        LDX     L3D
        STX     L3E
        STZ     L3D
        SBC     #$08
        BNE     L8440

.L8456
        TYA
        AND     #$07
        BEQ     L84A3

.L845B
        LSR     L3D
        ROR     L3E
        ROR     L3F
        ROR     L40
        ROR     L41
        DEC     A
        BNE     L845B

        BRA     L84A3

.L846A
        EOR     #$FF
        INC     A
        CMP     #$25
        BCS     L840A

        LDY     L3C
        STY     L30
        TAY
        AND     #$38
        BEQ     L8491

        SEC
.L847B
        LDX     L34
        STX     L35
        LDX     L33
        STX     L34
        LDX     L32
        STX     L33
        LDX     L31
        STX     L32
        STZ     L31
        SBC     #$08
        BNE     L847B

.L8491
        TYA
        AND     #$07
        BEQ     L84A3

.L8496
        LSR     L31
        ROR     L32
        ROR     L33
        ROR     L34
        ROR     L35
        DEC     A
        BNE     L8496

.L84A3
        LDA     L2E
        EOR     L3B
        BMI     L84AD

        CLC
        JMP     LA489

.L84AD
        LDA     L31
        CMP     L3D
        BNE     L84CE

        LDA     L32
        CMP     L3E
        BNE     L84CE

        LDA     L33
        CMP     L3F
        BNE     L84CE

        LDA     L34
        CMP     L40
        BNE     L84CE

        LDA     L35
        CMP     L41
        BNE     L84CE

        JMP     LA72B

.L84CE
        BCS     L84F4

        LDA     L3B
        STA     L2E
        SEC
        LDA     L41
        SBC     L35
        STA     L35
        LDA     L40
        SBC     L34
        STA     L34
        LDA     L3F
        SBC     L33
        STA     L33
        LDA     L3E
        SBC     L32
        STA     L32
        LDA     L3D
        SBC     L31
        JMP     L8304

.L84F4
        LDA     L35
        SBC     L41
        STA     L35
        LDA     L34
        SBC     L40
        STA     L34
        LDA     L33
        SBC     L3F
        STA     L33
        LDA     L32
        SBC     L3E
        STA     L32
        LDA     L31
        SBC     L3D
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
        STA     L28
        JMP     L90D0

.L89DD
        JSR     L8F9D

        EOR     #$5D
        BEQ     L89D7

        JSR     L9C80

        DEC     L0A
        JSR     L8AA8

        DEC     L0A
        LDA     L28
        LSR     A
        BCC     L8A6B

        LDA     L1E
        ADC     #$04
        STA     L3F
        LDA     L38
        JSR     LBDAC

        LDA     L37
        JSR     LBDCF

        LDX     #$FC
        LDY     L39
        BPL     L8A0B

        LDY     L36
.L8A0B
        STY     L38
        BEQ     L8A28

        LDY     #$00
.L8A11
        INX
        BNE     L8A1E

        JSR     LBAC2

        LDX     L3F
        JSR     LBDFF

        LDX     #$FD
.L8A1E
        LDA     (L3A),Y
        JSR     LBDCF

        INY
        DEC     L38
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
        LDA     (L0B)
        CMP     #$2E
        BNE     L8A4B

.L8A3C
        JSR     LBD77

        DEX
        BNE     L8A44

        LDX     #$01
.L8A44
        INY
        LDA     (L0B),Y
        CPY     L4E
        BNE     L8A3C

.L8A4B
        JSR     LBDFF

        DEY
.L8A4F
        INY
        CMP     (L0B),Y
        BEQ     L8A4F

.L8A54
        LDA     (L0B),Y
        CMP     #$3A
        BEQ     L8A64

        CMP     #$0D
        BEQ     L8A68

.L8A5E
        JSR     LBD77

        INY
        BRA     L8A54

.L8A64
        CPY     L0A
        BCC     L8A5E

.L8A68
        JSR     LBAC2

.L8A6B
        LDY     L0A
        DEY
.L8A6E
        INY
        LDA     (L0B),Y
        CMP     #$3A
        BEQ     L8A79

        CMP     #$0D
        BNE     L8A6E

.L8A79
        JSR     L9C6C

        LDA     (L0B)
        CMP     #$3A
        BEQ     L8A8E

        LDA     L0C
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

        STA     L27
        JSR     LB365

        JSR     L9338

        STY     L4E
.L8AA8
        JSR     L8F9D

        LDY     #$00
        STZ     L3D
        CMP     #$3A
        BEQ     L8B1B

        CMP     #$0D
        BEQ     L8B1B

        CMP     #$5C
        BEQ     L8B1B

        CMP     #$2E
        BEQ     L8A91

        DEC     L0A
        LDX     #$03
.L8AC3
        LDY     L0A
        INC     L0A
        LDA     (L0B),Y
        BMI     L8AF5

        CMP     #$20
        BEQ     L8ADF

        LDY     #$05
        ASL     A
        ASL     A
        ASL     A
.L8AD4
        ASL     A
        ROL     L3D
        ROL     L3E
        DEY
        BNE     L8AD4

        DEX
        BNE     L8AC3

.L8ADF
        LDX     #$45
        LDA     L3D
.L8AE3
        CMP     L8909,X
        BNE     L8AEF

        LDY     L894E,X
        CPY     L3E
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

        INC     L0A
        INY
        LDA     (L0B),Y
        AND     #$DF
        CMP     #$41
        BNE     L8AF2

.L8B10
        LDA     L8993,X
        STA     L29
        LDY     #$01
        CPX     #$20
        BCS     L8B63

.L8B1B
        LDA     L0440
        STA     L37
        STY     L39
        LDX     L28
        CPX     #$04
        LDX     L0441
        STX     L38
        BCC     L8B33

        LDA     L043C
        LDX     L043D
.L8B33
        STA     L3A
        STX     L3B
        TYA
        BEQ     L8B62

        BPL     L8B40

        LDY     L36
        BEQ     L8B62

.L8B40
        DEY
        LDA     L29,Y
        BIT     L39
        BPL     L8B4B

        LDA     L0600,Y
.L8B4B
        STA     (L3A),Y
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
        LDA     L2A
        SBC     L0440
        TAY
        LDA     L2B
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
        LDA     L28
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
        STY     L2A
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
        LDA     L2B
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

        INC     L29
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
        LDA     L2B
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
        LDA     (L0B),Y
        JSR     L8E41

        BCS     L8C31

        LDY     #$16
        CPX     #$34
        BCC     L8C57

        BNE     L8C55

        LDY     #$36
.L8C55
        STY     L29
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
        LDA     L2B
        BNE     L8C74

        LDX     #$0F
        LDA     #$64
        STA     L29
        DEY
.L8C74
        PHY
        JSR     L8DA2

        BNE     L8C84

        JSR     L8D94

        BNE     L8C41

        TXA
        ADC     L29
        STA     L29
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

        DEC     L0A
.L8C96
        JSR     L9332

.L8C99
        BRA     L8C1B

.L8C9B
        JSR     L8D9C

        BNE     L8C31

        LDY     #$89
        STY     L29
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

        DEC     L0A
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

        LDA     L3D
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
        STA     L37
        JSR     L8DA2

        BNE     L8C99

        JSR     L8F9D

        AND     #$1F
        CMP     L37
        BNE     L8CE3

        JSR     L8D86

        BRA     L8C99

.L8D16
        JSR     L9332

        PLA
        STA     L37
        JSR     L8DA2

        BNE     L8D34

        JSR     L8F9D

        AND     #$1F
        CMP     L37
        BNE     L8CE3

        JSR     L8D86

        LDA     L2B
        BEQ     L8D34

        JMP     L8BB6

.L8D34
        JMP     L8C1E

.L8D37
        BNE     L8D44

        JSR     L9332

        LDA     L2A
        STA     L28
        LDY     #$00
        BRA     L8D6E

.L8D44
        LDX     #$01
        LDY     L0A
        INC     L0A
        LDA     (L0B),Y
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
        LDA     L28
        PHA
        JSR     L9DF3

        BNE     L8D71

        PLA
        STA     L28
        JSR     L9338

        LDY     #$FF
        BRA     L8D6E

.L8D86
        JSR     L8D89

.L8D89
        JSR     L8D8C

.L8D8C
        LDA     L29
        CLC
        ADC     #$04
        STA     L29
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
        STA     (L37)
        CLC
        TYA
        ADC     L37
        STA     L39
        LDY     #$00
        TYA
        ADC     L38
        STA     L3A
.L8DB7
        INY
        LDA     (L39),Y
        STA     (L37),Y
        CMP     #$0D
        BNE     L8DB7

        RTS

.L8DC1
        AND     #$0F
        STA     L3D
        LDX     #$00
        LDY     #$00
.L8DC9
        INY
        LDA     (L37),Y
        JSR     L8E51

        BCC     L8DFF

        AND     #$0F
        PHA
        STX     L3E
        LDA     L3D
        ASL     A
        ROL     L3E
        BMI     L8DFC

        ASL     A
        ROL     L3E
        BMI     L8DFC

        ADC     L3D
        STA     L3D
        TXA
        ADC     L3E
        ASL     L3D
        ROL     A
        BMI     L8DFC

        BCS     L8DFC

        TAX
        PLA
        ADC     L3D
        STA     L3D
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

        LDA     L37
        STA     L39
        LDA     L38
        STA     L3A
        JSR     L8E5F

        JSR     L8E5F

        JSR     L8E5F

.L8E16
        LDA     (L39),Y
        STA     (L37),Y
        DEY
        BNE     L8E16

        LDY     #$03
.L8E1F
        TXA
        ORA     #$40
        STA     (L39),Y
        DEY
        LDA     L3D
        AND     #$3F
        ORA     #$40
        STA     (L39),Y
        DEY
        LDA     #$3F
        TRB     L3D
        TXA
        AND     #$C0
        LSR     A
        LSR     A
        ORA     L3D
        LSR     A
        LSR     A
        EOR     #$54
        STA     (L39),Y
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
        LDA     (L37)
.L8E5F
        INC     L37
        BNE     L8E9C

        INC     L38
        RTS

.L8E66
        JSR     L8E5F

        LDA     (L37)
        RTS

.L8E6C
        JSR     L8E5F

.L8E6F
        LDA     (L37)
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
        STZ     L3B
.L8EA6
        STZ     L3C
        BRA     L8E6F

.L8EAA
        CMP     #$2C
        BEQ     L8E6C

        CMP     #$2A
        BNE     L8EBE

        LDA     L3B
        BEQ     L8E9C

.L8EB6
        LDX     #$FF
        STX     L3B
        STZ     L3C
        BRA     L8E6C

.L8EBE
        CMP     #$2E
        BEQ     L8ED0

        JSR     L8E51

        BCC     L8EF3

        LDX     L3C
        BEQ     L8ED0

        JSR     L8DC1

        BCC     L8E6C

.L8ED0
        LDA     (L37)
        JSR     L8E58

        BCC     L8EDC

        JSR     L8E5F

        BRA     L8ED0

.L8EDC
        LDX     #$FF
        STX     L3B
        BRA     L8EA6

.L8EE2
        JSR     L8E41

        BCC     L8EB6

.L8EE7
        LDA     (L37)
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
        STX     L39
        LDX     #$85
        STX     L3A
.L8F03
        LDY     #$00
        CMP     (L39)
        BCC     L8EE7

        BNE     L8F1A

.L8F0B
        INY
        LDA     (L39),Y
        BMI     L8F41

        CMP     (L37),Y
        BEQ     L8F0B

        LDA     (L37),Y
        CMP     #$2E
        BEQ     L8F25

.L8F1A
        INY
        LDA     (L39),Y
        BPL     L8F1A

        CMP     #$FE
        BNE     L8F32

        BCS     L8EE7

.L8F25
        INY
.L8F26
        LDA     (L39),Y
        BMI     L8F41

        INC     L39
        BNE     L8F26

        INC     L3A
        BRA     L8F26

.L8F32
        SEC
        INY
        TYA
        ADC     L39
        STA     L39
        BCC     L8F3D

        INC     L3A
.L8F3D
        LDA     (L37)
        BRA     L8F03

.L8F41
        TAX
        INY
        LDA     (L39),Y
        STA     L3D
        DEY
        LSR     A
        BCC     L8F52

        LDA     (L37),Y
        JSR     L8E41

        BCS     L8EE7

.L8F52
        TXA
        BIT     L3D
        BVC     L8F5D

        LDX     L3B
        BNE     L8F5D

        ADC     #$40
.L8F5D
        DEY
        JSR     L8DA8

        LDX     #$FF
        LDA     L3D
        LSR     A
        LSR     A
        BCC     L8F6D

        STX     L3B
        STZ     L3C
.L8F6D
        LSR     A
        BCC     L8F74

        STZ     L3B
        STZ     L3C
.L8F74
        LSR     A
        BCC     L8F87

        PHA
        LDY     #$01
.L8F7A
        LDA     (L37),Y
        JSR     L8E41

        BCC     L8F86

        JSR     L8E5F

        BRA     L8F7A

.L8F86
        PLA
.L8F87
        LSR     A
        BCC     L8F8C

        STX     L3C
.L8F8C
        LSR     A
        BCS     L8F9C

        JMP     L8E6C

.L8F92
        LDY     L1B
        INC     L1B
        LDA     (L19),Y
        CMP     #$20
        BEQ     L8F92

.L8F9C
        RTS

.L8F9D
        LDY     L0A
        INC     L0A
        LDA     (L0B),Y
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

        LDA     L18
        STA     L38
        STZ     L37
        LDA     #$00
        STA     (L37),Y
        JSR     LBE25

        BRA     L9048

.L8FD7
        JSR     L9C6A

.L8FDA
        JSR     LBBDC

        LDA     L18
        STA     L0C
        STZ     L0B
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

        STA     L2B
        STX     L2A
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
        STZ     L0B
        LDA     #$07
        STA     L0C
.L9024
        LDA     (L00)
        BEQ     L9048

        STA     (L0B),Y
        INY
        BEQ     L9045

        INC     L00
        BNE     L9033

        INC     L01
.L9033
        CMP     #$0D
        BNE     L9024

        LDA     L01
        CMP     L07
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
        STY     L0C
        STZ     L0B
        JSR     LB2E0

        LDA     #$3E
        JSR     OSWRCH

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

        LDX     L0B
        LDY     L0C
        JSR     OSCLI

.L9073
        LDA     #$0D
        LDY     L0A
        DEY
.L9078
        INY
        CMP     (L0B),Y
        BNE     L9078

.L907D
        JSR     L9C80

        BRA     L9086

.L9082
        CMP     #$0D
        BNE     L9073

.L9086
        LDA     L0C
        CMP     #$07
        BEQ     L904B

        LDY     #$01
        LDA     (L0B),Y
        BMI     L904B

        LDX     L20
        BEQ     L90A0

        STA     L2B
        INY
        LDA     (L0B),Y
        STA     L2A
        JSR     L9D0F

.L90A0
        LDY     #$04
        STY     L0A
        BRA     L90D2

.L90A6
        LDA     #$03
        STA     L28
        JMP     L89DD

.L90AD
        JMP     LBED3

.L90B0
        LDY     L0A
        DEY
        LDA     (L0B),Y
        CMP     #$2A
        BEQ     L9069

        CMP     #$5B
        BEQ     L90A6

        CMP     #$A2
        BEQ     L90AD

        CMP     #$3D
        BEQ     L9123

.L90C5
        DEC     L0A
.L90C7
        JSR     L9C6A

.L90CA
        LDA     (L0B)
        CMP     #$3A
        BNE     L9082

.L90D0
        LDY     L0A
.L90D2
        INC     L0A
        LDA     (L0B),Y
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
        LDX     L0B
        STX     L19
        LDX     L0C
        STX     L1A
        JSR     L99D6

        BNE     L9112

        BCS     L90B0

        STX     L1B
        JSR     L9C4A

        JSR     L9923

        LDX     #$05
        CPX     L2C
        BNE     L9108

        INX
.L9108
        JSR     L9952

        DEC     L0A
.L910D
        JSR     L997D

        BEQ     L9146

.L9112
        BCC     L9135

        JSR     LBC66

        JSR     L9C16

        LDA     L27
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
        LDA     L2A
        PHA
        LDA     L2B
        PHA
        LDA     L2C
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
        LDA     L2C
        CMP     #$80
        BEQ     L91EF

        LDY     #$02
        LDA     (L2A),Y
        CMP     L36
        BCS     L91D1

        LDA     L02
        STA     L2C
        LDA     L03
        STA     L2D
        LDA     L36
        CMP     #$08
        BCC     L9193

        ADC     #$07
        BCC     L9193

        LDA     #$FF
.L9193
        CLC
        PHA
        TAX
        LDA     (L2A),Y
        ADC     (L2A)
        EOR     L02
        BNE     L91AD

        DEY
        ADC     (L2A),Y
        EOR     L03
        BNE     L91AD

        STA     L2D
        TXA
        INY
        SEC
        SBC     (L2A),Y
        TAX
.L91AD
        TXA
        CLC
        ADC     L02
        TAY
        LDA     L03
        ADC     #$00
        TAX
        CPY     L04
        SBC     L05
        BCS     L9164

        STY     L02
        STX     L03
        PLA
        LDY     #$02
        STA     (L2A),Y
        DEY
        LDA     L2D
        BEQ     L91D1

        STA     (L2A),Y
        LDA     L2C
        STA     (L2A)
.L91D1
        LDY     #$03
        LDA     L36
        STA     (L2A),Y
        BEQ     L91EE

        LDY     #$01
        LDA     (L2A),Y
        STA     L2D
        LDA     (L2A)
        STA     L2C
        DEY
.L91E4
        LDA     L0600,Y
        STA     (L2C),Y
        INY
        CPY     L36
        BNE     L91E4

.L91EE
        RTS

.L91EF
        JSR     LBE6B

        CPY     #$00
        BEQ     L9201

.L91F6
        LDA     L0600,Y
        STA     (L2A),Y
        DEY
        BNE     L91F6

        LDA     L0600
.L9201
        STA     (L2A)
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
        LDA     L27
        JSR     OSBPUT

        TAX
        BEQ     L9237

        BMI     L922A

        LDX     #$03
.L9220
        LDA     L2A,X
        JSR     OSBPUT

        DEX
        BPL     L9220

        BRA     L9207

.L922A
        LDX     #$04
.L922C
        LDA     L046C,X
        JSR     OSBPUT

        DEX
        BPL     L922C

        BRA     L9207

.L9237
        LDA     L36
        JSR     OSBPUT

        TAX
        BEQ     L9207

.L923F
        LDA     L05FF,X
        JSR     OSBPUT

        DEX
        BNE     L923F

        BRA     L9207

.L924A
        PLA
        STY     L0A
        JMP     L90C7

.L9250
        JSR     L8D9C

        BEQ     L9204

        DEC     L0A
        BRA     L926E

.L9259
        LDA     L0400
        BEQ     L926E

        LDA     L1E
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
        STA     L14
.L9274
        ROR     L15
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
        STZ     L14
        STZ     L15
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

        LDA     L14
        PHA
        LDA     L15
        PHA
        DEC     L1B
        JSR     L9DFF

        PLA
        STA     L15
        PLA
        STA     L14
        LDA     L1B
        STA     L0A
        TYA
        BEQ     L92DA

        JSR     LA181

        LDA     L14
        SEC
        SBC     L36
        BCC     L92DA

        BEQ     L92DA

        TAY
.L92D4
        JSR     LBDD2

        DEY
        BNE     L92D4

.L92DA
        LDA     L36
        BEQ     L9276

        LDY     #$00
.L92E0
        LDA     L0600,Y
        JSR     LBDD8

        INY
        CPY     L36
        BNE     L92E0

        BRA     L9276

.L92ED
        JMP     L8FBB

.L92F0
        LDA     L2A
        PHA
        JSR     L976C

        LDA     #$1F
        JSR     OSWRCH

        PLA
        JSR     OSWRCH

        JSR     L990F

        BRA     L932D

.L9304
        JSR     L9774

        JSR     L8FA8

        BEQ     L92F0

        CMP     #$29
        BNE     L92ED

        LDA     L2A
        SBC     L1E
        BEQ     L932D

        TAX
        BCS     L9325

        JSR     LBAC2

        BRA     L9321

.L931E
        JSR     L9779

.L9321
        LDX     L2A
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
        DEC     L0A
.L9332
        JSR     L9DF3

        JSR     L9784

.L9338
        LDY     L1B
        STY     L0A
        RTS

.L933D
        LDX     L0B
        STX     L19
        LDX     L0C
        STX     L1A
        LDX     L0A
        STX     L1B
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
        LDA     (L19),Y
        CMP     #$0D
        BEQ     L9357

        CMP     #$22
        BNE     L937C

        INY
        STY     L1B
        LDA     (L19),Y
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

        LDY     L1B
        JSR     L99D0

        BEQ     L93C4

        PLY
        INY
        LDA     L2A
        STA     L0600,Y
        INY
        LDA     L2B
        STA     L0600,Y
        INY
        LDA     L2C
        STA     L0600,Y
        INC     L0600
        BRA     L938F

.L93B4
        PLY
        DEC     L1B
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
        JMP     (L2A)

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

        LDA     L2A
        STA     L39
        LDA     L2B
        STA     L3A
        JSR     LBD26

.L93FA
        JSR     LBAC8

        JSR     L9C8E

        JSR     LBF2F

        LDA     L39
        CMP     L2A
        LDA     L3A
        SBC     L2B
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

        LDA     L2B
        BNE     L947F

        LDA     L2A
        BEQ     L947F

        JMP     L9C6A

.L9433
        JMP     L9C74

.L9436
        LDA     L12
        STA     L3B
        LDA     L13
        STA     L3C
.L943E
        LDA     L18
        STA     L38
        LDY     #$01
        STY     L37
        RTS

.L9447
        JSR     L9410

        LDX     #$39
        JSR     LBD48

        JSR     LBE25

        JSR     L9436

.L9455
        LDA     (L37)
        BMI     L9487

        STA     (L3B)
        LDA     (L37),Y
        STA     (L3B),Y
        SEC
        TYA
        ADC     L3B
        STA     L3B
        BCC     L9469

        INC     L3C
.L9469
        CMP     L06
        LDA     L3C
        SBC     L07
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
        LDA     (L37)
        BMI     L94AA

        LDA     L3A
        STA     (L37)
        LDA     L39
        STA     (L37),Y
        CLC
        LDA     L39
        ADC     L2A
        STA     L39
        LDA     #$00
        ADC     L3A
        AND     #$7F
        STA     L3A
        JSR     L953D

        BRA     L948A

.L94AA
        LDA     L18
        STA     L0C
        STZ     L0B
.L94B0
        LDY     #$01
        LDA     (L0B),Y
        BMI     L951D

        LDY     #$04
        STZ     L2C
.L94BA
        LDA     (L0B),Y
        LDX     L2C
        BNE     L94C8

        CMP     #$8D
        BEQ     L94DE

        CMP     #$F4
        BEQ     L94D5

.L94C8
        INY
        CMP     #$22
        BNE     L94D1

        EOR     L2C
        STA     L2C
.L94D1
        CMP     #$0D
        BNE     L94BA

.L94D5
        LDY     #$03
        LDA     (L0B),Y
        JSR     L9CB8

        BRA     L94B0

.L94DE
        JSR     L9BEE

        JSR     L9436

.L94E4
        LDA     (L37)
        BMI     L951F

        LDA     (L3B)
        CMP     L2B
        BNE     L950D

        LDA     (L3B),Y
        CMP     L2A
        BNE     L950D

        LDA     (L37),Y
        STA     L3D
        LDA     (L37)
        TAX
        LDY     L0A
        DEY
        LDA     L0B
        STA     L39
        LDA     L0C
        STA     L3A
        JSR     L8E1F

.L9509
        LDY     L0A
        BRA     L94BA

.L950D
        CLC
        JSR     L953D

        LDA     L3B
        ADC     #$02
        STA     L3B
        BCC     L94E4

        INC     L3C
        BRA     L94E4

.L951D
        BRA     L9579

.L951F
        JSR     LBF0F

        EQUS    "Failed at "

        LDA     (L0B),Y
        STA     L2B
        INY
        LDA     (L0B),Y
        STA     L2A
        JSR     LA0E8

        JSR     LBAC2

        BRA     L9509

.L953D
        INY
        LDA     (L37),Y
        LDY     #$01
        ADC     L37
        STA     L37
        BCC     L954B

        INC     L38
        CLC
.L954B
        RTS

.L954C
        JSR     L9410

        LDA     L2A
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
        ADC     L2A
        STA     L2A
        BCC     L9555

        INC     L2B
        BPL     L9555

.L9579
        JMP     L9048

.L957C
        JMP     L96CA

.L957F
        DEC     L0A
        JSR     L997D

        BEQ     L95F1

        BCS     L95F1

        JSR     LBC83

        JSR     L9774

        JSR     LBF2F

        LDA     L2D
        ORA     L2C
        BNE     L95F1

        CLC
        LDA     L2A
        ADC     L02
        TAY
        LDA     L2B
        ADC     L03
        TAX
        CPY     L04
        SBC     L05
        BCS     L957C

        LDA     L02
        STA     L2A
        LDA     L03
        STA     L2B
        STY     L02
        STX     L03
        LDA     #$40
        STA     L27
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
        LSR     L40
        ROR     L3F
        BCC     L95E0

        CLC
        TYA
        ADC     L2A
        TAY
        TXA
        ADC     L2B
        TAX
        BCS     L95F1

.L95E0
        ASL     L2A
        ROL     L2B
        BCS     L95F1

        LDA     L3F
        ORA     L40
        BNE     L95CF

        STY     L2A
        STX     L2B
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
        ADC     L0B
        LDX     L0C
        BCC     L9606

        INX
        CLC
.L9606
        SBC     #$00
        STA     L37
        TXA
        SBC     #$00
        STA     L38
        LDX     #$05
        STX     L3F
        LDX     L0A
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
        DEC     L3F
        INY
        INX
        LDA     (L37),Y
        CMP     #$28
        BEQ     L9635

.L9632
        JMP     L957F

.L9635
        INY
        STX     L0A
        JSR     L8149

.L963B
        BNE     L95F1

        JSR     L9923

        LDX     #$01
        JSR     L9952

        LDA     L3F
        PHA
        LDA     #$01
        PHA
        JSR     LAE60

.L964E
        JSR     LBC66

        JSR     L9332

        LDA     L2B
        AND     #$C0
        ORA     L2C
        ORA     L2D
        BNE     L95F1

        JSR     LBF2F

        PLY
        LDA     L2A
        STA     (L02),Y
        INY
        LDA     L2B
        STA     (L02),Y
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
        STA     L3F
        STZ     L40
        JSR     L95CB

        PLA
        PHA
        ADC     L2A
        STA     L2A
        BCC     L968D

        INC     L2B
.L968D
        LDA     L03
        STA     L38
        LDA     L02
        STA     L37
        CLC
        ADC     L2A
        TAY
        LDA     L2B
        ADC     L03
        BCS     L96CA

        TAX
        CPY     L04
        SBC     L05
        BCS     L96CA

        STY     L02
        STX     L03
        PLA
        STA     (L37)
        ADC     L37
        TAY
        LDA     #$00
        STZ     L37
        BCC     L96B8

        INC     L38
.L96B8
        STA     (L37),Y
        INY
        BNE     L96BF

        INC     L38
.L96BF
        CPY     L02
        BNE     L96B8

        CPX     L38
        BNE     L96B8

        JMP     L95BE

.L96CA
        BRK
        EQUB    $0B

        EQUS    $DE," space"

        EQUB    $00

.L96D4
        JSR     L977E

        LDA     L2A
        STA     L06
        STA     L04
        LDA     L2B
        STA     L07
        STA     L05
        BRA     L9700

.L96E5
        JSR     L977E

        LDA     L2A
        STA     L00
        STA     L02
        LDA     L2B
        STA     L01
        STA     L03
        JSR     LBBEB

        BRA     L9700

.L96F9
        JSR     L977E

        LDA     L2B
        STA     L18
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

        LDA     L2A
        STA     L21
        LDA     L2B
.L9724
        STA     L22
        LDA     #$FF
.L9728
        STA     L20
        BRA     L9700

.L972C
        INC     L0A
        JSR     L9C6A

        LDA     #$FF
        BNE     L9724

.L9735
        INC     L0A
        JSR     L9C6A

        LDA     #$00
        BRA     L9728

.L973E
        INY
        LDA     (L0B),Y
        CMP     #$24
        BEQ     L9753

        JSR     L977E

        STZ     L2E
        LDX     #$2A
        LDY     #$00
        LDA     #$02
.L9750
        JMP     LB34C

.L9753
        INC     L0A
        JSR     L9C0A

        LDA     L27
        BNE     L979C

        LDA     #$0F
        LDY     L36
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
        LDA     L27
.L9783
        TAY
.L9784
        BEQ     L979C

        BPL     L979B

.L9788
        JSR     L834F

.L978B
        LDA     L31
        STA     L2D
        LDA     L32
        STA     L2C
        LDA     L33
        STA     L2B
        LDA     L34
        STA     L2A
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
        LDA     L0B
        STA     L19
        LDA     L0C
        STA     L1A
        LDA     L0A
        STA     L1B
        LDA     #$F2
        JSR     LB057

        JSR     L9C5A

        JMP     L90CA

.L97C0
        LDA     #$0D
        STA     (L2A)
        BRA     L97EE

.L97C6
        CPY     #$80
        BEQ     L97C0

        LDY     #$03
        LDA     #$00
        STA     (L2A),Y
        BEQ     L97EE

.L97D2
        TSX
        CPX     #$FC
        BCS     L9801

        JSR     L997D

        BEQ     L97FE

        JSR     LB1BF

        LDY     L2C
        BMI     L97C6

        JSR     LBC83

        JSR     LAC38

        STA     L27
        JSR     LB365

.L97EE
        TSX
        INC     L0106,X
        LDY     L1B
        STY     L0A
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

        LDA     L2A
        PHA
        JSR     L9771

        JSR     L9C5A

        LDA     #$12
        JSR     OSWRCH

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

        LDA     L04
        CMP     L06
        BNE     L9808

        LDA     L05
        CMP     L07
        BNE     L9808

        LDX     L2A
        LDA     #$85
        JSR     OSBYTE

        CPX     L02
        TYA
        SBC     L03
        BCC     L9808

        CPX     L12
        TYA
        SBC     L13
        BCC     L9808

        STX     L06
        STX     L04
        STY     L07
        STY     L05
.L9866
        STZ     L1E
        LDA     #$16
.L986A
        JSR     OSWRCH

        LDA     L2A
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

        LDA     L2A
        PHA
        JSR     L9771

.L9889
        JSR     LBC66

        JSR     L9771

        JSR     L9C5A

        LDA     #$19
        JSR     OSWRCH

        PLA
        JSR     OSWRCH

        JSR     LBD46

        LDA     L37
        JSR     OSWRCH

        LDA     L38
        JSR     OSWRCH

        JSR     L990F

        LDA     L2B
        BRA     L98BD

.L98AF
        JSR     L9C6A

        LDA     #$10
        BRA     L98BD

.L98B6
        JSR     L9C6A

        STZ     L1E
        LDA     #$0C
.L98BD
        JSR     OSWRCH

.L98C0
        JMP     L90CA

.L98C3
        JSR     L9C6A

        JSR     LBAC2

        LDY     #$01
.L98CB
        LDA     (LFD),Y
        BEQ     L98C0

        JSR     LBD77

        INY
        BNE     L98CB

        BRA     L98C0

.L98D7
        LDA     L2B
        JSR     OSWRCH

.L98DC
        JSR     L8F9D

.L98DF
        CMP     #$3A
        BEQ     L990C

        CMP     #$0D
        BEQ     L990C

        CMP     #$8B
        BEQ     L990C

        DEC     L0A
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
        JSR     OSWRCH

        DEY
        BNE     L9904

        BRA     L98DC

.L990C
        JMP     L90C5

.L990F
        LDA     L2A
        JMP     (L020E)

.L9914
        LDY     #$01
        LDA     (L37),Y
        TAX
        LDA     #$F6
        CPX     #$F2
        BEQ     L9928

        LDA     #$F8
        BRA     L9928

.L9923
        LDY     #$01
        LDA     (L37),Y
        ASL     A
.L9928
        LDX     #$04
.L992A
        STA     L3A
        STX     L3B
        LDA     (L3A),Y
        BEQ     L9937

        TAX
        LDA     (L3A)
        BRA     L992A

.L9937
        LDA     L03
        STA     (L3A),Y
        LDA     L02
        STA     (L3A)
        LDA     #$00
        STA     (L02),Y
        INY
        CPY     L39
        BEQ     L9979

.L9948
        LDA     (L37),Y
        STA     (L02),Y
        INY
        CPY     L39
        BNE     L9948

        RTS

.L9952
        LDA     #$00
.L9954
        STA     (L02),Y
        INY
        DEX
        BNE     L9954

.L995A
        CLC
        TYA
        ADC     L02
        BCC     L9962

        INC     L03
.L9962
        LDY     L03
        CPY     L05
        BCC     L9977

        BNE     L996E

        CMP     L04
        BCC     L9977

.L996E
        LDA     #$00
        LDY     #$01
        STA     (L3A),Y
        JMP     L9164

.L9977
        STA     L02
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
        CPX     L2C
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
        INC     L1B
        JSR     L9779

        JMP     L9A99

.L99AB
        INC     L1B
        JSR     L9779

        LDA     L2B
        BEQ     L99BA

        LDA     #$80
        STA     L2C
        SEC
        RTS

.L99BA
        BRK
        EQUB    $08

        EQUS    "$ range"

        EQUB    $00

.L99C4
        LDA     L0B
        STA     L19
        LDA     L0C
        STA     L1A
        LDY     L0A
        DEY
.L99CF
        INY
.L99D0
        LDA     (L19),Y
        CMP     #$20
        BEQ     L99CF

.L99D6
        STY     L1B
.L99D8
        CMP     #$40
        BCC     L9990

        CMP     #$5B
        BCS     L99FA

        ASL     A
        ASL     A
        STA     L2A
        INY
        LDA     (L19),Y
        CMP     #$25
        BNE     L99FA

        LDA     #$04
        STA     L2B
        LDX     #$04
        STX     L2C
        INY
        LDA     (L19),Y
        CMP     #$28
        BNE     L9A67

.L99FA
        LDX     #$05
        STX     L2C
        CLC
        LDY     L1A
        LDA     L1B
        TAX
        BNE     L9A0E

        DEC     A
        ADC     L19
        BCS     L9A14

        DEY
        BRA     L9A14

.L9A0E
        DEC     A
        ADC     L19
        BCC     L9A14

        INY
.L9A14
        STA     L37
        STY     L38
        LDY     #$01
        LDA     (L37),Y
        CMP     #$41
        BCS     L9A3A

        CMP     #$30
        BCC     L9A46

        CMP     #$3A
        BCS     L9A46

.L9A28
        INX
        INY
        LDA     (L37),Y
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

        DEC     L2C
        INX
        INY
        LDA     (L37),Y
.L9A58
        CMP     #$28
        BEQ     L9AA0

        JSR     L8149

        BEQ     L9A75

        STX     L1B
.L9A63
        LDY     L1B
        LDA     (L19),Y
.L9A67
        CMP     #$21
        BEQ     L9A79

        EOR     #$3F
        BEQ     L9A7B

        CLC
        STY     L1B
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
        STY     L1B
        JSR     LB1DE

        JSR     L9784

        LDA     L2B
        PHA
        LDA     L2A
        PHA
        JSR     L9779

        CLC
        PLA
        ADC     L2A
        STA     L2A
        PLA
        ADC     L2B
        STA     L2B
.L9A99
        PLA
        STA     L2C
        CLC
        LDA     #$FF
        RTS

.L9AA0
        JSR     L9AC9

        BRA     L9A63

.L9AA5
        DEC     L2C
        INX
        INY
        LDA     (L37),Y
        CMP     #$28
        BEQ     L9ABC

        JSR     L8149

        BEQ     L9A75

        STX     L1B
.L9AB6
        LDA     #$81
        STA     L2C
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

        STX     L1B
        LDA     L2C
        PHA
        LDA     L2A
        PHA
        LDA     L2B
        PHA
        LDA     (L2A)
        CMP     #$04
        BCC     L9B4C

        JSR     LAC38

        INC     L2D
.L9AE6
        JSR     LBC66

        JSR     L9774

        INC     L1B
        CPX     #$2C
        BNE     L9AC1

        LDX     #$39
        JSR     LBD48

        PLA
        STA     L38
        PLY
        STY     L37
        PHY
        PHA
        LDY     L3C
        JSR     L9B97

        STY     L2D
        LDA     (L37),Y
        STA     L3F
        INY
        LDA     (L37),Y
        STA     L40
        LDA     L2A
        ADC     L39
        STA     L2A
        LDA     L2B
        ADC     L3A
        STA     L2B
        JSR     L95CB

        SEC
        LDA     (L37)
        SBC     L2D
        CMP     #$03
        BCS     L9AE6

        JSR     LBC66

        JSR     L976C

        PLA
        STA     L38
        PLA
        STA     L37
        LDX     #$39
        JSR     LBD48

        LDY     L3C
        JSR     L9B97

        CLC
        LDA     L39
        ADC     L2A
        STA     L2A
        LDA     L3A
        ADC     L2B
        STA     L2B
        BCC     L9B5A

.L9B4C
        JSR     L976C

        PLA
        STA     L38
        PLA
        STA     L37
        LDY     #$01
        JSR     L9B97

.L9B5A
        PLA
        STA     L2C
        CMP     #$05
        BNE     L9B78

        LDX     L2B
        LDA     L2A
        ASL     L2A
        ROL     L2B
        ASL     L2A
        ROL     L2B
        ADC     L2A
        STA     L2A
        TXA
        ADC     L2B
        STA     L2B
        BRA     L9B80

.L9B78
        ASL     L2A
        ROL     L2B
        ASL     L2A
        ROL     L2B
.L9B80
        TYA
        ADC     L2A
        STA     L2A
        BCC     L9B8A

        INC     L2B
        CLC
.L9B8A
        LDA     L37
        ADC     L2A
        STA     L2A
        LDA     L38
        ADC     L2B
        STA     L2B
        RTS

.L9B97
        LDA     L2B
        AND     #$C0
        ORA     L2C
        ORA     L2D
        BNE     L9BAE

        LDA     L2A
        CMP     (L37),Y
        INY
        LDA     L2B
        SBC     (L37),Y
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
        LDA     (L37),Y
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
        INC     L0A
.L9BE2
        LDY     L0A
        LDA     (L0B),Y
        CMP     #$20
        BEQ     L9BE0

        CMP     #$8D
        BNE     L9C08

.L9BEE
        INY
        LDA     (L0B),Y
        ASL     A
        ASL     A
        TAX
        AND     #$C0
        INY
        EOR     (L0B),Y
        STA     L2A
        TXA
        ASL     A
        ASL     A
        INY
        EOR     (L0B),Y
        STA     L2B
        INY
        STY     L0A
        SEC
        RTS

.L9C08
        CLC
        RTS

.L9C0A
        LDA     L0B
        STA     L19
        LDA     L0C
        STA     L1A
        LDA     L0A
        STA     L1B
.L9C16
        LDY     L1B
        INC     L1B
        LDA     (L19),Y
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
        LDY     L1B
        BRA     L9C74

.L9C5A
        LDY     L1B
        BRA     L9C6C

.L9C5E
        TSX
        CPX     #$FC
        BCS     L9C3B

        LDA     L01FF
        CMP     #$F2
        BNE     L9C3B

.L9C6A
        LDY     L0A
.L9C6C
        DEY
.L9C6D
        INY
        LDA     (L0B),Y
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
        ADC     L0B
        STA     L0B
        BCC     L9C8A

        INC     L0C
.L9C8A
        LDY     #$01
        STY     L0A
.L9C8E
        BIT     LFF
        BMI     L9C41

.L9C92
        RTS

.L9C93
        JSR     L9C6A

        LDA     (L0B)
        CMP     #$3A
        BEQ     L9C92

        LDA     L0C
        CMP     #$07
        BEQ     L9CC6

.L9CA2
        LDY     #$01
        LDA     (L0B),Y
        BMI     L9CC6

        LDX     L20
        BEQ     L9CB6

        STA     L2B
        INY
        LDA     (L0B),Y
        STA     L2A
        JSR     L9D0F

.L9CB6
        LDA     #$03
.L9CB8
        CLC
        ADC     L0B
        STA     L0B
        BCC     L9CC1

        INC     L0C
.L9CC1
        LDY     #$01
        STY     L0A
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
        LDY     L1B
        STY     L0A
        LDA     L2A
        ORA     L2B
        ORA     L2C
        ORA     L2D
        BEQ     L9CFB

        CPX     #$8C
        BEQ     L9CEB

.L9CE8
        JMP     L90D0

.L9CEB
        INC     L0A
.L9CED
        JSR     L9BE2

        BCC     L9CE8

        JSR     LB866

        JSR     L9C8A

        JMP     LB753

.L9CFB
        LDY     L0A
.L9CFD
        LDA     (L0B),Y
        CMP     #$0D
        BEQ     L9D0C

        INY
        CMP     #$8B
        BNE     L9CFD

        STY     L0A
        BEQ     L9CED

.L9D0C
        JMP     L907D

.L9D0F
        LDA     L2A
        CMP     L21
        LDA     L2B
        SBC     L22
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

        LDA     L2E
        EOR     L3B
        BPL     L9D57

        ASL     L2E
        BRA     L9D79

.L9D43
        STY     L2D
        PLA
        STA     L2C
        PLA
        STA     L2B
        PLA
        STA     L2A
        JSR     L828A

        LDA     L3B
        EOR     #$80
        STA     L3B
.L9D57
        LDA     L3C
        CMP     L30
        BNE     L9D75

        LDA     L3D
        CMP     L31
        BNE     L9D75

        LDA     L3E
        CMP     L32
        BNE     L9D75

        LDA     L3F
        CMP     L33
        BNE     L9D75

        LDA     L40
        SBC     L34
        BEQ     L9D7B

.L9D75
        ROR     A
        EOR     L3B
        ROL     A
.L9D79
        LDA     #$FF
.L9D7B
        RTS

.L9D7C
        JMP     L9155

.L9D7F
        INC     L1B
.L9D81
        TXA
.L9D82
        BEQ     L9DC4

        BMI     L9D29

        LDA     L2A
        PHA
        LDA     L2B
        PHA
        LDA     L2C
        PHA
        LDA     L2D
        PHA
        JSR     L9F07

        TAY
        BMI     L9DB4

        BEQ     L9D7C

        PLA
        TAY
        EOR     L2D
        BMI     L9DBA

        CPY     L2D
        BNE     L9DBE

        PLA
        CMP     L2C
        BNE     L9DBF

        PLA
        CMP     L2B
        BNE     L9DC0

        PLA
        SBC     L2A
        BNE     L9DC1

        RTS

.L9DB4
        PLA
        TAY
        EOR     L2E
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

        LDA     (L04)
        CMP     L36
        BCC     L9DD5

        LDA     L36
.L9DD5
        STA     L37
.L9DD7
        CPY     L37
        BEQ     L9DE5

        INY
        LDA     (L04),Y
        CMP     L05FF,Y
        BEQ     L9DD7

        BRA     L9DE9

.L9DE5
        LDA     (L04)
        CMP     L36
.L9DE9
        PHP
        JSR     LBD21

        PLP
        BNE     L9DC1

        LDA     #$00
        RTS

.L9DF3
        LDA     L0B
        STA     L19
        LDA     L0C
        STA     L1A
        LDA     L0A
        STA     L1B
.L9DFF
        JSR     L9E45

.L9E02
        CPX     #$84
        BEQ     L9E10

        CPX     #$82
        BEQ     L9E2A

        DEC     L1B
        TAY
        STA     L27
        RTS

.L9E10
        JSR     L9E3F

        JSR     L9783

        LDY     #$03
.L9E18
        LDA     (L04),Y
        ORA     L2A,Y
        STA     L2A,Y
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
        LDA     (L04),Y
        EOR     L2A,Y
        STA     L2A,Y
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
        LDA     (L04),Y
        AND     L2A,Y
        STA     L2A,Y
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
        STA     L2A
        STA     L2B
        STA     L2C
        STA     L2D
        LDA     #$40
        RTS

.L9E90
        TAX
        LDY     L1B
        LDA     (L19),Y
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
        LDY     L1B
        LDA     (L19),Y
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
        LDA     (L04)
        ADC     L36
        BCS     L9ECB

        TAX
        PHA
        LDY     L36
.L9EF2
        LDA     L05FF,Y
        STA     L05FF,X
        DEX
        DEY
        BNE     L9EF2

        JSR     LBD12

        PLA
        STA     L36
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
        LDA     (L04)
        ADC     L2A
        STA     L2A
        LDY     #$01
        LDA     (L04),Y
        ADC     L2B
        STA     L2B
        INY
        LDA     (L04),Y
        ADC     L2C
        STA     L2C
        INY
        LDA     (L04),Y
        ADC     L2D
.L9F3B
        STA     L2D
        CLC
        LDA     L04
        ADC     #$04
        STA     L04
        LDA     #$40
        BCC     L9F0A

        INC     L05
        BRA     L9F0A

.L9F4C
        JMP     L9155

.L9F4F
        JSR     LBC18

        JSR     LA70A

.L9F55
        LDX     L27
        BRA     L9F0A

.L9F59
        JSR     LBC18

        JSR     LA704

        BRA     L9F55

.L9F61
        JSR     LAD10

.L9F64
        STX     L27
        JSR     L8287

        LDA     L3D
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
        LDA     (L04)
        SBC     L2A
        STA     L2A
        LDY     #$01
        LDA     (L04),Y
        SBC     L2B
        STA     L2B
        INY
        LDA     (L04),Y
        SBC     L2C
        STA     L2C
        INY
        LDA     (L04),Y
        SBC     L2D
        BRA     L9F3B

.L9F9A
        JSR     L828D

.L9F9D
        JSR     L8287

        AND     L3D
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

        LDA     L2B
        ASL     A
        LDA     L2C
        ADC     #$00
        BNE     L9FA7

        ADC     L2D
        BNE     L9FA7

        JSR     LA069

        TAY
        BMI     L9F9D

        BEQ     L9FBB

        LDA     L2B
        STA     L38
        ASL     A
        LDA     L2C
        ADC     #$00
        BNE     L9F9A

        ADC     L2D
        BNE     L9F9A

        BCC     L9FE6

        JSR     LAD20

.L9FE6
        STX     L27
        LDX     #$3D
        JSR     LBE06

        JSR     LBD26

        LDY     #$00
        LDX     #$00
.L9FF4
        LSR     L3E
        ROR     L3D
        BCC     LA00F

        CLC
        TYA
        ADC     L2A
        TAY
        TXA
        ADC     L2B
        TAX
        LDA     L3F
        ADC     L2C
        STA     L3F
        LDA     L40
        ADC     L2D
        STA     L40
.LA00F
        ASL     L2A
        ROL     L2B
        ROL     L2C
        ROL     L2D
        LDA     L3D
        ORA     L3E
        BNE     L9FF4

        STY     L3D
        STX     L3E
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
        LDA     L38
        PHP
        LDX     #$3D
.LA052
        JSR     LAAD8

        PLP
        BPL     LA05B

        JSR     LAD20

.LA05B
        LDX     L27
        BRA     LA029

.LA05F
        JSR     L81BD

        BIT     L37
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
        LDY     L1B
        INC     L1B
        LDA     (L19),Y
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

        LDA     L2A
        ASL     A
        LDA     #$00
        ADC     L2B
        BNE     LA09C

        ADC     L2C
        BNE     LA09C

        ADC     L2D
        BEQ     LA0C7

.LA09C
        JSR     L828D

.LA09F
        LDA     L30
        BEQ     LA0C5

        CMP     #$87
        BCS     LA0D1

        CMP     #$81
        BCC     LA0D1

        ORA     #$78
        TAY
        LDA     L32
        ORA     L33
        ORA     L34
        BNE     LA0D1

        LDA     L31
.LA0B8
        LSR     A
        BCS     LA0D1

        INY
        BMI     LA0B8

        LDY     L2E
        BPL     LA0C5

        EOR     #$FF
        INC     A
.LA0C5
        STA     L2A
.LA0C7
        JSR     LA56D

        LDA     L2A
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
        STA     L14
        LDX     #$04
.LA0F2
        STZ     L3F,X
        SEC
.LA0F5
        LDA     L2A
        SBC     L80E2,X
        TAY
        LDA     L2B
        SBC     L80DD,X
        BCC     LA10A

        STA     L2B
        STY     L2A
        INC     L3F,X
        BRA     LA0F5

.LA10A
        DEX
        BPL     LA0F2

        LDX     #$05
.LA10F
        DEX
        BEQ     LA116

        LDA     L3F,X
        BEQ     LA10F

.LA116
        STX     L37
        LDA     L14
        BEQ     LA126

        SBC     L37
        BEQ     LA126

        TAX
        JSR     LBDFF

        LDX     L37
.LA126
        LDA     L3F,X
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
        LDA     L2A,Y
        PHA
        AND     #$0F
        STA     L3F,X
        PLA
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        INX
        STA     L3F,X
        INX
        INY
        CPY     #$04
        BNE     LA13B

.LA151
        DEX
        BEQ     LA158

        LDA     L3F,X
        BEQ     LA151

.LA158
        LDA     L3F,X
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
        LDA     L2E
        BPL     LA174

        LDA     #$2D
        STZ     L2E
        JSR     LA2CC

.LA174
        LDA     L30
        CMP     #$81
        BCS     LA1C1

        JSR     LA46B

        DEC     L48
        BRA     LA174

.LA181
        LDX     L0402
        CPX     #$03
        BCC     LA18A

        LDX     #$00
.LA18A
        STX     L37
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
        STA     L38
        STA     L4D
        STZ     L36
        STZ     L48
        BIT     L15
        BMI     LA131

        TYA
        BMI     LA1AF

        JSR     L828D

.LA1AF
        LDA     L31
        BNE     LA169

        LDA     L37
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

        LDA     L31
        CMP     #$A0
        BCC     LA1D4

.LA1CD
        JSR     LA4BA

.LA1D0
        INC     L48
        BRA     LA174

.LA1D4
        JSR     LA3ED

        LDA     L4D
        STA     L38
        LDX     L37
        CPX     #$02
        BNE     LA1EF

        ADC     L48
        BMI     LA220

        CMP     #$0B
        BCC     LA1ED

        LDA     #$0A
        STZ     L37
.LA1ED
        STA     L38
.LA1EF
        LDA     L38
        EOR     #$FF
        LSR     A
        PHP
        ASL     A
        ASL     A
        ADC     #$BC
        JSR     LA572

        DEC     L30
        PLP
        BCC     LA204

        JSR     LA46B

.LA204
        JSR     L8429

.LA207
        LDA     L30
        CMP     #$84
        BCS     LA212

        JSR     LA4A9

        BNE     LA207

.LA212
        LDA     L31
        CMP     #$A0
        BCS     LA1BC

        LDA     L38
        BNE     LA22A

.LA21C
        CMP     #$01
        BEQ     LA261

.LA220
        JSR     LA72B

        STZ     L48
        LDA     L4D
        INC     A
        STA     L38
.LA22A
        LDA     #$01
        CMP     L37
        BEQ     LA261

        LDY     L48
        BMI     LA23E

        CPY     L38
        BCS     LA261

        STZ     L48
        INY
        TYA
        BNE     LA261

.LA23E
        LDA     L37
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
        INC     L48
        BEQ     LA25F

        JSR     LA2CC

        BRA     LA256

.LA25F
        LDA     #$80
.LA261
        STA     L4D
.LA263
        JSR     LA40A

        DEC     L4D
        BNE     LA26F

        LDA     #$2E
        JSR     LA2CC

.LA26F
        DEC     L38
        BNE     LA263

        LDY     L37
        DEY
        BEQ     LA290

        DEY
        BEQ     LA28C

        LDY     L36
.LA27D
        DEY
        LDA     L0600,Y
        CMP     #$30
        BEQ     LA27D

        CMP     #$2E
        BEQ     LA28A

        INY
.LA28A
        STY     L36
.LA28C
        LDA     L48
        BEQ     LA2B7

.LA290
        LDA     #$45
        JSR     LA2CC

        LDA     L48
        BPL     LA2A3

        LDA     #$2D
        JSR     LA2CC

        SEC
        LDA     #$00
        SBC     L48
.LA2A3
        JSR     LA2B8

        LDA     L37
        BEQ     LA2B7

        LDA     #$20
        LDY     L48
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
        LDX     L36
        STA     L0600,X
        PLX
        INC     L36
        RTS

.LA2D6
        CLC
        LDA     #$FF
        JMP     L82DD

        RTS

.LA2DD
        STZ     L31
        STZ     L32
        STZ     L33
        STZ     L34
        STZ     L35
        STZ     L47
        STZ     L48
        LDX     #$FF
        STX     L49
        CMP     #$2E
        BEQ     LA348

        CMP     #$3A
        BCS     LA2D6

        SBC     #$2F
        BMI     LA2D6

.LA2FB
        STA     L35
.LA2FD
        LDA     L47
        BEQ     LA303

        DEC     L48
.LA303
        INY
        LDA     (L19),Y
        CMP     #$3A
        BCS     LA34C

        SBC     #$2F
        BCC     LA342

        STA     L42
        LDX     L49
        BPL     LA325

        LDA     L35
        ASL     A
        ASL     A
        ADC     L35
        ASL     A
        ADC     L42
        CMP     #$19
        BCC     LA2FB

        STZ     L49
        BRA     LA2FB

.LA325
        CPX     #$02
        BCS     LA33E

        JSR     LA419

        CMP     #$19
        BCC     LA333

        INC     L49
        CLC
.LA333
        LDA     L42
        ADC     L35
        BCC     LA2FB

        JSR     LA503

        BRA     LA2FB

.LA33E
        INC     L48
        BRA     LA2FD

.LA342
        EOR     #$FE
        ORA     L47
        BNE     LA357

.LA348
        INC     L47
        BRA     LA303

.LA34C
        CMP     #$45
        BNE     LA357

        JSR     LA3B5

        ADC     L48
        STA     L48
.LA357
        STY     L1B
        LDY     L31
        BNE     LA385

        LDA     L32
        BMI     LA385

        STA     L2D
        BEQ     LA36B

        LDA     L48
        ORA     L47
        BNE     LA385

.LA36B
        LDA     L35
        STA     L2A
        LDA     L34
        STA     L2B
        LDA     L33
        STA     L2C
        LDA     L48
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
        STA     L30
        STZ     L2E
        STZ     L2F
        TYA
        STA     L31
        JSR     L8304

.LA393
        LDY     L48
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
        LDA     (L19),Y
        CMP     #$2D
        BEQ     LA3AE

        CMP     #$2B
        BNE     LA3C3

.LA3C0
        INY
        LDA     (L19),Y
.LA3C3
        CMP     #$3A
        BCS     LA3E9

        SBC     #$2F
        BCC     LA3E9

        STA     L49
        INY
        LDA     (L19),Y
        CMP     #$3A
        BCS     LA3E5

        SBC     #$2F
        BCC     LA3E5

        INY
        STA     L42
        LDA     L49
        ASL     A
        ASL     A
        ADC     L49
        ASL     A
        ADC     L42
        RTS

.LA3E5
        LDA     L49
        CLC
        RTS

.LA3E9
        LDA     #$00
        CLC
        RTS

.LA3ED
        LDA     L2E
        STA     L3B
        LDA     L30
        STA     L3C
        LDA     L31
        STA     L3D
        LDA     L32
        STA     L3E
        LDA     L33
        STA     L3F
        LDA     L34
        STA     L40
        LDA     L35
        STA     L41
        RTS

.LA40A
        LDA     L31
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     LA2CA

        LDA     #$F0
        TRB     L31
        LDX     #$01
.LA419
        ASL     L35
        ROL     L34
        ROL     L33
        TXA
        BEQ     LA42C

        ROL     L32
        ROL     L31
.LA426
        LDA     L31
        PHA
        LDA     L32
        PHA
.LA42C
        LDA     L33
        PHA
        LDA     L34
        PHA
        LDA     L35
        CPX     #$00
        BMI     LA47A

        BNE     LA446

        ASL     A
        ROL     L34
        ROL     L33
        ASL     A
        ROL     L34
        ROL     L33
        BRA     LA452

.LA446
        ASL     A
        ROL     L34
        ROL     L33
        ROL     L32
        ROL     L31
        DEX
        BPL     LA446

.LA452
        ADC     L35
        STA     L35
        PLA
        ADC     L34
        STA     L34
        PLA
        ADC     L33
        STA     L33
        INX
        BNE     LA4B9

        PLA
        ADC     L32
        STA     L32
        PLA
        BRA     LA4A3

.LA46B
        CLC
        LDA     L30
        ADC     #$03
        LDX     #$FE
        STA     L30
        BCC     LA426

        INC     L2F
        BRA     LA426

.LA47A
        LSR     L31
        ROR     L32
        ROR     L33
        ROR     L34
        ROR     A
        INX
        BNE     LA47A

        DEX
        BRA     LA452

.LA489
        LDA     L35
        ADC     L41
        STA     L35
        LDA     L34
        ADC     L40
        STA     L34
        LDA     L33
        ADC     L3F
        STA     L33
        LDA     L32
        ADC     L3E
        STA     L32
        LDA     L3D
.LA4A3
        ADC     L31
        STA     L31
        BCC     LA4B9

.LA4A9
        ROR     L31
        ROR     L32
        ROR     L33
        ROR     L34
        ROR     L35
        INC     L30
        BNE     LA4B9

        INC     L2F
.LA4B9
        RTS

.LA4BA
        CLC
        LDA     #$FC
        TAX
        ADC     L30
        BCS     LA4C4

        DEC     L2F
.LA4C4
        STA     L30
        JSR     LA426

        DEX
        JSR     LA426

        INX
.LA4CE
        LDA     L34,X
        ROL     A
        LDA     L33,X
        ADC     L35
        STA     L35
        LDA     L32,X
        ADC     L34
        STA     L34
        LDA     L31,X
        ADC     L33
        STA     L33
        TXA
        BEQ     LA4E8

        LDA     L31
.LA4E8
        ADC     L32
        STA     L32
        BCC     LA4F5

        INC     L31
        BNE     LA4F5

        JSR     LA4A9

.LA4F5
        DEX
        BPL     LA4CE

        LDA     L32
        ROL     A
        LDA     L31
        ADC     L35
        STA     L35
        BCC     LA513

.LA503
        INC     L34
        BNE     LA513

.LA507
        INC     L33
        BNE     LA513

.LA50B
        INC     L32
        BNE     LA513

        INC     L31
        BEQ     LA4A9

.LA513
        RTS

.LA514
        STZ     L41
        LDY     #$04
        LDA     (L4A),Y
        STA     L40
        DEY
        LDA     (L4A),Y
        STA     L3F
        DEY
        LDA     (L4A),Y
        STA     L3E
        DEY
        LDA     (L4A),Y
        STA     L3B
        TAY
        LDA     (L4A)
        STA     L3C
        BNE     LA53B

        TYA
        ORA     L3E
        ORA     L3F
        ORA     L40
        BEQ     LA53E

.LA53B
        TYA
        ORA     #$80
.LA53E
        STA     L3D
        RTS

.LA541
        LDA     #$76
        BRA     LA547

.LA545
        LDA     #$6C
.LA547
        STA     L4A
        LDA     #$04
        STA     L4B
.LA54D
        LDA     L30
        STA     (L4A)
        LDY     #$01
        LDA     L2E
        EOR     L31
        AND     #$80
        EOR     L31
        STA     (L4A),Y
        LDA     L32
        INY
        STA     (L4A),Y
        LDA     L33
        INY
        STA     (L4A),Y
        LDA     L34
        INY
        STA     (L4A),Y
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
        STA     L4A
        STY     L4B
.LA57E
        STZ     L35
        STZ     L2F
        LDY     #$04
        LDA     (L4A),Y
        STA     L34
        DEY
        LDA     (L4A),Y
        STA     L33
        DEY
        LDA     (L4A),Y
        STA     L32
        DEY
        LDA     (L4A),Y
        STA     L2E
        TAY
        LDA     (L4A)
        STA     L30
        BNE     LA5A7

        TYA
        ORA     L32
        ORA     L33
        ORA     L34
        BEQ     LA5AA

.LA5A7
        TYA
        ORA     #$80
.LA5AA
        STA     L31
        RTS

.LA5AD
        CLC
        LDA     L4C
        ADC     #$05
.LA5B2
        STA     L4C
.LA5B4
        LDY     #$BF
.LA5B6
        STA     L4A
        STY     L4B
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

        INC     L30
.LA5CC
        JSR     LAD10

.LA5CF
        STZ     L3B
.LA5D1
        LDY     #$80
        STY     L3D
        INY
        STY     L3C
        STZ     L3E
        STZ     L3F
        STZ     L40
        STZ     L41
        JMP     LA70F

.LA5E3
        JSR     LA5CC

        LDX     L31
        BEQ     LA5BA

        DEC     L30
        JSR     LA545

        TXA
        EOR     L2E
.LA5F2
        STA     L2E
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
        STA     L31
        INC     A
        STA     L30
        JMP     LA72F

.LA62C
        JMP     L81EA

.LA62F
        LDA     #$B9
.LA631
        JSR     LA5B4

.LA634
        LDA     L31
        BEQ     LA62C

        JSR     LA514

        BNE     LA640

        JMP     LA72B

.LA640
        LDA     L3B
        EOR     L2E
        STA     L2E
        SEC
        LDA     L3C
        ADC     #$81
        ROL     L2F
        SBC     L30
        BCS     LA653

        DEC     L2F
.LA653
        STA     L30
        LDA     L3D
        CLC
        LDY     #$04
        STY     L3C
.LA65C
        LDX     #$08
.LA65E
        BCS     LA676

        CMP     L31
        BNE     LA674

        LDY     L3E
        CPY     L32
        BNE     LA674

        LDY     L3F
        CPY     L33
        BNE     LA674

        LDY     L40
        CPY     L34
.LA674
        BCC     LA68D

.LA676
        TAY
        LDA     L40
        SBC     L34
        STA     L40
        LDA     L3F
        SBC     L33
        STA     L3F
        LDA     L3E
        SBC     L32
        STA     L3E
        TYA
        SBC     L31
        SEC
.LA68D
        ROL     L3B
        ASL     L40
        ROL     L3F
        ROL     L3E
        ROL     A
        DEX
        BNE     LA65E

        LDX     L3B
        PHX
        DEC     L3C
        BNE     LA65C

        PLX
        ROR     A
.LA6A2
        LSR     L31
        STX     L34
        LDX     #$03
.LA6A8
        CMP     L31
        BCC     LA6AE

        SBC     L31
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
        STA     L35
        PLA
        STA     L33
        PLA
        STA     L32
        PLA
        STA     L31
.LA6C4
        BMI     LA712

        JSR     L8306

        BRA     LA712

.LA6CB
        JSR     LA545

.LA6CE
        JSR     LA3ED

        LDA     L30
        BEQ     LA72B

        STZ     L34
        ASL     L40
        BCC     LA6ED

        INC     L33
        BNE     LA6ED

        JSR     LA50B

        BRA     LA6ED

.LA6E4
        LDA     L31
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
        LDA     L31
        EOR     L2E
        STA     L2E
.LA70A
        JSR     LA514

.LA70D
        BEQ     LA73B

.LA70F
        JSR     L8429

.LA712
        LDA     L35
        BPL     LA725

        ASL     A
        BNE     LA71E

        ROL     A
        AND     L34
        BNE     LA725

.LA71E
        INC     L34
        BNE     LA725

        JSR     LA507

.LA725
        LDA     L2F
        BEQ     LA739

        BPL     LA6F2

.LA72B
        STZ     L30
        STZ     L31
.LA72F
        STZ     L2E
.LA731
        STZ     L2F
        STZ     L32
        STZ     L33
        STZ     L34
.LA739
        STZ     L35
.LA73B
        LDA     #$FF
.LA73D
        RTS

.LA73E
        CLC
        LDA     L30
        ADC     L3C
        ROL     L2F
        SBC     #$7F
        STA     L30
        BCS     LA74D

        DEC     L2F
.LA74D
        LDA     L2E
        EOR     L3B
        STA     L2E
        PHX
        LDX     #$F8
        LDY     #$04
.LA758
        LDA     L39,X
        STZ     L39,X
        STA     L41,Y
        INX
        DEY
        BNE     LA758

        STZ     L3C
        STZ     L3B
        STZ     L3A
        BRA     LA79B

.LA76B
        PHX
        LSR     L3D
        ROR     L3E
        ROR     L3F
        ROR     L40
        ROR     L41
.LA776
        ASL     L46,X
        BCC     LA797

        CLC
        TYA
        ADC     L42,X
        TAY
        LDA     L34
        ADC     L41,X
        STA     L34
        LDA     L33
        ADC     L40,X
        STA     L33
        LDA     L32
        ADC     L3F,X
        STA     L32
        LDA     L31
        ADC     L3E,X
        STA     L31
.LA797
        INX
        BMI     LA776

        PLX
.LA79B
        LDA     L46,X
        BNE     LA76B

        INX
        BMI     LA79B

        PLX
        STY     L35
        LDA     L31
        BMI     LA73D

        JMP     L8306

.LA7AC
        JSR     L979F

.LA7AF
        LDA     L31
        EOR     L2E
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
        LDX     L30
        BEQ     LA7DB

        LDA     L31
        CMP     #$B5
        BCS     LA7DB

        DEX
        INY
.LA7DB
        PHX
        STY     L30
        JSR     LA5E3

        LDA     L30
        BEQ     LA7EF

        CMP     #$6E
        BCC     LA7ED

        CLC
        JSR     LA8B9

.LA7ED
        INC     L30
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
        LDA     L31
        BEQ     LA805

        LDA     L2E
        BMI     LA7C0

        LDA     L30
        LSR     A
        PHP
        ADC     #$41
        STA     L30
        LDA     L31
        PLP
        BCC     LA829

        LSR     A
        ROR     L32
        ROR     L33
        ROR     L34
        ROR     L35
.LA829
        STZ     L3E
        STZ     L3F
        LDX     #$68
        SEC
        SBC     #$90
        BCS     LA838

        ADC     #$50
        LDX     #$48
.LA838
        STA     L31
        TXA
        LDX     #$FC
        LDY     #$0C
.LA83F
        STA     L41,X
.LA841
        ASL     L33
        ROL     L32
        ROL     L31
        LDA     L31
        CMP     L3D
        BNE     LA857

        LDA     L32
        CMP     L3E
        BNE     LA857

        LDA     L33
        CMP     L3F
.LA857
        BCC     LA875

        LDA     L33
        SBC     L3F
        STA     L33
        LDA     L32
        SBC     L3E
        STA     L32
        LDA     L31
        SBC     L3D
        STA     L31
        TYA
        CLC
        ADC     L41,X
        BCC     LA878

        INC     L40,X
        BRA     LA878

.LA875
        TYA
        EOR     L41,X
.LA878
        STA     L41,X
        TYA
        LSR     A
        TAY
        BNE     LA841

        LDY     L40,X
        PHY
        CPX     #$FD
        BNE     LA88A

        LDA     L34
        STA     L33
.LA88A
        BCS     LA899

        PLY
        LDY     #$04
.LA88F
        ASL     L35
        ROL     L34
        ROL     A
        DEY
        BNE     LA88F

        TSB     L33
.LA899
        LDA     #$80
        LDY     #$C0
        INX
        BNE     LA83F

        LDX     L3D
        LDA     L31
        STX     L31
        LDX     L40
        ASL     A
        CMP     L31
        BCC     LA8B0

        SBC     L31
        INX
.LA8B0
        JMP     LA6A2

.LA8B3
        LDX     #$CA
        DEC     L30
        BRA     LA8BB

.LA8B9
        LDX     #$E7
.LA8BB
        PHP
        JSR     LA6CB

        PLP
        ROR     L2E
        TXA
        JSR     LAA55

        DEC     A
        DEC     A
        STA     L47
        TXA
        INY
        CLC
.LA8CD
        ADC     #$0A
        DEY
        BPL     LA8CD

        ADC     #$F1
        STA     L4C
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

        INC     L47
        BMI     LA8E0

        JSR     LA5BB

        JSR     LA634

        JMP     LA70A

.LA901
        JSR     L979F

        LDA     L2E
        PHA
        JSR     LA6CB

        JSR     LA5CC

        LDA     L31
        BEQ     LA948

        JSR     LA80B

        JSR     LA634

        BRA     LA91F

.LA919
        JSR     L979F

        LDA     L2E
        PHA
.LA91F
        STZ     L2E
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
        LDA     L30
        CMP     #$6D
        BCC     LA93B

        JSR     LA8B9

.LA93B
        PLP
        BNE     LA946

        INC     L30
        JSR     LA6FF

        DEC     L30
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

        INC     L49
.LA959
        LSR     L49
        BCC     LA962

        JSR     LA5C4

        BRA     LA965

.LA962
        JSR     LA5F4

.LA965
        LSR     L49
        BCS     LA978

.LA969
        TAY
        RTS

.LA96B
        JSR     LA9D1

        JSR     LA5F2

        LSR     L49
        BCC     LA969

        JSR     LA62F

.LA978
        JMP     LAD10

.LA97B
        JSR     LA545

        LDA     L30
        LDX     #$00
.LA982
        DEY
        STX     L31,Y
        CMP     LA7C9,Y
        BCC     LA982

        LDA     L4C
        JSR     LA9C1

        LDA     L2E
        STA     L3B
        JSR     LA5D1

        DEC     L30
        JSR     L9788

        STA     L49
        JSR     L828D

        JSR     LA5AD

.LA9A3
        JSR     LA514

        LDY     #$05
        LDA     (L4A),Y
        STA     L41
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
        STY     L4B
        STA     L4A
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
        CMP     L30
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
        LDA     L2E
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

        LDA     L30
        INC     A
        AND     #$08
        BEQ     LAA2C

        DEC     L30
.LAA2C
        DEC     A
        PHA
        BEQ     LAA33

        JSR     LA97B

.LAA33
        LDA     L30
        CMP     #$6A
        BCS     LAA3E

        JSR     LA5CF

        BRA     LAA44

.LAA3E
        JSR     LA8B3

        JSR     LA5C1

.LAA44
        CLC
        LDA     L30
        ADC     L49
        STA     L30
        PLA
        DEC     A
        BPL     LA9EF

        RTS

.LAA50
        JSR     LA5B2

        STZ     L49
.LAA55
        PHX
        TAX
        LDY     #$01
.LAA59
        DEX
        LDA     LBF00,X
        CMP     L30
        BNE     LAA66

        LDA     LBEFE,X
        CMP     L31
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
        LDX     L2A
        LDY     L2B
        JMP     OSBYTE

.LAA7A
        JSR     L83D3

.LAA7D
        STZ     L2E
        STZ     L2F
        STZ     L35
        LDA     #$80
        STA     L30
        EOR     L0D
        STA     L34
        EOR     L0E
        STA     L33
        EOR     L0F
        STA     L32
        EOR     L10
        STA     L31
        JMP     LA6C4

.LAA9A
        INC     L1B
        JSR     L976C

        LDA     L2D
        BMI     LAAC1

        ORA     L2C
        ORA     L2B
        BNE     LAAB0

        LDA     L2A
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
        STA     L11
        RTS

.LAACB
        LDY     L1B
        LDA     (L19),Y
        CMP     #$28
        BEQ     LAA9A

        JSR     L83D3

        LDX     #$0D
.LAAD8
        LDA     L00,X
        STA     L2A
        LDA     L01,X
        STA     L2B
        LDA     L02,X
        STA     L2C
        LDA     L03,X
        STA     L2D
.LAAE8
        LDA     #$40
        RTS

.LAAEB
        JSR     L9779

        LDX     #$03
.LAAF0
        LDA     L2A,X
        EOR     #$FF
        STA     L2A,X
        DEX
        BPL     LAAF0

        BRA     LAAE8

.LAAFB
        JSR     LAB14

        STX     L2A
        RTS

.LAB01
        JSR     L9779

        JSR     L93C7

        STA     L2A
        STX     L2B
        STY     L2C
        PHP
        PLA
        STA     L2D
        CLD
        BRA     LAAE8

.LAB14
        LDA     #$86
        JSR     OSBYTE

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
        JSR     OSARGS

        BRA     LAAE8

.LAB2F
        JSR     LBA7A

        JSR     OSBGET

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
        JSR     OSFIND

        BRA     LAB1A

.LAB54
        STZ     L31
        JSR     LA6FF

        INC     L30
        RTS

.LAB5C
        JSR     LAD78

        BNE     LAB9D

        INC     L36
        LDY     L36
        LDA     #$0D
        STA     L05FF,Y
        JSR     LBC91

        LDA     L19
        PHA
        LDA     L1A
        PHA
        LDA     L1B
        PHA
        LDY     L04
        LDX     L05
        INY
        STY     L19
        STY     L37
        BNE     LAB82

        INX
.LAB82
        STX     L1A
        STX     L38
        JSR     L8EDC

        STZ     L1B
        JSR     L9DFF

        JSR     LBD21

.LAB91
        PLA
        STA     L1B
        PLA
        STA     L1A
        PLA
        STA     L19
        LDA     L27
        RTS

.LAB9D
        JMP     L9155

.LABA0
        JSR     LAD78

        BNE     LAB9D

.LABA5
        LDX     L36
        STZ     L0600,X
        LDA     L19
        PHA
        LDA     L1A
        PHA
        LDA     L1B
        PHA
        STZ     L1B
        STZ     L19
        LDA     #$06
        STA     L1A
        JSR     L8F92

        CMP     #$2D
        BEQ     LABD0

        CMP     #$2B
        BNE     LABC9

        JSR     L8F92

.LABC9
        DEC     L1B
        JSR     LA2DD

        BRA     LABDD

.LABD0
        JSR     L8F92

        DEC     L1B
        JSR     LA2DD

        BCC     LABDD

        JSR     LAD1C

.LABDD
        STA     L27
        BRA     LAB91

.LABE1
        JSR     LAD78

        BEQ     LAC1C

        BPL     LAC02

        LDA     L2E
        PHP
        STZ     L2E
        JSR     L8349

        PLP
        BPL     LABFD

        LDA     L3D
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

        LDA     L36
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
        JSR     OSBYTE

        TXA
        BEQ     LAC2D

.LAC2B
        LDX     #$FF
.LAC2D
        STX     L2A
        STX     L2B
        STX     L2C
        STX     L2D
.LAC35
        LDA     #$40
        RTS

.LAC38
        LDX     #$00
        BRA     LAC2D

.LAC3C
        LDA     L31
        BEQ     LAC38

        LDA     L2E
        BPL     LAC59

        BRA     LAC2B

.LAC46
        JSR     LAD78

        BMI     LAC3C

        BEQ     LAC1C

        LDA     L2D
        BMI     LAC2B

        ORA     L2C
        ORA     L2B
        ORA     L2A
        BEQ     LAC35

.LAC59
        LDA     #$01
.LAC5B
        BRA     LAC0F

.LAC5D
        JSR     L8FAE

        JSR     L976C

        LDA     L2A
        PHA
        LDX     L2B
        JSR     LBD26

        STX     L2D
        PLA
        STA     L2C
        LDY     #$00
        LDX     #$2A
        LDA     #$09
        JSR     OSWORD

        LDA     L2E
        BMI     LAC2B

        BRA     LAC5B

.LAC7F
        JSR     L9DFF

        BNE     LAC1C

        CPX     #$2C
        BNE     LACA0

        INC     L1B
        JSR     LBC91

        JSR     L9DFF

        BNE     LAC1C

        LDA     #$01
        STA     L2A
        INC     L1B
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
        LDX     L2A
        BNE     LACAF

        LDX     #$01
.LACAF
        STX     L2A
        TXA
        DEX
        STX     L2D
        CLC
        ADC     L04
        STA     L37
        LDA     #$00
        ADC     L05
        STA     L38
        LDA     (L04)
        SEC
        SBC     L2D
        BCC     LACE8

        SBC     L36
        BCC     LACE8

        ADC     #$00
        STA     L2B
        JSR     LBD21

.LACD2
        LDY     #$00
        LDX     L36
        BEQ     LACE3

.LACD8
        LDA     (L37),Y
        CMP     L0600,Y
        BNE     LACEF

        INY
        DEX
        BNE     LACD8

.LACE3
        LDA     L2A
.LACE5
        JMP     LAE60

.LACE8
        JSR     LBD21

.LACEB
        LDA     #$00
        BRA     LACE5

.LACEF
        INC     L2A
        DEC     L2B
        BEQ     LACEB

        INC     L37
        BNE     LACD2

        INC     L38
        BRA     LACD2

.LACFD
        JMP     L9155

.LAD00
        JSR     LAD78

        BMI     LAD0D

        BEQ     LACFD

.LAD07
        BIT     L2D
        BMI     LAD20

        BRA     LAD37

.LAD0D
        STZ     L2E
        RTS

.LAD10
        LDA     L31
        EOR     L2E
.LAD14
        STA     L2E
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
        SBC     L2A
        STA     L2A
        TYA
        SBC     L2B
        STA     L2B
        TYA
        SBC     L2C
        STA     L2C
        TYA
        SBC     L2D
        STA     L2D
.LAD37
        LDA     #$40
        RTS

.LAD3A
        JSR     L8F92

        CMP     #$22
        BEQ     LAD5B

        LDX     #$00
.LAD43
        LDA     (L19),Y
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
        STX     L36
        STY     L1B
        LDA     #$00
        RTS

.LAD5B
        LDX     #$00
.LAD5D
        INY
.LAD5E
        LDA     (L19),Y
        CMP     #$0D
        BEQ     LAD75

        STA     L0600,X
        INY
        INX
        CMP     #$22
        BNE     LAD5E

        LDA     (L19),Y
        CMP     #$22
        BEQ     LAD5D

        BNE     LAD53

.LAD75
        JMP     L9357

.LAD78
        LDY     L1B
        INC     L1B
        LDA     (L19),Y
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
        DEC     L1B
        JSR     L99D8

        BEQ     LADBC

        JMP     LB1DE

.LADB6
        JSR     LA2DD

        BCC     LADCE

        RTS

.LADBC
        LDA     L28
        AND     #$02
        BNE     LADCE

        BCS     LADCE

        STX     L1B
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

        INC     L1B
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
        LDA     (L19),Y
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

        STY     L1B
        DEX
        CPX     #$08
        BCS     LADE4

        TXA
        TAY
        LDX     #$00
.LAE1E
        PLA
        STA     L2A,X
        DEY
        BMI     LAE31

        INX
        PLA
        ASL     A
        ASL     A
        ASL     A
        ASL     A
        ORA     L29,X
        STA     L29,X
        DEY
        BPL     LAE1E

.LAE31
        LDA     #$40
        RTS

.LAE34
        JSR     L9779

        LDX     L2A
        LDA     #$80
        JSR     OSBYTE

        TXA
.LAE3F
        BRA     LAE62

.LAE41
        INY
        LDA     (L19),Y
        CMP     #$50
        BNE     LADCE

        INC     L1B
        LDA     L12
        LDY     L13
        BRA     LAE62

.LAE50
        LDY     L18
        LDA     #$00
        BRA     LAE62

.LAE56
        JMP     L9155

.LAE59
        JSR     LAD78

        BNE     LAE56

        LDA     L36
.LAE60
        LDY     #$00
.LAE62
        STA     L2A
        STY     L2B
        STZ     L2C
        STZ     L2D
        LDA     #$40
        RTS

.LAE6D
        LDA     L1E
        BRA     LAE60

.LAE71
        LDA     L00
        LDY     L01
        BRA     LAE62

.LAE77
        LDA     L06
        LDY     L07
        BRA     LAE62

.LAE7D
        LDY     L09
        LDA     L08
        BRA     LAE62

.LAE83
        LDA     (LFD)
        BRA     LAE60

.LAE87
        JSR     OSRDCH

        BRA     LAE60

.LAE8C
        INY
        LDA     (L19),Y
        CMP     #$24
        BEQ     LAE9F

        LDX     #$2A
        LDY     #$00
        LDA     #$01
        JSR     OSWORD

        LDA     #$40
        RTS

.LAE9F
        INC     L1B
        LDA     #$0E
        LDX     #$00
        LDY     #$06
        STZ     L0600
        JSR     OSWORD

        LDA     #$18
        BRA     LAED7

.LAEB1
        JSR     OSRDCH

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

        INC     L1B
        JSR     L9769

        JSR     LBD12

        PLP
        BCS     LAEDC

        LDA     L2A
        CMP     L36
        BCS     LAED9

.LAED7
        STA     L36
.LAED9
        LDA     #$00
.LAEDB
        RTS

.LAEDC
        LDA     L36
        SBC     L2A
        BCC     LAED9

        BEQ     LAEDB

        TAX
        LDA     L2A
        STA     L36
        BEQ     LAEDB

        LDY     #$00
.LAEED
        LDA     L0600,X
        STA     L0600,Y
        INX
        INY
        DEC     L2A
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

        INC     L1B
        JSR     L9774

        LDA     L2A
        PHA
        LDA     #$FF
        STA     L2A
        INC     L1B
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

        SBC     L36
        BCS     LAF03

        DEY
        TYA
.LAF3D
        STA     L2C
        TAX
        LDY     #$00
        LDA     L36
        SEC
        SBC     L2C
        CMP     L2A
        BCS     LAF4D

        STA     L2A
.LAF4D
        LDA     L2A
        BEQ     LAF03

.LAF51
        LDA     L0600,X
        STA     L0600,Y
        INY
        INX
        CPY     L2A
        BNE     LAF51

        STY     L36
        BRA     LAFB8

.LAF61
        JSR     L8F92

        LDY     #$FF
        CMP     #$7E
        BEQ     LAF6D

        INY
        DEC     L1B
.LAF6D
        PHY
        JSR     LAD78

        BEQ     LAF88

        TAY
        PLA
        STA     L15
        LDA     L0403
        BNE     LAF83

        STA     L37
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

        LDY     L36
        BEQ     LAFB8

        LDA     L2A
        BEQ     LAFBB

        DEC     L2A
        BEQ     LAFB8

.LAFA2
        LDX     #$00
.LAFA4
        LDA     L0600,X
        STA     L0600,Y
        INX
        INY
        BEQ     LAFBE

        CPX     L36
        BCC     LAFA4

        DEC     L2A
        BNE     LAFA2

        STY     L36
.LAFB8
        LDA     #$00
        RTS

.LAFBB
        STA     L36
        RTS

.LAFBE
        JMP     L9ECB

.LAFC1
        PLA
        STA     L0C
        PLA
        STA     L0B
        BRK
        EQUB    $1D

        EQUS    "No such ",$A4,"/",$F2

        EQUB    $00

.LAFD5
        LDA     L18
        STA     L0C
        STZ     L0B
.LAFDB
        LDY     #$01
        LDA     (L0B),Y
        BMI     LAFC1

        LDY     #$03
.LAFE3
        INY
        LDA     (L0B),Y
        CMP     #$20
        BEQ     LAFE3

        CMP     #$DD
        BEQ     LAFFD

.LAFEE
        LDY     #$03
        LDA     (L0B),Y
        CLC
        ADC     L0B
        STA     L0B
        BCC     LAFDB

        INC     L0C
        BRA     LAFDB

.LAFFD
        INY
        STY     L0A
        JSR     L8F9D

        TYA
        TAX
        CLC
        ADC     L0B
        LDY     L0C
        BCC     LB00E

        INY
        CLC
.LB00E
        SBC     #$00
        STA     L3C
        TYA
        SBC     #$00
        STA     L3D
        LDY     #$01
.LB019
        INX
        LDA     (L3C),Y
        CMP     (L37),Y
        BNE     LAFEE

        INY
        CPY     L39
        BNE     LB019

        LDA     (L3C),Y
        JSR     L8E41

        BCS     LAFEE

        TXA
        TAY
        JSR     L9C80

        JSR     L9914

        LDX     #$01
        JSR     L9952

        LDA     L0B
        STA     (L02)
        LDY     #$01
        LDA     L0C
        STA     (L02),Y
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
        STA     L27
        TSX
        TXA
        CLC
        ADC     L04
        JSR     LBD5E

        TXA
        STA     (L04)
        LDY     #$00
.LB066
        INX
        INY
        LDA     L0100,X
        STA     (L04),Y
        CPX     #$FF
        BNE     LB066

        TXS
        LDA     L27
        PHA
        LDA     L0A
        PHA
        LDA     L0B
        PHA
        LDA     L0C
        PHA
        LDA     L1B
        TAX
        CLC
        ADC     L19
        LDY     L1A
        BCC     LB08A

        INY
        CLC
.LB08A
        SBC     #$01
        STA     L37
        TYA
        SBC     #$00
        STA     L38
        LDY     #$02
        JSR     L9BBC

        CPY     #$02
        BEQ     LB04A

        STX     L1B
        JSR     L8139

        BNE     LB0A6

        JMP     LAFD5

.LB0A6
        LDA     (L2A)
        STA     L0B
        LDY     #$01
        LDA     (L2A),Y
        STA     L0C
.LB0B0
        LDA     #$00
        PHA
        STZ     L0A
        JSR     L8F9D

        CMP     #$28
        BEQ     LB109

        DEC     L0A
.LB0BE
        LDA     L1B
        PHA
        LDA     L19
        PHA
        LDA     L1A
        PHA
        JSR     L90D0

        PLA
        STA     L1A
        PLA
        STA     L19
        PLA
        STA     L1B
        PLA
        BEQ     LB0E2

        STA     L3F
.LB0D8
        JSR     LBD46

        JSR     LBCAA

        DEC     L3F
        BNE     LB0D8

.LB0E2
        PLA
        STA     L0C
        PLA
        STA     L0B
        PLA
        STA     L0A
        PLA
        LDA     (L04)
        TAX
        TXS
        LDY     #$00
.LB0F2
        INY
        INX
        LDA     (L04),Y
        STA     L0100,X
        CPX     #$FF
        BNE     LB0F2

        TYA
        ADC     L04
        STA     L04
        BCC     LB106

        INC     L05
.LB106
        LDA     L27
        RTS

.LB109
        LDA     L1B
        PHA
        LDA     L19
        PHA
        LDA     L1A
        PHA
        JSR     L997D

        BEQ     LB169

        LDA     L1B
        STA     L0A
        PLA
        STA     L1A
        PLA
        STA     L19
        PLA
        STA     L1B
        PLX
        LDA     L2C
        PHA
        LDA     L2B
        PHA
        LDA     L2A
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

        LDA     L27
        STA     L2D
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
        STA     L4C
        STA     L4D
        CPX     L4C
        BEQ     LB17E

.LB169
        LDX     #$FB
        TXS
        PLA
        STA     L0C
        PLA
        STA     L0B
        BRK
        EQUB    $1F

        EQUS    "Arguments"

        EQUB    $00

.LB17E
        JSR     LBD26

        PLA
        STA     L2A
        PLA
        STA     L2B
        PLA
        STA     L2C
        BMI     LB1AB

        LDA     L2D
        BEQ     LB169

        STA     L27
        LDX     #$37
        JSR     LBE06

        LDA     L27
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
        LDA     L2D
        BNE     LB169

        JSR     LBD12

        JSR     L9171

.LB1B5
        DEC     L4C
        BNE     LB17E

        LDA     L4D
        PHA
        JMP     LB0BE

.LB1BF
        LDY     L2C
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
        LDY     L2C
        BMI     LB235

        BEQ     LB200

        CPY     #$05
        BEQ     LB205

        LDY     #$03
        LDA     (L2A),Y
        STA     L2D
        DEY
        LDA     (L2A),Y
        STA     L2C
        DEY
        LDA     (L2A),Y
        TAX
        LDA     (L2A)
        STA     L2A
        STX     L2B
        LDA     #$40
        RTS

.LB200
        LDA     (L2A),Y
        JMP     LAE62

.LB205
        STZ     L35
        STZ     L2F
        DEY
        LDA     (L2A),Y
        STA     L34
        DEY
        LDA     (L2A),Y
        STA     L33
        DEY
        LDA     (L2A),Y
        STA     L32
        DEY
        LDA     (L2A),Y
        STA     L2E
        TAY
        LDA     (L2A)
        STA     L30
        BNE     LB22D

        TYA
        ORA     L32
        ORA     L33
        ORA     L34
        BEQ     LB230

.LB22D
        TYA
        ORA     #$80
.LB230
        STA     L31
        LDA     #$FF
        RTS

.LB235
        CPY     #$80
        BEQ     LB257

        LDY     #$03
        LDA     (L2A),Y
        STA     L36
        BEQ     LB256

        LDY     #$01
        LDA     (L2A),Y
        STA     L38
        LDA     (L2A)
        STA     L37
        LDY     L36
.LB24D
        DEY
        LDA     (L37),Y
        STA     L0600,Y
        TYA
        BNE     LB24D

.LB256
        RTS

.LB257
        LDY     #$00
.LB259
        LDA     (L2A),Y
        STA     L0600,Y
        EOR     #$0D
        BEQ     LB266

        INY
        BNE     LB259

        TYA
.LB266
        STY     L36
        RTS

.LB269
        JSR     L9779

        LDA     L2A
        JMP     LAEB4

.LB271
        LDY     L0A
        BEQ     LB276

        DEY
.LB276
        JSR     L9C80

        STZ     L08
        STZ     L09
        LDX     L18
        STX     L38
        STZ     L37
        LDY     L0C
        CPY     #$07
        BEQ     LB2B1

        LDX     L0B
.LB28B
        JSR     L8E5D

        CMP     #$0D
        BNE     LB2AA

        CPX     L37
        TYA
        SBC     L38
        BCC     LB2B1

        JSR     L8E5D

        ORA     #$00
        BMI     LB2B1

        STA     L09
        JSR     L8E5D

        STA     L08
        JSR     L8E5D

.LB2AA
        CPX     L37
        TYA
        SBC     L38
        BCS     LB28B

.LB2B1
        RTS

        LDX     #$FF
        STX     L28
        TXS
        INX
        LDY     #$00
        LDA     #$DA
        JSR     OSBYTE

        LDA     #$7E
        JSR     OSBYTE

        JSR     LB271

        STZ     L20
        LDA     (LFD)
        BNE     LB2D0

        JSR     LB2E0

.LB2D0
        LDA     L16
        STA     L0B
        LDA     L17
        STA     L0C
        STZ     L0A
        JSR     LBBFF

        JMP     L90D0

.LB2E0
        LDA     #$E9
        STA     L16
        LDA     #$B2
        STA     L17
        RTS

        EQUB    $F6,$3A,$E7,$9E,$F1,$22

        EQUS    " at line "

        EQUB    $22,$3B,$9E,$3A,$E0,$8B,$F1,$3A
        EQUB    $E0,$0D

.LB302
        JSR     L9332

        LDX     #$03
.LB307
        LDA     L2A
        PHA
        LDA     L2B
        PHA
        PHX
        JSR     L9771

        PLX
        DEX
        BNE     LB307

        JSR     L9C5A

        LDA     L2A
        STA     L3D
        LDA     L2B
        STA     L3E
        LDY     #$07
        LDX     #$05
        BRA     LB341

.LB326
        JSR     L9332

        LDX     #$0D
.LB32B
        LDA     L2A
        PHA
        PHX
        JSR     L9771

        PLX
        DEX
        BNE     LB32B

        JSR     L9C5A

        LDA     L2A
        STA     L44
        LDX     #$0C
        LDY     #$08
.LB341
        PLA
        STA     L37,X
        DEX
        BPL     LB341

        TYA
        LDX     #$37
        LDY     #$00
.LB34C
        JSR     OSWORD

        BRA     LB35C

.LB351
        JSR     L9332

        JSR     L9C5A

        LDY     L2A
        DEY
        STY     L23
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
        STA     L39
        PLA
        STA     L38
        PLA
        STA     L37
        PHX
        PHY
.LB372
        LDA     L39
        LSR     A
        LDA     L27
        BEQ     LB35F

        BCS     LB399

        BPL     LB380

        JSR     L9788

.LB380
        LDA     L2A
        STA     (L37)
        LDA     L39
        BEQ     LB398

        LDA     L2B
        LDY     #$01
        STA     (L37),Y
        LDA     L2C
        INY
        STA     (L37),Y
        LDA     L2D
        INY
        STA     (L37),Y
.LB398
        RTS

.LB399
        BMI     LB39E

        JSR     L828D

.LB39E
        LDA     L30
        STA     (L37)
        LDY     #$01
        LDA     L2E
        EOR     L31
        AND     #$80
        EOR     L31
        STA     (L37),Y
        INY
        LDA     L32
        STA     (L37),Y
        INY
        LDA     L33
        STA     (L37),Y
        INY
        LDA     L34
        STA     (L37),Y
        RTS

.LB3BE
        EQUS    "EDIT 12,2",$0D

.LB3C8
        JSR     LBBDC

        LDA     #$80
        STA     L1F
.LB3CF
        STZ     L3B
        STZ     L3C
        JSR     LAC38

        JSR     L9BE2

        PHP
        JSR     LBC66

        JSR     LAC2B

        LSR     L2B
        PLP
        BCC     LB3F4

        JSR     L8DA2

        BEQ     LB3FB

        JSR     LBD26

        JSR     LBC66

        DEC     L0A
        BRA     LB3FE

.LB3F4
        JSR     L8DA2

        BEQ     LB3FB

        DEC     L0A
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
        LDA     (L0B),Y
        CMP     #$4F
        BNE     LB3CF

        INC     L0A
        JSR     L9332

        JSR     L9C6A

        LDA     L2A
        STA     L1F
.LB425
        JMP     L904B

.LB428
        JSR     L9C74

.LB42B
        LDA     L0B
        STA     L19
        JSR     LBE25

        JSR     LBD26

        JSR     L8191

        LDA     L3D
        STA     L0B
        LDA     L3E
        STA     L0C
        BCS     LB45D

        DEY
        BRA     LB454

.LB445
        JSR     LBDD4

        BIT     L1F
        BMI     LB451

        LDA     #$0A
        JSR     OSWRCH

.LB451
        JSR     L9C80

.LB454
        LDA     (L0B),Y
        STA     L2B
        INY
        LDA     (L0B),Y
        STA     L2A
.LB45D
        LDA     L2A
        CLC
        SBC     L31
        LDA     L2B
        SBC     L32
        BCC     LB46F

        BIT     L1F
        BPL     LB425

        JMP     LBF54

.LB46F
        STZ     L4C
        STZ     L4D
        LDY     #$04
        STY     L0A
        STY     L1B
        BIT     L3B
        BPL     LB47F

        STZ     L3B
.LB47F
        BIT     L3C
        BPL     LB485

        STZ     L3C
.LB485
        LDA     (L0B),Y
        CMP     #$0D
        BEQ     LB4C2

        CMP     #$F4
        BEQ     LB495

        CMP     #$22
        BNE     LB497

        EOR     L4C
.LB495
        STA     L4C
.LB497
        LDX     L4C
        BNE     LB4A7

        CMP     #$ED
        BNE     LB4A1

        DEC     L3B
.LB4A1
        CMP     #$FD
        BNE     LB4A7

        DEC     L3C
.LB4A7
        LDX     L19
.LB4A9
        LDA     L0700,X
        CMP     #$0D
        BEQ     LB4BA

        CMP     (L0B),Y
        BNE     LB4BC

        INY
        INX
        BRA     LB4A9

.LB4B8
        BRA     LB445

.LB4BA
        STA     L4D
.LB4BC
        INC     L1B
        LDY     L1B
        BRA     LB485

.LB4C2
        LDA     L4D
        BEQ     LB451

        JSR     LA0EC

        LDA     #$01
        INX
        SEC
        JSR     LBDF4

        LDX     L3B
        LDA     #$02
        JSR     LBDF3

        LDX     L3C
        LDA     #$04
        JSR     LBDF3

        STZ     L4C
.LB4E0
        LDY     L0A
.LB4E2
        LDA     (L0B),Y
        CMP     #$0D
        BEQ     LB4B8

        CMP     #$22
        BNE     LB4F8

        EOR     L4C
        STA     L4C
        LDA     #$22
.LB4F2
        JSR     LBDD4

        INY
        BRA     LB4E2

.LB4F8
        LDX     L4C
        BNE     LB4F2

        CMP     #$8D
        BNE     LB50A

        JSR     L9BEE

        STY     L0A
        JSR     LA0E8

        BRA     LB4E0

.LB50A
        CMP     #$E3
        BNE     LB510

        INC     L3B
.LB510
        CMP     #$F5
        BNE     LB516

        INC     L3C
.LB516
        CMP     #$F4
        BNE     LB51C

        STA     L4C
.LB51C
        JSR     LBD77

        INY
        BRA     LB4E2

.LB522
        JSR     L99C4

        BNE     LB530

        LDX     L26
        BEQ     LB563

        BCS     LB56A

.LB52D
        JMP     L9C2D

.LB530
        BCS     LB52D

        LDX     L26
        BEQ     LB563

.LB536
        LDA     L2A
        CMP     L0519,X
        BNE     LB54B

        LDA     L2B
        CMP     L051A,X
        BNE     LB54B

        LDA     L2C
        CMP     L051B,X
        BEQ     LB56A

.LB54B
        TXA
        SEC
        SBC     #$0F
        TAX
        STX     L26
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
        STA     L2A
        LDA     L051A,X
        STA     L2B
        LDY     L051B,X
        CPY     #$05
        BEQ     LB5F1

        LDA     (L2A)
        ADC     L051C,X
        STA     (L2A)
        STA     L37
        LDY     #$01
        LDA     (L2A),Y
        ADC     L051D,X
        STA     (L2A),Y
        STA     L38
        INY
        LDA     (L2A),Y
        ADC     L051E,X
        STA     (L2A),Y
        STA     L39
        INY
        LDA     (L2A),Y
        ADC     L051F,X
        STA     (L2A),Y
        TAY
        LDA     L37
        SEC
        SBC     L0521,X
        STA     L37
        LDA     L38
        SBC     L0522,X
        TSB     L37
        LDA     L39
        SBC     L0523,X
        TSB     L37
        TYA
        SBC     L0524,X
        ORA     L37
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
        STY     L0B
        STA     L0C
        JSR     L9C8A

        JMP     L90D0

.LB5DF
        TXA
        SEC
        SBC     #$0F
        STA     L26
        LDY     L1B
        STY     L0A
        JSR     L8DA2

        BNE     LB626

        JMP     LB522

.LB5F1
        JSR     LB205

        TXA
        CLC
        ADC     #$1C
        STA     L4A
        LDA     #$05
        STA     L4B
        JSR     LA70A

        LDA     L2A
        STA     L37
        LDA     L2B
        STA     L38
        JSR     LB39E

        LDX     L26
        TXA
        CLC
        ADC     #$21
        STA     L4A
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

        LDY     L26
        CPY     #$96
        BCS     LB635

        TYA
        ADC     #$0F
        STA     L26
        LDA     L37
        STA     L0528,Y
        LDA     L38
        STA     L0529,Y
        LDA     L39
        STA     L052A,Y
        LSR     A
        BCS     LB6D1

        JSR     L9774

        LDY     L26
        LDA     L2A
        STA     L0521,Y
        LDA     L2B
        STA     L0522,Y
        LDA     L2C
        STA     L0523,Y
        LDA     L2D
        STA     L0524,Y
        LDA     #$01
        JSR     LAE60

        JSR     L8F92

        CMP     #$88
        BNE     LB6A7

        JSR     L9774

        LDY     L1B
.LB6A7
        STY     L0A
        LDY     L26
        LDA     L2A
        STA     L051C,Y
        LDA     L2B
        STA     L051D,Y
        LDA     L2C
        STA     L051E,Y
        LDA     L2D
        STA     L051F,Y
.LB6BF
        JSR     L9C93

        LDY     L26
        LDA     L0B
        STA     L0526,Y
        LDA     L0C
        STA     L0527,Y
        JMP     L90D0

.LB6D1
        JSR     L9DFF

        JSR     L97A2

        LDA     L26
        CLC
        ADC     #$21
        STA     L4A
        LDA     #$05
        STA     L4B
        JSR     LA54D

        JSR     LA622

        JSR     L8F92

        CMP     #$88
        BNE     LB6F7

        JSR     L9DFF

        JSR     L97A2

        LDY     L1B
.LB6F7
        STY     L0A
        LDA     L26
        CLC
        ADC     #$1C
        STA     L4A
        LDA     #$05
        STA     L4B
        JSR     LA54D

        BRA     LB6BF

.LB709
        JSR     LB85A

.LB70C
        JSR     L9C6A

        LDY     L25
        CPY     #$1A
        BCS     LB723

        LDA     L0B
        STA     L05CC,Y
        LDA     L0C
        STA     L05E6,Y
        INC     L25
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

        LDX     L25
        BEQ     LB730

        DEC     L25
        LDY     L05CB,X
        LDA     L05E5,X
        STY     L0B
        STA     L0C
.LB74A
        JMP     L90CA

.LB74D
        JSR     LB85A

        JSR     L9C6A

.LB753
        LDA     L20
        BEQ     LB75A

        JSR     L9D0F

.LB75A
        LDY     #$04
        STY     L0A
        LDY     L3D
        LDA     L3E
.LB762
        STY     L0B
        STA     L0C
        JMP     L90D0

.LB769
        JSR     L9C6A

        JSR     LB2E0

        BRA     LB74A

.LB771
        JSR     L8F9D

        CMP     #$87
        BEQ     LB769

        LDY     L0A
        DEY
        JSR     L9C80

        STZ     L0A
        LDA     L0B
        STA     L16
        LDA     L0C
        STA     L17
        JMP     L9073

.LB78B
        JSR     L8F9D

        CMP     #$85
        BEQ     LB771

        DEC     L0A
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
        LDA     L2B
        ORA     L2C
        ORA     L2D
        BNE     LB805

        DEC     L2A
        BEQ     LB7E6

        BMI     LB805

.LB7B3
        LDA     (L0B),Y
        CMP     #$0D
        BEQ     LB805

        CMP     #$3A
        BEQ     LB805

        CMP     #$8B
        BEQ     LB805

        INY
        CMP     #$22
        BNE     LB7CA

        EOR     L2B
        STA     L2B
.LB7CA
        LDX     L2B
        BNE     LB7B3

        CMP     #$29
        BNE     LB7D4

        DEC     L2C
.LB7D4
        CMP     #$28
        BNE     LB7DA

        INC     L2C
.LB7DA
        CMP     #$2C
        BNE     LB7B3

        LDX     L2C
        BNE     LB7B3

        DEC     L2A
        BNE     LB7B3

.LB7E6
        PLA
        CMP     #$F2
        BEQ     LB833

        STY     L0A
        CMP     #$E4
        BEQ     LB7FA

        JSR     LB85A

        JSR     L9C8A

        JMP     LB753

.LB7FA
        JSR     LB85A

        LDY     L0A
        JSR     LB84D

        JMP     LB70C

.LB805
        PLA
.LB806
        LDA     (L0B),Y
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
        STY     L1B
        JSR     L8F92

        CMP     #$F2
        BNE     LB81A

        JSR     LB057

        LDY     L1B
        JSR     LB84D

        JMP     L90C7

.LB847
        STY     L0A
        JMP     L9CED

.LB84C
        INY
.LB84D
        LDA     (L0B),Y
        CMP     #$0D
        BEQ     LB857

        CMP     #$3A
        BNE     LB84C

.LB857
        STY     L0A
        RTS

.LB85A
        JSR     L9BE2

        BCS     LB866

        JSR     L9332

        LDA     #$80
        TRB     L2B
.LB866
        JSR     L8191

        BCC     LB824

        RTS

.LB86C
        JMP     L9155

.LB86F
        JMP     L9C2D

.LB872
        STY     L0A
.LB874
        JMP     L90C7

.LB877
        JSR     LBA6C

        STY     L4C
        JSR     L9338

.LB87F
        JSR     L8DA2

        BNE     LB872

        LDA     L4C
        PHA
        JSR     L997D

        BEQ     LB86F

        JSR     L9338

        PLA
        STA     L4C
        PHP
        JSR     LBC66

        LDY     L4C
        JSR     OSBGET

        STA     L27
        PLP
        BCC     LB8BA

        LDA     L27
        BNE     LB86C

        JSR     OSBGET

        STA     L36
        TAX
        BEQ     LB8B5

.LB8AC
        JSR     OSBGET

        STA     L05FF,X
        DEX
        BNE     LB8AC

.LB8B5
        JSR     L916E

        BRA     LB87F

.LB8BA
        LDA     L27
        BEQ     LB86C

        BMI     LB8CC

        LDX     #$03
.LB8C2
        JSR     OSBGET

        STA     L2A,X
        DEX
        BPL     LB8C2

        BRA     LB8DA

.LB8CC
        LDX     #$04
.LB8CE
        JSR     OSBGET

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

        DEC     L0A
        CLC
.LB8F2
        ROR     L4C
        LSR     L4C
        LDA     #$FF
        STA     L4D
.LB8FA
        JSR     L935C

        BCS     LB909

.LB8FF
        JSR     L935C

        BCC     LB8FF

        LDX     #$FF
        STX     L4D
        CLC
.LB909
        PHP
        ASL     L4C
        PLP
        ROR     L4C
        CMP     #$2C
        BEQ     LB8FA

        CMP     #$3B
        BEQ     LB8FA

        DEC     L0A
        LDA     L4C
        PHA
        LDA     L4D
        PHA
        JSR     L997D

        BEQ     LB8E2

        PLA
        STA     L4D
        PLA
        STA     L4C
        JSR     L9338

        PHP
        BIT     L4C
        BVS     LB938

        LDA     L4D
        CMP     #$FF
        BNE     LB94F

.LB938
        BIT     L4C
        BPL     LB941

        LDA     #$3F
        JSR     OSWRCH

.LB941
        JSR     LBAA0

        STY     L36
        ASL     L4C
        CLC
        ROR     L4C
        BIT     L4C
        BVS     LB968

.LB94F
        STA     L1B
        STZ     L19
        LDA     #$06
        STA     L1A
        JSR     LAD3A

.LB95A
        JSR     L8FA8

        BEQ     LB965

        CMP     #$0D
        BNE     LB95A

        LDY     #$FE
.LB965
        INY
        STY     L4D
.LB968
        PLP
        BCS     LB976

        JSR     LBC83

        JSR     LABA5

        JSR     LB365

.LB974
        BRA     LB8FA

.LB976
        STZ     L27
        JSR     L9171

        BRA     LB974

.LB97D
        STZ     L3D
        LDY     L18
        STY     L3E
        JSR     L8F9D

        DEC     L0A
        CMP     #$3A
        BEQ     LB997

        CMP     #$0D
        BEQ     LB997

        CMP     #$8B
        BEQ     LB997

        JSR     LB85A

.LB997
        JSR     L9C6A

        LDA     L3D
        STA     L1C
        LDA     L3E
        STA     L1D
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

        STA     L27
        JSR     L916E

.LB9CD
        CLC
        LDA     L1B
        ADC     L19
        STA     L1C
        LDA     L1A
        ADC     #$00
        STA     L1D
        BRA     LB9A5

.LB9DC
        JSR     L9338

        LDA     L1C
        STA     L19
        LDA     L1D
        STA     L1A
        STZ     L1B
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
        LDY     L1B
        LDA     (L19),Y
        BMI     LBA21

        INY
        INY
        LDA     (L19),Y
        TAX
.LBA0A
        INY
        LDA     (L19),Y
        CMP     #$20
        BEQ     LBA0A

        CMP     #$DC
        BEQ     LBA43

        TXA
        CLC
        ADC     L19
        STA     L19
        BCC     LB9FF

        INC     L1A
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
        STY     L1B
.LBA46
        RTS

.LBA47
        JSR     L9DF3

        JSR     L9C55

        JSR     L9781

        LDX     L24
        BEQ     LBA2B

        LDA     L2A
        ORA     L2B
        ORA     L2C
        ORA     L2D
        BEQ     LBA63

        DEC     L24
        JMP     L90CA

.LBA63
        LDY     L04FF,X
        LDA     L0513,X
        JMP     LB762

.LBA6C
        DEC     L0A
.LBA6E
        LDA     L0A
        STA     L1B
        LDA     L0B
        STA     L19
        LDA     L0C
        STA     L1A
.LBA7A
        JSR     L8F92

        CMP     #$23
        BNE     LBA31

        JSR     L9779

        LDY     L2A
        TYA
        RTS

.LBA88
        LDX     L24
        CPX     #$14
        BCS     LBA35

        JSR     L9C80

        LDA     L0B
        STA     L0500,X
        LDA     L0C
        STA     L0514,X
        INC     L24
        JMP     L90D0

.LBAA0
        LDA     #$06
        BRA     LBAA6

.LBAA4
        LDA     #$07
.LBAA6
        STZ     L37
        STA     L38
        LDA     #$EE
        STA     L39
        LDA     #$20
        STA     L3A
        LDY     #$FF
        STY     L3B
        INY
        LDX     #$37
        TYA
        JSR     OSWORD

        BCC     LBAC5

        JMP     L9C41

.LBAC2
        JSR     OSNEWL

.LBAC5
        STZ     L1E
        RTS

.LBAC8
        JSR     L8191

        BCC     LBB1A

        LDA     L3D
        STA     L37
        STA     L12
        LDA     L3E
        STA     L38
        STA     L13
        LDY     #$03
        LDA     (L37),Y
        CLC
        ADC     L37
        STA     L37
        BCC     LBAE6

        INC     L38
.LBAE6
        LDY     #$00
.LBAE8
        LDA     (L37),Y
        STA     (L12),Y
        CMP     #$0D
        BNE     LBB03

        INY
        BNE     LBAF7

        INC     L38
        INC     L13
.LBAF7
        LDA     (L37),Y
        STA     (L12),Y
        BMI     LBB0C

        JSR     LBB0F

        JSR     LBB0F

.LBB03
        INY
        BNE     LBAE8

        INC     L38
        INC     L13
        BRA     LBAE8

.LBB0C
        JMP     LBE45

.LBB0F
        INY
        BNE     LBB16

        INC     L13
        INC     L38
.LBB16
        LDA     (L37),Y
        STA     (L12),Y
.LBB1A
        RTS

.LBB1B
        LDX     #$FF
        STX     L28
        STX     L3C
        JSR     LBBFF

        LDA     L0B
        STA     L37
        LDA     L0C
        STA     L38
        STZ     L3B
        STZ     L0A
        JSR     L8E6F

        JSR     L9BE2

        BCC     LBB1A

.LBB38
        LDA     L1F
        BEQ     LBB45

.LBB3C
        LDA     L0700,Y
        INY
        CMP     #$20
        BEQ     LBB3C

        DEY
.LBB45
        STY     L3B
        JSR     LBAC8

        LDY     #$07
        STY     L3C
        LDY     #$00
        LDA     #$0D
        CMP     (L3B)
        BEQ     LBB1A

.LBB56
        INY
        CMP     (L3B),Y
        BNE     LBB56

        LDA     #$20
.LBB5D
        DEY
        BEQ     LBB64

        CMP     (L3B),Y
        BEQ     LBB5D

.LBB64
        INY
        LDA     #$0D
        STA     (L3B),Y
        INY
        INY
        INY
        INY
        STY     L3F
        LDA     L12
        STA     L39
        LDA     L13
        STA     L3A
        JSR     LBE44

        STA     L37
        LDA     L13
        STA     L38
        DEY
        LDA     L06
        CMP     L12
        LDA     L07
        SBC     L13
        BCS     LBB9B

        JSR     LBE25

        JSR     LBBDC

        BRK
        EQUB    $00

        EQUS    $86," space"

        EQUB    $00

.LBB9B
        LDA     (L39),Y
        STA     (L37),Y
        TYA
        BNE     LBBA6

        DEC     L3A
        DEC     L38
.LBBA6
        DEY
        TYA
        ADC     L39
        LDX     L3A
        BCC     LBBAF

        INX
.LBBAF
        CMP     L3D
        TXA
        SBC     L3E
        BCS     LBB9B

        LDY     #$01
        LDA     L2B
        STA     (L3D),Y
        INY
        LDA     L2A
        STA     (L3D),Y
        INY
        LDA     L3F
        STA     (L3D),Y
        SEC
        TYA
        ADC     L3D
        STA     L3D
        BCC     LBBD0

        INC     L3E
.LBBD0
        LDY     #$FF
.LBBD2
        INY
        LDA     (L3B),Y
        STA     (L3D),Y
        CMP     #$0D
        BNE     LBBD2

        RTS

.LBBDC
        LDA     L12
        STA     L00
        STA     L02
        LDA     L13
        STA     L01
        STA     L03
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
        LDA     L18
        STA     L1D
        LDA     L06
        STA     L04
        LDA     L07
        STA     L05
        LDA     #$80
        TRB     L1F
        STZ     L24
        STZ     L26
        STZ     L25
        STZ     L1C
        RTS

.LBC18
        JSR     LBC3A

        JSR     LA026

.LBC1E
        STX     L27
.LBC20
        TAY
        JSR     L97A2

.LBC24
        LDA     L04
        CLC
        STA     L4A
        ADC     #$05
        STA     L04
        LDA     L05
        STA     L4B
        ADC     #$00
        STA     L05
        RTS

.LBC36
        TAY
        JSR     L97A2

.LBC3A
        LDA     L04
        SEC
        SBC     #$05
        JSR     LBD5E

        LDA     L30
        STA     (L04)
        LDY     #$01
        LDA     L2E
        EOR     L31
        AND     #$80
        EOR     L31
        STA     (L04),Y
        INY
        LDA     L32
        STA     (L04),Y
        INY
        LDA     L33
        STA     (L04),Y
        INY
        LDA     L34
        STA     (L04),Y
        RTS

.LBC62
        BEQ     LBC91

        BMI     LBC3A

.LBC66
        LDA     L04
        SEC
        SBC     #$04
        JSR     LBD5E

        LDY     #$03
        LDA     L2D
        STA     (L04),Y
        DEY
        LDA     L2C
        STA     (L04),Y
        DEY
        LDA     L2B
        STA     (L04),Y
        LDA     L2A
        STA     (L04)
        RTS

.LBC83
        PLY
        PLX
        LDA     L2A
        PHA
        LDA     L2B
        PHA
        LDA     L2C
        PHA
        PHX
        PHY
        RTS

.LBC91
        CLC
        LDA     L04
        SBC     L36
        JSR     LBD5E

        LDY     L36
        BEQ     LBCA5

.LBC9D
        LDA     L05FF,Y
        STA     (L04),Y
        DEY
        BNE     LBC9D

.LBCA5
        LDA     L36
        STA     (L04)
        RTS

.LBCAA
        LDA     L39
        CMP     #$80
        BEQ     LBCD5

        BCC     LBCEA

        LDA     (L04)
        TAX
        BEQ     LBCCD

        LDA     (L37)
        SBC     #$01
        STA     L39
        LDY     #$01
        LDA     (L37),Y
        SBC     #$00
        STA     L3A
.LBCC5
        LDA     (L04),Y
        STA     (L39),Y
        INY
        DEX
        BNE     LBCC5

.LBCCD
        LDA     (L04)
        LDY     #$03
.LBCD1
        STA     (L37),Y
        BRA     LBD21

.LBCD5
        LDA     (L04)
        LDY     #$00
        TAX
        BEQ     LBCE6

.LBCDC
        INY
        LDA     (L04),Y
        DEY
        STA     (L37),Y
        INY
        DEX
        BNE     LBCDC

.LBCE6
        LDA     #$0D
        BNE     LBCD1

.LBCEA
        LDA     (L04)
        STA     (L37)
        LDY     #$04
        LDA     L39
        BEQ     LBD0E

        LDY     #$01
        LDA     (L04),Y
        STA     (L37),Y
        INY
        LDA     (L04),Y
        STA     (L37),Y
        INY
        LDA     (L04),Y
        STA     (L37),Y
        INY
        CPY     L39
        BCS     LBD0E

        LDA     (L04),Y
        STA     (L37),Y
        INY
.LBD0E
        TYA
        CLC
        BRA     LBD3D

.LBD12
        LDA     (L04)
        STA     L36
        BEQ     LBD23

        TAY
.LBD19
        LDA     (L04),Y
        STA     L05FF,Y
        DEY
        BNE     LBD19

.LBD21
        LDA     (L04)
.LBD23
        SEC
        BRA     LBD3D

.LBD26
        LDY     #$03
        LDA     (L04),Y
        STA     L2D
        DEY
        LDA     (L04),Y
        STA     L2C
        DEY
        LDA     (L04),Y
        STA     L2B
        LDA     (L04)
        STA     L2A
.LBD3A
        CLC
        LDA     #$04
.LBD3D
        ADC     L04
        STA     L04
        BCC     LBD45

        INC     L05
.LBD45
        RTS

.LBD46
        LDX     #$37
.LBD48
        LDY     #$03
        LDA     (L04),Y
        STA     L03,X
        DEY
        LDA     (L04),Y
        STA     L02,X
        DEY
        LDA     (L04),Y
        STA     L01,X
        LDA     (L04)
        STA     L00,X
        BRA     LBD3A

.LBD5E
        STA     L04
        BCS     LBD64

        DEC     L05
.LBD64
        LDY     L05
        CPY     L03
        BCC     LBD74

        BNE     LBD70

        CMP     L02
        BCC     LBD74

.LBD70
        RTS

.LBD71
        JSR     LBBDC

.LBD74
        JMP     L9164

.LBD77
        STA     L37
        CMP     #$80
        BCC     LBDD4

        LDA     #$13
        STA     L38
        LDA     #$85
        STA     L39
        PHY
.LBD86
        LDY     #$00
.LBD88
        INY
        LDA     (L38),Y
        BPL     LBD88

        CMP     L37
        BEQ     LBD9E

        INY
        TYA
        SEC
        ADC     L38
        STA     L38
        BCC     LBD86

        INC     L39
        BRA     LBD86

.LBD9E
        LDY     #$00
.LBDA0
        LDA     (L38),Y
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
        LDA     L23
        CMP     L1E
        BCS     LBDC9

        JSR     LBAC2

.LBDC9
        PLA
        INC     L1E
        JMP     (L020E)

.LBDCF
        JSR     LBDAC

.LBDD2
        LDA     #$20
.LBDD4
        BIT     L1F
        BMI     LBDE2

.LBDD8
        CMP     #$0D
        BNE     LBDBF

        JSR     OSWRCH

        JMP     LBAC5

.LBDE2
        STA     (L02)
        INC     L02
        BNE     LBE05

        INC     L03
        PHA
        LDA     L03
        EOR     L07
        BEQ     LBD71

        PLA
        RTS

.LBDF3
        CLC
.LBDF4
        AND     L1F
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
        LDA     L2A
        STA     L00,X
        LDA     L2B
        STA     L01,X
        LDA     L2C
        STA     L02,X
        LDA     L2D
        STA     L03,X
        RTS

.LBE17
        JSR     LBE81

        STZ     L3D
        LDY     #$00
        LDA     #$FF
        LDX     #$37
        JSR     OSFILE

.LBE25
        LDA     L18
        STA     L13
        STZ     L12
        LDY     #$01
.LBE2D
        LDA     (L12)
        CMP     #$0D
        BNE     LBE51

        LDA     (L12),Y
        BMI     LBE43

        LDY     #$03
        LDA     (L12),Y
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
        ADC     L12
        STA     L12
        BCC     LBE4E

        INC     L13
.LBE4E
        LDY     #$01
        RTS

.LBE51
        JSR     LBF0F

        EQUS    $0D,"Bad program",$0D

        NOP
        JMP     L904B

.LBE65
        STZ     L37
        LDA     #$06
        STA     L38
.LBE6B
        LDY     L36
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
        STY     L39
        LDA     L18
        STA     L3A
.LBE8B
        LDA     #$82
        JSR     OSBYTE

        STX     L3B
        STY     L3C
        RTS

.LBE95
        JSR     LBE25

        JSR     LBE81

        STX     L3F
        STY     L40
        STX     L43
        STY     L44
        STX     L47
        STY     L48
        STZ     L41
        LDX     L12
        STX     L45
        LDX     L13
        STX     L46
        LDX     #$E7
        STX     L3D
        LDX     #$80
        STX     L3E
        LDX     L18
        STX     L42
        LDA     #$00
        TAY
        LDX     #$37
        JSR     OSFILE

        BRA     LBEEB

.LBEC7
        JSR     LBE76

        LDX     #$00
        LDY     #$06
        JSR     OSCLI

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
        JSR     OSARGS

.LBEEB
        JMP     L90CA

.LBEEE
        JSR     LBA6E

        JSR     L9C5A

        LDY     L2A
        LDA     #$00
        JSR     OSFIND

        BRA     LBEEB

.LBEFD
        JSR     LBA6E

LBEFE = LBEFD+1
.LBF00
        PHA
        JSR     L9771

        JSR     L9C5A

        PLY
        LDA     L2A
        JSR     OSBPUT

        BRA     LBEEB

.LBF0F
        PLA
        STA     L37
        PLA
        STA     L38
        BRA     LBF1A

.LBF17
        JSR     OSASCI

.LBF1A
        JSR     L8E66

        BPL     LBF17

        JMP     (L37)

.LBF22
        LDA     #$05
        PHX
        LDX     #$2A
        LDY     #$00
        JSR     OSWORD

        PLX
        LDA     L2E
.LBF2F
        INC     L2A
        BNE     LBF3D

        INC     L2B
        BNE     LBF3D

        INC     L2C
        BNE     LBF3D

        INC     L2D
.LBF3D
        RTS

.LBF3E
        LDA     #$0D
        LDY     L18
        STY     L13
        STZ     L12
        STZ     L20
        STA     (L12)
        LDA     #$FF
        LDY     #$01
        STA     (L12),Y
        INY
        STY     L12
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
        JMP     OSCLI

.LBF66
        LDA     #$EA
        LDX     #$00
        LDY     #$FF
        JSR     OSBYTE

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

