print "for(k=2;k<=5;k++){"
for i in xrange(2,6):
    print "	T["+str(i*11)+"+k]=sub00.result["+str(i*11)+"+k];"
for i in xrange(6,11):
    print "	T["+str(i*11)+"+k]=sub01.result["+str(i*11)+"+k];"
print "}"

print"for(k=6;k<=10;k++){"
for i in xrange(2,6):
    print "	T["+str(i*11)+"+k]=sub02.result["+str(i*11)+"+k];"
for i in xrange(6,11):
    print "	T["+str(i*11)+"+k]=sub03.result["+str(i*11)+"+k];"
print "}"
