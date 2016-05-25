print "for(k=1;k<=4;k++){"
for i in xrange(1,5):
    print "	sub00.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(3,7):
    print "	sub01.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(5,9):
    print "	sub02.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(7,12):
    print "	sub03.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"

for i in xrange(1,5):
    print "	sub04.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+2];"
for i in xrange(3,7):
    print "	sub05.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"
for i in xrange(5,9):
    print "	sub06.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"
for i in xrange(7,12):
    print "	sub07.T["+str(i*11)+"+k+2]=T["+str(i*11)+"+k+2];"

for i in xrange(1,5):
    print "	sub08.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(3,7):
    print "	sub09.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(5,9):
    print "	sub10.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
for i in xrange(7,12):
    print "	sub11.T["+str(i*11)+"+k+4]=T["+str(i*11)+"+k+4];"
print "}"

print "for(k=7;k<=11;k++){"
for i in xrange(1,5):
    print "	sub12.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(3,7):
    print "	sub13.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(5,9):
    print "	sub14.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(7,12):
    print "	sub15.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
print "}"
