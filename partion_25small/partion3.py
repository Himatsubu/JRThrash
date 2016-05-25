#print "for(k=2;k<=7;k++){"
#for i in xrange(2,8):
print "	T["+str(2*11)+"+k]=sub00.result["+str(2*11)+"+k];"
for i in xrange(3,5):
    print "	T["+str(i*11)+"+k]=sub01.result["+str(i*11)+"+k];"
for i in xrange(5,7):
    print "	T["+str(i*11)+"+k]=sub02.result["+str(i*11)+"+k];"
for i in xrange(7,9):
    print "	T["+str(i*11)+"+k]=sub03.result["+str(i*11)+"+k];"
for i in xrange(9,11):
    print "	T["+str(i*11)+"+k]=sub04.result["+str(i*11)+"+k];"


print "for(k=3;k<=4;k++){"
for i in xrange(2,3):
    print "	T["+str(i*11)+"+k]=sub05.result["+str(i*11)+"+k];"
for i in xrange(3,5):
    print "	T["+str(i*11)+"+k]=sub06.result["+str(i*11)+"+k];"
for i in xrange(5,7):
    print "	T["+str(i*11)+"+k]=sub07.result["+str(i*11)+"+k];"
for i in xrange(7,9):
    print "	T["+str(i*11)+"+k]=sub08.result["+str(i*11)+"+k];"
for i in xrange(9,11):
    print "	T["+str(i*11)+"+k]=sub09.result["+str(i*11)+"+k];"

for i in xrange(2,3):
    print "	T["+str(i*11)+"+k+2]=sub10.result["+str(i*11)+"k+2];"
for i in xrange(3,5):
    print "	T["+str(i*11)+"+k+2]=sub11.result["+str(i*11)+"+k+2];"
for i in xrange(5,7):
    print "	T["+str(i*11)+"+k+2]=sub12.result["+str(i*11)+"+k+2];"
for i in xrange(7,9):
    print "	T["+str(i*11)+"+k+2]=sub13.result["+str(i*11)+"+k+2];"
for i in xrange(9,11):
    print "	T["+str(i*11)+"+k+2]=sub14.result["+str(i*11)+"+k+2];"

for i in xrange(2,3):
    print "	T["+str(i*11)+"+k+4]=sub15.result["+str(i*11)+"+k+4];"
for i in xrange(3,5):
    print "	T["+str(i*11)+"+k+4]=sub16.result["+str(i*11)+"+k+4];"
for i in xrange(5,7):
    print "	T["+str(i*11)+"+k+4]=sub17.result["+str(i*11)+"+k+4];"
for i in xrange(7,9):
    print "	T["+str(i*11)+"+k+4]=sub18.result["+str(i*11)+"+k+4];"
for i in xrange(9,11):
    print "	T["+str(i*11)+"+k+4]=sub19.result["+str(i*11)+"+k+4];"
#print "}"

#print "for(k=26;k<=30;k++){"
for i in xrange(2,3):
    print "	T["+str(i*11)+"+k+6]=sub20.result["+str(i*11)+"+k+6];"
for i in xrange(3,5):
    print "	T["+str(i*11)+"+k+6]=sub21.result["+str(i*11)+"+k+6];"
for i in xrange(5,7):
    print "	T["+str(i*11)+"+k+6]=sub22.result["+str(i*11)+"+k+6];"
for i in xrange(7,9):
    print "	T["+str(i*11)+"+k+6]=sub23.result["+str(i*11)+"+k+6];"
for i in xrange(9,11):
    print "	T["+str(i*11)+"+k+6]=sub24.result["+str(i*11)+"+k+6];"
print "}"

