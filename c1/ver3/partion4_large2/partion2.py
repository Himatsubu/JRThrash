print "for(k=2;k<=64;k++){"
for i in xrange (2,65):
    print "	u["+str(i*129)+"+k]=sub00.result["+str(i*129)+"+k];"
for i in xrange (65,129):
    print "	u["+str(i*129)+"+k]=sub01.result["+str(i*129)+"+k];"
print "}"

print "for(k=65;k<=128;k++){"
for i in xrange (2,65):
    print "	u["+str(i*129)+"+k]=sub02.result["+str(i*129)+"+k];"
for i in xrange (65,129):
    print "	u["+str(i*129)+"+k]=sub03.result["+str(i*129)+"+k];"
print "}"
