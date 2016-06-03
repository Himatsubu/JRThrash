print "for(k=1;k<=22;k++){"
for i in xrange(1,23):
    print "	sub00.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(21,43):
    print "	sub01.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(41,63):
    print "	sub02.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(61,83):
    print "	sub03.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(81,102):
    print "	sub04.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"

for i in xrange(1,23):
    print "	sub05.T["+str(i*101)+"+k+20]=T["+str(i*101)+"+k+20];"
for i in xrange(21,43):
    print "	sub06.T["+str(i*101)+"+k+20]=T["+str(i*101)+"+k+20];"
for i in xrange(41,63):
    print "	sub07.T["+str(i*101)+"+k+20]=T["+str(i*101)+"+k+20];"
for i in xrange(61,83):
    print "	sub08.T["+str(i*101)+"+k+20]=T["+str(i*101)+"+k+20];"
for i in xrange(81,102):
    print "	sub09.T["+str(i*101)+"+k+20]=T["+str(i*101)+"+k+20];"

for i in xrange(1,23):
    print "	sub10.T["+str(i*101)+"+k+40]=T["+str(i*101)+"+k+40];"
for i in xrange(21,43):
    print "	sub11.T["+str(i*101)+"+k+40]=T["+str(i*101)+"+k+40];"
for i in xrange(41,63):
    print "	sub12.T["+str(i*101)+"+k+40]=T["+str(i*101)+"+k+40];"
for i in xrange(61,83):
    print "	sub13.T["+str(i*101)+"+k+40]=T["+str(i*101)+"+k+40];"
for i in xrange(81,102):
    print "	sub14.T["+str(i*101)+"+k+40]=T["+str(i*101)+"+k+40];"

for i in xrange(1,23):
    print "	sub15.T["+str(i*101)+"+k+60]=T["+str(i*101)+"+k+60];"
for i in xrange(21,43):
    print "	sub16.T["+str(i*101)+"+k+60]=T["+str(i*101)+"+k+60];"
for i in xrange(41,63):
    print "	sub17.T["+str(i*101)+"+k+60]=T["+str(i*101)+"+k+60];"
for i in xrange(61,83):
    print "	sub18.T["+str(i*101)+"+k+60]=T["+str(i*101)+"+k+60];"
for i in xrange(81,102):
    print "	sub19.T["+str(i*101)+"+k+60]=T["+str(i*101)+"+k+60];"
print "}"

print "(k=81;k<=101;k++){"
for i in xrange(1,23):
    print "	sub20.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(21,43):
    print "	sub21.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(41,63):
    print "	sub22.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(61,83):
    print "	sub23.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
for i in xrange(81,102):
    print "	sub24.T["+str(i*101)+"+k]=T["+str(i*101)+"+k];"
print "}"

