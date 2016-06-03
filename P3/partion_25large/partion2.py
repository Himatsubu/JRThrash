print "for(k=1;k<=8;k++){"
for i in xrange(1,9):
    print "	sub00.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(7,15):
    print "	sub01.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(13,21):
    print "	sub02.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(19,27):
    print "	sub03.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(25,32):
    print "	sub04.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"

for i in xrange(1,9):
    print "	sub05.T["+str(i*31)+"+k+6]=T["+str(i*31)+"+k+6];"
for i in xrange(7,15):
    print "	sub06.T["+str(i*31)+"+k+6]=T["+str(i*31)+"+k+6];"
for i in xrange(13,21):
    print "	sub07.T["+str(i*31)+"+k+6]=T["+str(i*31)+"+k+6];"
for i in xrange(19,27):
    print "	sub08.T["+str(i*31)+"+k+6]=T["+str(i*31)+"+k+6];"
for i in xrange(25,32):
    print "	sub09.T["+str(i*31)+"+k+6]=T["+str(i*31)+"+k+6];"

for i in xrange(1,9):
    print "	sub10.T["+str(i*31)+"+k+12]=T["+str(i*31)+"+k+12];"
for i in xrange(7,15):
    print "	sub11.T["+str(i*31)+"+k+12]=T["+str(i*31)+"+k+12];"
for i in xrange(13,21):
    print "	sub12.T["+str(i*31)+"+k+12]=T["+str(i*31)+"+k+12];"
for i in xrange(19,27):
    print "	sub13.T["+str(i*31)+"+k+12]=T["+str(i*31)+"+k+12];"
for i in xrange(25,32):
    print "	sub14.T["+str(i*31)+"+k+12]=T["+str(i*31)+"+k+12];"

for i in xrange(1,9):
    print "	sub15.T["+str(i*31)+"+k+18]=T["+str(i*31)+"+k+18];"
for i in xrange(7,15):
    print "	sub16.T["+str(i*31)+"+k+18]=T["+str(i*31)+"+k+18];"
for i in xrange(13,21):
    print "	sub17.T["+str(i*31)+"+k+18]=T["+str(i*31)+"+k+18];"
for i in xrange(19,27):
    print "	sub18.T["+str(i*31)+"+k+18]=T["+str(i*31)+"+k+18];"
for i in xrange(25,32):
    print "	sub19.T["+str(i*31)+"+k+18]=T["+str(i*31)+"+k+18];"
print "}"

print "(k=25;k<=31;k++){"
for i in xrange(1,9):
    print "	sub20.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(7,15):
    print "	sub21.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(13,21):
    print "	sub22.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(19,27):
    print "	sub23.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(25,32):
    print "	sub24.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print "}"

