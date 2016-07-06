print "for(k=2;k<=5;k++){"
for i in xrange(2,6):
    print "	u["+str(i*21)+"+k]=sub00.result["+str(i*21)+"+k];"
for i in xrange(6,11):
    print "	u["+str(i*21)+"+k]=sub01.result["+str(i*21)+"+k];"
for i in xrange(11,16):
    print "	u["+str(i*21)+"+k]=sub02.result["+str(i*21)+"+k];"
for i in xrange(16,21):
    print "	u["+str(i*21)+"+k]=sub03.result["+str(i*21)+"+k];"
print "}"

print "for(k=6;k<=10;k++){"
for i in xrange(2,6):
    print "	u["+str(i*21)+"+k]=sub04.result["+str(i*21)+"+k];"
for i in xrange(6,11):
    print "	u["+str(i*21)+"+k]=sub05.result["+str(i*21)+"+k];"
for i in xrange(11,16):
    print "	u["+str(i*21)+"+k]=sub06.result["+str(i*21)+"+k];"
for i in xrange(16,21):
    print "	u["+str(i*21)+"+k]=sub07.result["+str(i*21)+"+k];"

for i in xrange(2,6):
    print "	u["+str(i*21)+"+k+5]=sub08.result["+str(i*21)+"+k+5];"
for i in xrange(6,11):
    print "	u["+str(i*21)+"+k+5]=sub09.result["+str(i*21)+"+k+5];"
for i in xrange(11,16):
    print "	u["+str(i*21)+"+k+5]=sub10.result["+str(i*21)+"+k+5];"
for i in xrange(16,21):
    print "	u["+str(i*21)+"+k+5]=sub11.result["+str(i*21)+"+k+5];"

for i in xrange(2,6):
    print "	u["+str(i*21)+"+k+10]=sub12.result["+str(i*21)+"+k+10];"
for i in xrange(6,11):
    print "	u["+str(i*21)+"+k+10]=sub13.result["+str(i*21)+"+k+10];"
for i in xrange(11,16):
    print "	u["+str(i*21)+"+k+10]=sub14.result["+str(i*21)+"+k+10];"
for i in xrange(16,21):
    print "	u["+str(i*21)+"+k+10]=sub15.result["+str(i*21)+"+k+10];"
print "}"

