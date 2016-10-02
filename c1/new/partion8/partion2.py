print "for(k=2;k<=64;k++){"
for i in xrange (2,33):
    print "	u["+str(i*129)+"+k]=sub00.result[+"+str(i*129)+"+k];"
for i in xrange (33,65):
    print "	u["+str(i*129)+"+k]=sub01.result[+"+str(i*129)+"+k];"
    print "	u["+str(i*129)+"+k+32]=sub02.result[+"+str(i*129)+"+k+32];"
    print "	u["+str(i*129)+"+k+64]=sub03.result[+"+str(i*129)+"+k+64];"
print "}"

print "for(k=65;k<=128;k++){"
for i in xrange (2,33):
    print "	u["+str(i*129)+"+k]=sub04.result[+"+str(i*129)+"+k];"
for i in xrange (33,65):
    print "	u["+str(i*129)+"+k]=sub05.result[+"+str(i*129)+"+k];"
    print "	u["+str(i*129)+"+k+32]=sub06.result[+"+str(i*129)+"+k+32];"
    print "	u["+str(i*129)+"+k+64]=sub07.result[+"+str(i*129)+"+k+64];"
print "}"
