print "for(j=1;j<=65;j++){"
for i in xrange(1,130):
      print "	sub00.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
print "}"
print "for(k=64;k<=129;k++){"
for i in xrange(1,130):
      print "	sub01.u["+str(i*129)+"+k]=u["+str(129*i)+"+k];"
print "}"
