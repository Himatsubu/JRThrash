print "for(k=2;k<=21;k++){"
for i in xrange(2,22):
    print "	T["+str(i*101)+"+k]=sub00.result["+str(i*101)+"+k];"
for i in xrange(8,42):
    print "	T["+str(i*101)+"+k]=sub01.result["+str(i*101)+"+k];"
for i in xrange(14,62):
    print "	T["+str(i*101)+"+k]=sub02.result["+str(i*101)+"+k];"
for i in xrange(61,82):
    print "	T["+str(i*101)+"+k]=sub03.result["+str(i*101)+"+k];"
for i in xrange(81,101):
    print "	T["+str(i*101)+"+k]=sub04.result["+str(i*101)+"+k];"

for i in xrange(2,22):
    print "	T["+str(i*101)+"+k+20]=sub05.result["+str(i*101)+"+k+20];"
for i in xrange(22,42):
    print "	T["+str(i*101)+"+k+20]=sub06.result["+str(i*101)+"+k+20];"
for i in xrange(42,62):
    print "	T["+str(i*101)+"+k+20]=sub07.result["+str(i*101)+"+k+20];"
for i in xrange(62,82):
    print "	T["+str(i*101)+"+k+20]=sub08.result["+str(i*101)+"+k+20];"
for i in xrange(82,101):
    print "	T["+str(i*101)+"+k+20]=sub09.result["+str(i*101)+"+k+20];"

for i in xrange(2,22):
    print "	T["+str(i*101)+"+k+40]=sub10.result["+str(i*101)+"+k+40];"
for i in xrange(22,42):
    print "	T["+str(i*101)+"+k+40]=sub11.result["+str(i*101)+"+k+40];"
for i in xrange(42,62):
    print "	T["+str(i*101)+"+k+40]=sub12.result["+str(i*101)+"+k+40];"
for i in xrange(62,82):
    print "	T["+str(i*101)+"+k+40]=sub13.result["+str(i*101)+"+k+40];"
for i in xrange(82,101):
    print "	T["+str(i*101)+"+k+40]=sub14.result["+str(i*101)+"+k+40];"

for i in xrange(2,22):
    print "	T["+str(i*101)+"+k+60]=sub15.result["+str(i*101)+"+k+60];"
for i in xrange(22,42):
    print "	T["+str(i*101)+"+k+60]=sub16.result["+str(i*101)+"+k+60];"
for i in xrange(42,62):
    print "	T["+str(i*101)+"+k+60]=sub17.result["+str(i*101)+"+k+60];"
for i in xrange(62,82):
    print "	T["+str(i*101)+"+k+60]=sub18.result["+str(i*101)+"+k+60];"
for i in xrange(82,101):
    print "	T["+str(i*101)+"+k+60]=sub19.result["+str(i*101)+"+k+60];"
print "}"

print "for(k=26;k<=30;k++){"
for i in xrange(2,22):
    print "	T["+str(i*101)+"+k]=sub20.result["+str(i*101)+"+k];"
for i in xrange(22,42):
    print "	T["+str(i*101)+"+k]=sub21.result["+str(i*101)+"+k];"
for i in xrange(42,62):
    print "	T["+str(i*101)+"+k]=sub22.result["+str(i*101)+"+k];"
for i in xrange(62,82):
    print "	T["+str(i*101)+"+k]=sub23.result["+str(i*101)+"+k];"
for i in xrange(82,101):
    print "	T["+str(i*101)+"+k]=sub24.result["+str(i*101)+"+k];"
print "}"

