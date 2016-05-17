print "for(k=1,k<=16;k++);{"
for i in xrange(1,32):
    print "sub00.U["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
for i in xrange(1,32):
    print "sub00.V["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
print "}"
print "for(k=15,k<=31;k++){"
for i in xrange(1,32):
   print "sub01.U["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
for i in xrange(1,32):
   print "sub01.V["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
print "}"
print "\n"


print "for(k=1;k<=16;k++){"
for i in xrange(1,32):
    print "	sub00.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print "}"
print "for(k=15;k<=31;k++){"
for i in xrange(1,32):
    print "	sub01.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print "}"

print "\n"

print "for(k=2;k<=15;k++){"
for i in xrange(2,31):
    print "	T["+str(i*31)+"+k]=sub00.result["+str(i*31)+"+k];"
print "}"
print "for(k=16;k<=30;k++){"
for i in xrange(2,31):
    print "	T["+str(i*31)+"+k]=sub01.result["+str(i*31)+"+k];"
print "}"
