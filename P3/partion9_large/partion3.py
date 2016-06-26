print "for(k=2;k<=11;k++){"
for i in xrange(2,12):
    print "	T["+str(i*31)+"+k]=sub00.result["+str(i*31)+"+k];"
for i in xrange(12,22):
    print "	T["+str(i*31)+"+k]=sub01.result["+str(i*31)+"+k];"
for i in xrange(22,31):
    print "	T["+str(i*31)+"+k]=sub02.result["+str(i*31)+"+k];"
#print "}"

#print "for(k=12;k<=21;k++)"
for i in xrange(2,12):
    print "	T["+str(i*31)+"+k+10]=sub03.result["+str(i*31)+"+k+10];"
for i in xrange(12,22):
    print "	T["+str(i*31)+"+k+10]=sub04.result["+str(i*31)+"+k+10];"
for i in xrange(22,31):
    print "	T["+str(i*31)+"+k+10]=sub05.result["+str(i*31)+"+k+10];"
print	"}"

print "for(k=22;k<=30;k++){"
for i in xrange(2,12):
    print "	T["+str(i*31)+"+k]=sub06.result["+str(i*31)+"+k];"
for i in xrange(12,22):
    print "	T["+str(i*31)+"+k]=sub07.result["+str(i*31)+"+k];"
for i in xrange(22,31):
    print "	T["+str(i*31)+"+k]=sub08.result["+str(i*31)+"+k];"
print	"}"
