print "for(k=1;k<=6;k++){"
for i in xrange(1,12):
    print "	sub00.U["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
for i in xrange(1,12):
    print "	sub00.V["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
print "}"
print "for(k=5,k<=11;k++){"
for i in xrange(1,12):
   print "	sub01.U["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
for i in xrange(1,12):
   print "	sub01.V["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
print "}"
print "\n"


print "for(k=1;k<=6;k++){"
for i in xrange(1,12):
    print "	sub00.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
print "}"
print "for(k=5;k<=11;k++){"
for i in xrange(1,12):
    print "	sub01.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
print "}"

print "\n"

print "for(k=2;k<=5;k++){"
for i in xrange(2,11):
    print "	T["+str(i*11)+"+k]=sub00.result["+str(i*11)+"+k];"
print "}"
print "for(k=6;k<=10;k++){"
for i in xrange(2,11):
    print "	T["+str(i*11)+"+k]=sub01.result["+str(i*11)+"+k];"
print "}"
