print "for(k=1;k<=5;k++){"
for i in xrange(1,6):
    print "	sub00.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(4,10):
    print "	sub01.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(8,14):
    print "	sub02.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(12,18):
    print "	sub03.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(16,21):
    print "	sub04.u["+str(i*21)+"+k]=u["+str(i*21)+"+k];"
print "}"

print "for(k=4;k<=9;k++){"
for i in xrange(1,6):
    print "	sub05.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(4,10):
    print "	sub06.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(8,14):
    print "	sub07.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(12,18):
    print "	sub08.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(16,21):
    print "	sub09.u["+str(i*21)+"+k]=u["+str(i*21)+"+k];"

for i in xrange(1,6):
    print "	sub10.u["+str(i*21)+"+k+4]=u["+str(21*i)+"+k+4];"
for i in xrange(4,10):
    print "	sub11.u["+str(i*21)+"+k+4]=u["+str(21*i)+"+k+4];"
for i in xrange(8,14):
    print "	sub12.u["+str(i*21)+"+k+4]=u["+str(21*i)+"+k+4];"
for i in xrange(12,18):
    print "	sub13.u["+str(i*21)+"+k+4]=u["+str(21*i)+"+k+4];"
for i in xrange(16,21):
    print "	sub14.u["+str(i*21)+"+k+4]=u["+str(i*21)+"+k+4];"

for i in xrange(1,6):
    print "	sub15.u["+str(i*21)+"+k+8]=u["+str(21*i)+"+k+8];"
for i in xrange(4,10):
    print "	sub16.u["+str(i*21)+"+k+8]=u["+str(21*i)+"+k+8];"
for i in xrange(8,14):
    print "	sub17.u["+str(i*21)+"+k+8]=u["+str(21*i)+"+k+8];"
for i in xrange(12,18):
    print "	sub18.u["+str(i*21)+"+k+8]=u["+str(21*i)+"+k+8];"
for i in xrange(16,21):
    print "	sub19.u["+str(i*21)+"+k+8]=u["+str(i*21)+"+k+8];"

for i in xrange(1,6):
    print "	sub20.u["+str(i*21)+"+k+12]=u["+str(21*i)+"+k+12];"
for i in xrange(4,10):
    print "	sub21.u["+str(i*21)+"+k+12]=u["+str(21*i)+"+k+12];"
for i in xrange(8,14):
    print "	sub22.u["+str(i*21)+"+k+12]=u["+str(21*i)+"+k+12];"
for i in xrange(12,18):
    print "	sub23.u["+str(i*21)+"+k+12]=u["+str(21*i)+"+k+12];"
for i in xrange(16,21):
    print "	sub24.u["+str(i*21)+"+k+12]=u["+str(i*21)+"+k+12];"
print "}"

