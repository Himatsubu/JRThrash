print "for(k=1;k<=16;k++){"
for i in xrange(1,17):
    print "	sub00.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub00.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(15,32):
    print "	sub01.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub01.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
print "}"

print "for(k=15;k<=31;k++){"
for i in xrange(15,24):
    print "	sub02.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub02.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(22,32):
    print "	sub03.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub03.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
print "}"
