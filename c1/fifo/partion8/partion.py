print "for(k=1;k<=65;k++){"
for i in xrange (1,34):
    print "	sub00.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange (32,66):
    print "	sub01.u["+str((i-31)*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange (64,98):
    print "	sub02.u["+str((i-63)*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange (96,129):
    print "	sub03.u["+str((i-95)*129)+"+k]=u["+str(129*i)+"+k];"
print "}"

print "for(k=64;k<=129;k++){"
for i in xrange (1,34):
    print "	sub04.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(32,66):
    print "	sub05.u["+str((i-31)*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(64,97):
    print "	sub06.u["+str((i-63)*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(96,129):
    print "	sub07.u["+str((i-95)*129)+"+k]=u["+str(129*i)+"+k];"
print "}"
