print "for(k=2;k<=15;k++){"
for i in xrange(2,16):
    print "	T["+str(i*31)+"+k]=sub00.result["+str(i*31)+"+k];"
for i in xrange(16,31):
    print "	T["+str(i*31)+"+k]=sub01.result["+str(i*31)+"+k];"
print "}"

print"(fork=16;k<=30;k++){"
for i in xrange(2,16):
    print "	T["+str(i*31)+"+k]=sub02.result["+str(i*31)+"+k];"
for i in xrange(16,31):
    print "	T["+str(i*31)+"+k]=sub03.result["+str(i*31)+"+k];"
print "}"
