print "for(k=1;k<=65;k++){"
for i in xrange (1,34):
    print "	sub00.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange (32,66):
    print "	sub01.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
    print "	sub02.u["+str((i+32)*129)+"+k]=u["+str(129*(i+32))+"+k];"
    print "	sub03.u["+str((i+64)*129)+"+k]=u["+str(129*(i+64))+"+k];"
print "}"

print "for(k=64;k<=129;k++){"
for i in xrange (1,34):
    print "	sub04.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(32,66):
    print "	sub05.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
    print "	sub06.u["+str((i+32)*129)+"+k]=u["+str(129*(i+32))+"+k];"
    print "	sub07.u["+str((i+64)*129)+"+k]=u["+str(129*(i+64))+"+k];"
print "}"
