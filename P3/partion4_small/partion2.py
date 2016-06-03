print "for(k=1;k<=6;k++){"
for i in xrange(1,7):
    print "	sub00.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(5,12):
    print "	sub01.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
print "}"

print "for(k=5;k<=11;k++){"
for i in xrange(1,7):
    print "	sub02.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
for i in xrange(5,12):
    print "	sub03.T["+str(i*11)+"+k]=T["+str(i*11)+"+k];"
print "}"
