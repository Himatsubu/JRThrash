print "for(k=1;k<=12;k++){"
for i in xrange(1,13):
    print "	sub00.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(11,23):
    print "	sub01.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(21,32):
    print "	sub02.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
#print	"}"

#print "for(k=11;k<=22;k++){"
for i in xrange(1,13):
    print "	sub03.T["+str(i*31)+"+k+10]=T["+str(i*31)+"+k+10];"
for i in xrange(11,23):
    print "	sub04.T["+str(i*31)+"+k+10]=T["+str(i*31)+"+k+10];"
for i in xrange(21,32):
    print "	sub05.T["+str(i*31)+"+k+10]=T["+str(i*31)+"+k+10];"
print	"}"

print "for(k=21;k<=31;k++){"
for i in xrange(1,13):
    print "	sub06.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(11,23):
    print "	sub07.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(21,32):
    print "	sub08.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print	"}"