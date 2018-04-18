#!/bin/bash

# Disassemble
../tools/beebdis Basic432.dis

# Remove a junk file left by beebdis
rm -f "c:\\tmp\\newcontrol.txt"

# Add the 65C02 CPU directive
echo "; Enable 65C02 opcodes" > tmp
echo "CPU           1" >> tmp
echo >> tmp
cat  Basic432.asm >> tmp
mv tmp  Basic432.asm

# Correct some bad opcodes
sed -i -e "s/ DEC*$/ DEC     A/" Basic432.asm
sed -i -e "s/ INC*$/ INC     A/" Basic432.asm

# Correct some constants that should be labels
sed -i -e "s/\$\([89AB][0-9A-F][0-9A-F][0-9A-F]\)/L\1/g" Basic432.asm

# Put a few back that are used in the header
sed -i -e "s/L8000/\$8000/" Basic432.asm
sed -i -e "s/L8028/\$8028/" Basic432.asm
sed -i -e "s/LB800/\$B800/" Basic432.asm

# Remove unreferenced labels
# (BeebDis is very liberal with labels)
grep "^\.L[89AB][0-9A-F][0-9A-F][0-9A-F]" Basic432.asm | cut -c2- > labels
for i in `cat labels`
do
    hits=$(grep -c $i Basic432.asm)
    if [ "$hits" == "1" ]; then
        echo "Removing $i"
        grep -v "$i" Basic432.asm > x
        mv x Basic432.asm
    fi
done
rm -f labels

         


# Assemble
rm -f Basic432.bin
../tools/beebasm -i Basic432.asm

# Test
md5sum Basic432.orig
md5sum Basic432.bin

