print "for(k=2;k<=64;k++){"
for i in xrange (2,33):
    print "	u["+str(i*129)+"+k]=sub00.result[+"+str(i*129)+"+k];"
for i in xrange (33,65):
    print "	u["+str(i*129)+"+k]=sub01.result[+"+str(i*129)+"+k];"
    print "	u["+str((i+32)*129)+"+k]=sub02.result[+"+str((i+32)*129)+"+k];"
    print "	u["+str((i+64)*129)+"+k]=sub03.result[+"+str((i+64)*129)+"+k];"
print "}"

print "for(k=65;k<=128;k++){"
for i in xrange (2,33):
    print "	u["+str(i*129)+"+k]=sub04.result[+"+str(i*129)+"+k];"
for i in xrange (33,65):
    print "	u["+str(i*129)+"+k]=sub05.result[+"+str(i*129)+"+k];"
    print "	u["+str((i+32)*129)+"+k]=sub06.result[+"+str((i+32)*129)+"+k];"
    print "	u["+str((i+64)*129)+"+k]=sub07.result[+"+str((i+64)*129)+"+k];"
print "}"
