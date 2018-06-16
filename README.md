# BBCBasic4r32
Here's an annotated disassembly of BBC Basic 4r32, the final version of Acorn's 6502 Basic interpreter,
suitable for assembly with beebasm.

Also here are some explorations of the algorithms used to calculate the log and trig functions,
with an aim to understanding the bugs mentioned in
[this thread](https://stardot.org.uk/forums/viewtopic.php?t=10111) on StarDot.

We were able to understand the bug and fix it. You can patch BBC Basic located at &8000
with a program like this:
```
   10  T=1.03125
   20  REPORT
   30  PRINT
   40  PROCtest(T)
   50  P%=&A8CC
   60 [OPT 0
   70  CLC
   80  ADC #&F0
   90  .loop
  100  ADC #$0A
  110  DEY
  120  BPL loop
  130 ]
  140  PROCtest(T)
  150  END
  160  DEF PROCtest(A)
  170  PRINT A
  180  PRINT LN(A)
  190  PRINT A-EXP(LN(A))
  200  PRINT
  210  ENDPROC
```

Only six bytes need to be changed, the bug being in computing an index into a table,
which broke with entries near the end of a page.
See [these notes](https://github.com/hoglet67/BBCBasic4r32/blob/master/disassembly/examples/ln_1000/notes.txt#L120).

The original code:
```
        CLC
.LA8CD
        ADC     #$0A
        DEY
        BPL     LA8CD
        ADC     #$F1
```

Our fixed version:
```
        CLC
        ADC     #$F0
.LA8CF
        ADC     #$0A
        DEY
        BPL     LA8CF
```

This fixed code would now fail for entries near the beginning of a page, but that
doesn't happen.
