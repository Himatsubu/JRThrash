print "for(k=1;k<=65;k++){"
for i in xrange (1,34):
    print "	sub00.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange (32,66):
    print "	sub01.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
    print "	sub02.u["+str(i*129)+"+k+32]=u["+str(129*i)+"+k+32];"
    print "	sub03.u["+str(i*129)+"+k+64]=u["+str(129*i)+"+k+64];"
print "}"

print "for(k=64;k<=129;k++){"
for i in xrange (1,34):
    print "	sub04.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
for i in xrange(32,66):
    print "	sub05.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
    print "	sub06.u["+str(i*129)+"+k+32]=u["+str(129*i)+"+k+32];"
    print "	sub07.u["+str(i*129)+"+k+64]=u["+str(129*i)+"+k+64];"
print "}"
