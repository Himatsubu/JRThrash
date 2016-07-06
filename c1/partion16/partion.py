print "for(k=1;k<=6;k++){"
for i in xrange(1,7):
    print "	sub00.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(5,12):
    print "	sub01.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(10,17):
    print "	sub02.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(15,22):
    print "	sub03.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"

print "for(k=5;k<=11;k++){"
for i in xrange(1,7):
    print "	sub04.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(5,12):
    print "	sub05.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(10,17):
    print "	sub06.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"
for i in xrange(15,22):
    print "	sub07.u["+str(i*21)+"+k]=u["+str(21*i)+"+k];"

for i in xrange(1,7):
    print "	sub08.u["+str(i*21)+"+k+5]=u["+str(21*i)+"+k+5];"
for i in xrange(5,12):
    print "	sub09.u["+str(i*21)+"+k+5]=u["+str(21*i)+"+k+5];"
for i in xrange(10,17):
    print "	sub10.u["+str(i*21)+"+k+5]=u["+str(21*i)+"+k+5];"
for i in xrange(15,22):
    print "	sub11.u["+str(i*21)+"+k+5]=u["+str(21*i)+"+k+5];"

for i in xrange(1,7):
    print "	sub12.u["+str(i*21)+"+k+10]=u["+str(21*i)+"+k+10];"
for i in xrange(5,12):
    print "	sub13.u["+str(i*21)+"+k+10]=u["+str(21*i)+"+k+10];"
for i in xrange(10,17):
    print "	sub14.u["+str(i*21)+"+k+10]=u["+str(21*i)+"+k+10];"
for i in xrange(15,22):
    print "	sub15.u["+str(i*21)+"+k+10]=u["+str(21*i)+"+k+10];"
print "}"

