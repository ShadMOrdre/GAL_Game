#!/usr/bin/env python
import sys
from PIL import Image

def tadd(a, b):
	return tuple(sum(e) for e in zip(a, b))

if len(sys.argv) < 2:
	print("Prints average color (RGB) of input image")
	print("Usage: %s <input>" % sys.argv[0])
	exit(1)

inp = Image.open(sys.argv[1]).convert('RGBA')
ind = inp.load()

cl = (0, 0, 0)
counted = 0
for x in range(inp.size[0]):
	for y in range(inp.size[1]):
		px = ind[x, y]
		if px[3] < 128: continue # alpha
		cl = tadd(cl, px[:3])
		counted += 1

if counted == 0:
	sys.stderr.write("did not find avg color for %s\n" % sys.argv[1])
	print("0 0 0")
else:
	cl = tuple(int(n / counted) for n in cl)
	print("%d %d %d" % cl)