print "for(k=2;k<=8;k++){"
for i in xrange(2,9):
    print "	T["+str(i*31)+"+k]=sub00.result["+str(i*31)+"+k];"
for i in xrange(9,16):
    print "	T["+str(i*31)+"+k]=sub01.result["+str(i*31)+"+k];"
for i in xrange(16,23):
    print "	T["+str(i*31)+"+k]=sub02.result["+str(i*31)+"+k];"
for i in xrange(23,31):
    print "	T["+str(i*31)+"+k]=sub03.result["+str(i*31)+"+k];"

for i in xrange(2,9):
    print "	T["+str(i*31)+"+k+7]=sub04.result["+str(i*31)+"+k+7];"
for i in xrange(9,16):
    print "	T["+str(i*31)+"+k+7]=sub05.result["+str(i*31)+"+k+7];"
for i in xrange(16,23):
    print "	T["+str(i*31)+"+k+7]=sub06.result["+str(i*31)+"+k+7];"
for i in xrange(23,31):
    print "	T["+str(i*31)+"+k+7]=sub07.result["+str(i*31)+"+k+7];"

for i in xrange(2,9):
    print "	T["+str(i*31)+"+k+14]=sub08.result["+str(i*31)+"+k+14];"
for i in xrange(9,16):
    print "	T["+str(i*31)+"+k+14]=sub09.result["+str(i*31)+"+k+14];"
for i in xrange(16,23):
    print "	T["+str(i*31)+"+k+14]=sub10.result["+str(i*31)+"k+14];"
for i in xrange(23,31):
    print "	T["+str(i*31)+"+k+14]=sub11.result["+str(i*31)+"+k+14];"
print "}"

print "for(k=23;k<=30;k++){"
for i in xrange(2,9):
    print "	T["+str(i*31)+"+k]=sub12.result["+str(i*31)+"+k];"
for i in xrange(9,16):
    print "	T["+str(i*31)+"+k]=sub13.result["+str(i*31)+"+k];"
for i in xrange(16,23):
    print "	T["+str(i*31)+"+k]=sub14.result["+str(i*31)+"+k];"
for i in xrange(23,31):
    print "	T["+str(i*31)+"+k]=sub15.result["+str(i*31)+"+k];"
print "}"
