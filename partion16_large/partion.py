print "for(k=1;k<=8;k++){"
for i in xrange(1,10):
    print "	sub00.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub00.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(8,17):
    print "	sub01.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub01.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(15,24):
    print "	sub02.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub02.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(22,32):
    print "	sub03.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub03.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"

for i in xrange(1,10):
    print "	sub04.U["+str(i*31)+"+k+7]=U["+str(i*31)+"+k+7];"
    print "	sub04.V["+str(i*31)+"+k+7]=V["+str(31*i)+"+k+7];"
for i in xrange(8,17):
    print "	sub05.U["+str(i*31)+"+k+7]=U["+str(31*i)+"+k+7];"
    print "	sub05.V["+str(i*31)+"+k+7]=V["+str(31*i)+"+k+7];"
for i in xrange(15,23):
    print "	sub06.U["+str(i*31)+"+k+7]=U["+str(31*i)+"+k+7];"
    print "	sub06.V["+str(i*31)+"+k+7]=V["+str(31*i)+"+k+7];"
for i in xrange(22,32):
    print "	sub07.U["+str(i*31)+"+k+7]=U["+str(31*i)+"+k+7];"
    print "	sub07.V["+str(i*31)+"+k+7]=V["+str(31*i)+"+k+7];"

for i in xrange(1,10):
    print "	sub08.U["+str(i*31)+"+k+14]=U["+str(31*i)+"+k+14];"
    print "	sub08.V["+str(i*31)+"+k+14]=V["+str(31*i)+"+k+14];"
for i in xrange(8,17):
    print "	sub09.U["+str(i*31)+"+k+14]=U["+str(i*31)+"+k+14];"
    print "	sub09.V["+str(i*31)+"+k+14]=V["+str(31*i)+"+k+14];"
for i in xrange(15,24):
    print "	sub10.U["+str(i*31)+"+k+14]=U["+str(31*i)+"+k+14];"
    print "	sub10.V["+str(i*31)+"+k+14]=V["+str(31*i)+"+k+14];"
for i in xrange(22,32):
    print "	sub11.V["+str(i*31)+"+k+14]=V["+str(31*i)+"+k+14];"
    print "	sub11.U["+str(i*31)+"+k+14]=U["+str(31*i)+"+k+14];"
print "}"

print "for(k=22;k<=31;k++){"
for i in xrange(1,10):
    print "	sub12.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub12.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(8,17):
    print "	sub13.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub13.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(15,23):
    print "	sub14.U["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
    print "	sub14.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(22,32):
    print "	sub15.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub15.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"

print "}"

