print "for(k=1;k<=4;k++){"
for i in xrange(1,5):
    print "	sub00.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub00.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(3,7):
    print "	sub01.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub01.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(5,9):
    print "	sub02.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub02.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(7,12):
    print "	sub03.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub03.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"

for i in xrange(1,5):
    print "	sub04.U["+str(i*11)+"+k+2]=U["+str(i*11)+"+k+2];"
    print "	sub04.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
for i in xrange(3,7):
    print "	sub05.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
    print "	sub05.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
for i in xrange(5,9):
    print "	sub06.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
    print "	sub06.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
for i in xrange(7,12):
    print "	sub07.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
    print "	sub07.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"

for i in xrange(1,5):
    print "	sub08.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
    print "	sub08.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(3,7):
    print "	sub09.U["+str(i*11)+"+k+4]=U["+str(i*11)+"+k+4];"
    print "	sub09.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(5,9):
    print "	sub10.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
    print "	sub10.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(7,12):
    print "	sub11.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
    print "	sub11.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
print "}"

print "for(k=7;k<=11;k++){"
for i in xrange(1,5):
    print "	sub12.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub12.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(3,7):
    print "	sub13.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub13.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(5,9):
    print "	sub14.U["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
    print "	sub14.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(7,12):
    print "	sub15.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub15.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"

print "}"

