print "for(k=2;k<=7;k++){"
for i in xrange(2,8):
    print "	T["+str(i*31)+"+k]=sub00.result["+str(i*31)+"+k];"
for i in xrange(8,14):
    print "	T["+str(i*31)+"+k]=sub01.result["+str(i*31)+"+k];"
for i in xrange(14,20):
    print "	T["+str(i*31)+"+k]=sub02.result["+str(i*31)+"+k];"
for i in xrange(20,26):
    print "	T["+str(i*31)+"+k]=sub03.result["+str(i*31)+"+k];"
for i in xrange(26,31):
    print "	T["+str(i*31)+"+k]=sub04.result["+str(i*31)+"+k];"

for i in xrange(2,8):
    print "	T["+str(i*31)+"+k+6]=sub05.result["+str(i*31)+"+k+6];"
for i in xrange(8,14):
    print "	T["+str(i*31)+"+k+6]=sub06.result["+str(i*31)+"+k+6];"
for i in xrange(14,20):
    print "	T["+str(i*31)+"+k+6]=sub07.result["+str(i*31)+"+k+6];"
for i in xrange(20,26):
    print "	T["+str(i*31)+"+k+6]=sub08.result["+str(i*31)+"+k+6];"
for i in xrange(26,31):
    print "	T["+str(i*31)+"+k+6]=sub09.result["+str(i*31)+"+k+6];"

for i in xrange(2,8):
    print "	T["+str(i*31)+"+k+12]=sub10.result["+str(i*31)+"k+12];"
for i in xrange(8,14):
    print "	T["+str(i*31)+"+k+12]=sub11.result["+str(i*31)+"+k+12];"
for i in xrange(14,20):
    print "	T["+str(i*31)+"+k+12]=sub12.result["+str(i*31)+"+k+12];"
for i in xrange(20,26):
    print "	T["+str(i*31)+"+k+12]=sub13.result["+str(i*31)+"+k+12];"
for i in xrange(26,31):
    print "	T["+str(i*31)+"+k+12]=sub14.result["+str(i*31)+"+k+12];"

for i in xrange(2,8):
    print "	T["+str(i*31)+"+k+18]=sub15.result["+str(i*31)+"+k+18];"
for i in xrange(8,14):
    print "	T["+str(i*31)+"+k+18]=sub16.result["+str(i*31)+"+k+18];"
for i in xrange(14,20):
    print "	T["+str(i*31)+"+k+18]=sub17.result["+str(i*31)+"+k+18];"
for i in xrange(20,26):
    print "	T["+str(i*31)+"+k+18]=sub18.result["+str(i*31)+"+k+18];"
for i in xrange(26,31):
    print "	T["+str(i*31)+"+k+18]=sub19.result["+str(i*31)+"+k+18];"
print "}"

print "for(k=26;k<=30;k++){"
for i in xrange(2,8):
    print "	T["+str(i*31)+"+k]=sub20.result["+str(i*31)+"+k];"
for i in xrange(8,14):
    print "	T["+str(i*31)+"+k]=sub21.result["+str(i*31)+"+k];"
for i in xrange(14,20):
    print "	T["+str(i*31)+"+k]=sub22.result["+str(i*31)+"+k];"
for i in xrange(20,26):
    print "	T["+str(i*31)+"+k]=sub23.result["+str(i*31)+"+k];"
for i in xrange(26,31):
    print "	T["+str(i*31)+"+k]=sub24.result["+str(i*31)+"+k];"
print "}"

