#! /usr/bin/env python
import pmag
file=raw_input("Enter igrf file name ")
outfile=file+'.out'
pmag.lowes(file,outfile)
