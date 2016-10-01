print "for(k=1;k<=33;k++){"
for i in xrange(1,34):
    print "	sub00.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(32,66):
    print "	sub01.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(64,98):
    print "	sub02.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(96,130):
    print "	sub03.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
print "}"

print "for(k=32;k<=65;k++){"
for i in xrange(1,34):
    print "	sub04.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(32,66):
    print "	sub05.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(64,98):
    print "	sub06.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(96,130):
    print "	sub07.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"

for i in xrange(1,34):
    print "	sub08.u["+str(i*129)+"+k+32]=u["+str(129*i)+"+k+32];"
for i in xrange(32,66):
    print "	sub09.u["+str(i*129)+"+k+32]=u["+str(129*i)+"+k+32];"
for i in xrange(64,98):
    print "	sub10.u["+str(i*129)+"+k+32]=u["+str(129*i)+"+k+32];"
for i in xrange(96,130):
    print "	sub11.u["+str(i*129)+"+k+32]=u["+str(129*i)+"+k+32];"

for i in xrange(1,34):
    print "	sub12.u["+str(i*129)+"+k+64]=u["+str(129*i)+"+k+64];"
for i in xrange(32,66):
    print "	sub13.u["+str(i*129)+"+k+64]=u["+str(129*i)+"+k+64];"
for i in xrange(64,98):
    print "	sub14.u["+str(i*129)+"+k+64]=u["+str(129*i)+"+k+64];"
for i in xrange(96,130):
    print "	sub15.u["+str(i*129)+"+k+64]=u["+str(129*i)+"+k+64];"
print "}"

