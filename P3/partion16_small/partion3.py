print "for(k=2;k<=3;k++){"
for i in xrange(2,4):
    print "	T["+str(i*11)+"+k]=sub00.result["+str(i*11)+"+k];"
for i in xrange(4,6):
    print "	T["+str(i*11)+"+k]=sub01.result["+str(i*11)+"+k];"
for i in xrange(6,8):
    print "	T["+str(i*11)+"+k]=sub02.result["+str(i*11)+"+k];"
for i in xrange(8,11):
    print "	T["+str(i*11)+"+k]=sub03.result["+str(i*11)+"+k];"

for i in xrange(2,4):
    print "	T["+str(i*11)+"+k+2]=sub04.result["+str(i*11)+"+k+2];"
for i in xrange(4,6):
    print "	T["+str(i*11)+"+k+2]=sub05.result["+str(i*11)+"+k+2];"
for i in xrange(6,8):
    print "	T["+str(i*11)+"+k+2]=sub06.result["+str(i*11)+"+k+2];"
for i in xrange(8,11):
    print "	T["+str(i*11)+"+k+2]=sub07.result["+str(i*11)+"+k+2];"

for i in xrange(2,4):
    print "	T["+str(i*11)+"+k+4]=sub08.result["+str(i*11)+"+k+4];"
for i in xrange(4,6):
    print "	T["+str(i*11)+"+k+4]=sub09.result["+str(i*11)+"+k+4];"
for i in xrange(6,8):
    print "	T["+str(i*11)+"+k+4]=sub10.result["+str(i*11)+"k+4];"
for i in xrange(8,11):
    print "	T["+str(i*11)+"+k+4]=sub11.result["+str(i*11)+"+k+4];"
print "}"

print "for(k=8;k<=10;k++){"
for i in xrange(2,4):
    print "	T["+str(i*11)+"+k]=sub12.result["+str(i*11)+"+k];"
for i in xrange(4,6):
    print "	T["+str(i*11)+"+k]=sub13.result["+str(i*11)+"+k];"
for i in xrange(6,8):
    print "	T["+str(i*11)+"+k]=sub14.result["+str(i*11)+"+k];"
for i in xrange(8,11):
    print "	T["+str(i*11)+"+k]=sub15.result["+str(i*11)+"+k];"
print "}"
