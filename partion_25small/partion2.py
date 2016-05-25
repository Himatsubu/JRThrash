print "for(k=1;k<=3;k++){"
for i in xrange(1,4):
    print "	sub00.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(2,5):
    print "	sub01.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(4,8):
    print "	sub02.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(6,10):
    print "	sub03.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(8,12):
    print "	sub04.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
print "}"

print "for(k=2;k<=5;k++){"
for i in xrange(1,4):
    print "	sub05.T["+str(i*11)+"+k+=T["+str(i*11)+"+k];"
for i in xrange(2,5):
    print "	sub06.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(4,8):
    print "	sub07.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(6,10):
    print "	sub08.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(8,12):
    print "	sub09.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"

for i in xrange(1,4):
    print "	sub10.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"
for i in xrange(2,5):
    print "	sub11.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"
for i in xrange(4,8):
    print "	sub12.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"
for i in xrange(6,10):
    print "	sub13.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"
for i in xrange(8,12):
    print "	sub14.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"

for i in xrange(1,4):
    print "	sub15.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(2,5):
    print "	sub16.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(4,8):
    print "	sub17.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(6,10):
    print "	sub18.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(8,12):
    print "	sub19.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
#print "}"

#print "(k=25;k<=11;k++){"
for i in xrange(1,4):
    print "	sub20.T["+str(i*11)+"+k+6]=T["+str(i*11)+"+k+6];"
for i in xrange(2,5):
    print "	sub21.T["+str(i*11)+"+k+6]=T["+str(i*11)+"+k+6];"
for i in xrange(4,8):
    print "	sub22.T["+str(i*11)+"+k+6]=T["+str(i*11)+"+k+6];"
for i in xrange(6,10):
    print "	sub23.T["+str(i*11)+"+k+6]=T["+str(i*11)+"+k+6];"
for i in xrange(8,12):
    print "	sub24.T["+str(i*11)+"+k+6]=T["+str(i*11)+"+k+6];"
print "}"

