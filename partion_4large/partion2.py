print "for(k=1;k<=16;k++){"
for i in xrange(1,17):
    print "	sub00.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(15,32):
    print "	sub01.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print "}"

print "for(k=15;k<=31;k++){"
for i in xrange(1,17):
    print "	sub02.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(15,32):
    print "	sub03.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print "}"
