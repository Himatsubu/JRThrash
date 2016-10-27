print "for(k=2;k<=32;k++){"
for i in xrange(2,33):
    print "	u["+str(i*129)+"+k]=sub00.result["+str(i*129)+"+k];"
for i in xrange(33,65):
    print "	u["+str(i*129)+"+k]=sub01.result["+str((i-31)*129)+"+k];"
for i in xrange(65,97):
    print "	u["+str(i*129)+"+k]=sub02.result["+str((i-63)*129)+"+k];"
for i in xrange(97,129):
    print "	u["+str(i*129)+"+k]=sub03.result["+str((i-95)*129)+"+k];"
print "}"

print "for(k=6;k<=64;k++){"
for i in xrange(2,33):
    print "	u["+str(i*129)+"+k]=sub04.result["+str(i*129)+"+k];"
for i in xrange(33,65):
    print "	u["+str(i*129)+"+k]=sub05.result["+str((i-31)*129)+"+k];"
for i in xrange(65,97):
    print "	u["+str(i*129)+"+k]=sub06.result["+str((i-63)*129)+"+k];"
for i in xrange(97,129):
    print "	u["+str(i*129)+"+k]=sub07.result["+str((i-95)*129)+"+k];"
print "}"

print "for(k=65;k<=96;k++){"
for i in xrange(2,33):
    print "	u["+str(i*129)+"+k+32]=sub08.result["+str(i*129)+"+k+32];"
for i in xrange(33,65):
    print "	u["+str(i*129)+"+k+32]=sub09.result["+str((i-31)*129)+"+k+32];"
for i in xrange(65,97):
    print "	u["+str(i*129)+"+k+32]=sub10.result["+str((i-63)*129)+"+k+32];"
for i in xrange(97,129):
    print "	u["+str(i*129)+"+k+32]=sub11.result["+str((i-95)*129)+"+k+32];"
print "}"

print "for(k=97;k<=128;k++){"
for i in xrange(2,33):
    print "	u["+str(i*129)+"+k+64]=sub12.result["+str(i*129)+"+k+64];"
for i in xrange(33,65):
    print "	u["+str(i*129)+"+k+64]=sub13.result["+str((i-31)*129)+"+k+64];"
for i in xrange(65,97):
    print "	u["+str(i*129)+"+k+64]=sub14.result["+str((i-63)*129)+"+k+64];"
for i in xrange(97,129):
    print "	u["+str(i*129)+"+k+64]=sub15.result["+str((i-95)*129)+"+k+64];"
print "}"

