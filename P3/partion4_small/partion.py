print "for(k=1;k<=6;k++){"
for i in xrange(1,7):
    print "	sub00.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub00.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(5,12):
    print "	sub01.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub01.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
print "}"

print "for(k=5;k<=11;k++){"
for i in xrange(1,7):
    print "	sub02.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub02.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(5,12):
    print "	sub03.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub03.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
print "}"
