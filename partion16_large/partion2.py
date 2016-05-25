print "for(k=1;k<=9;k++){"
for i in xrange(1,10):
    print "	sub00.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(8,17):
    print "	sub01.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(15,24):
    print "	sub02.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(22,32):
    print "	sub03.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"

for i in xrange(1,10):
    print "	sub04.T["+str(i*31)+"+k+7]=T["+str(i*31)+"+7];"
for i in xrange(8,17):
    print "	sub05.T["+str(i*31)+"+k+7]=T["+str(i*31)+"+k+7];"
for i in xrange(15,24):
    print "	sub06.T["+str(i*31)+"+k+7]=T["+str(i*31)+"+k+7];"
for i in xrange(22,32):
    print "	sub07.T["+str(i*31)+"+k+7]=T["+str(i*31)+"+k+7];"

for i in xrange(1,10):
    print "	sub08.T["+str(i*31)+"+k+14]=T["+str(i*31)+"+k+14];"
for i in xrange(8,17):
    print "	sub09.T["+str(i*31)+"+k+14]=T["+str(i*31)+"+k+14];"
for i in xrange(15,24):
    print "	sub10.T["+str(i*31)+"+k+14]=T["+str(i*31)+"+k+14];"
for i in xrange(22,32):
    print "	sub11.T["+str(i*31)+"+k+14]=T["+str(i*31)+"+k+14];"
print "}"

print "for(k=22;k<=31;k++){"
for i in xrange(1,10):
    print "	sub12.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(8,17):
    print "	sub13.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(15,24):
    print "	sub14.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
for i in xrange(22,32):
    print "	sub15.T["+str(i*31)+"+k]=T["+str(i*31)+"+k];"
print "}"
