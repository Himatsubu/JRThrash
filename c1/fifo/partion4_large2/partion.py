print "for(k=1;k<=65;k++){"
for i in xrange (1,66):
    print "	sub00.u["+str(i*129)+"+k]=u["+str(i*129)+"+k];"
for i in xrange (64,130):
    print "	sub01.u["+str(i*129)+"+k]=u["+str(i*129)+"+k];"
print "}"

print "for(k=64;k<=129;k++){"
for i in xrange (1,66):
    print "	sub02.u["+str(i*129)+"+k]=u["+str(i*129)+"+k];"
for i in xrange (64,130):
    print "	sub03.u["+str(i*129)+"+k]=u["+str(i*129)+"+k];"
print "}"
