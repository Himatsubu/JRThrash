print "for(k=2;k<=4;k++){"
for i in xrange(2,5):
    print "	sub00.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(5,9):
    print "	sub01.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(9,13):
    print "	sub02.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(13,17):
    print "	sub03.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(17,21):
    print "	sub04.u["+str(i*21)+"+k]=result["+str(i*21)+"];"
print "}"

print "for(k=5;k<=8;k++){"
for i in xrange(2,5):
    print "	sub05.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(5,9):
    print "	sub06.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(9,13):
    print "	sub07.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(13,17):
    print "	sub08.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"
for i in xrange(17,21):
    print "	sub09.u["+str(i*21)+"+k]=result["+str(i*21)+"+k];"

for i in xrange(2,5):
    print "	sub10.u["+str(i*21)+"+k+4]=result["+str(i*21)+"+k+4];"
for i in xrange(5,9):
    print "	sub11.u["+str(i*21)+"+k+4]=result["+str(i*21)+"+k+4];"
for i in xrange(9,13):
    print "	sub12.u["+str(i*21)+"+k+4]=result["+str(i*21)+"+k+4];"
for i in xrange(13,17):
    print "	sub13.u["+str(i*21)+"+k+4]=result["+str(i*21)+"+k+4];"
for i in xrange(17,21):
    print "	sub14.u["+str(i*21)+"+k+4]=result["+str(i*21)+"+k+4];"

for i in xrange(2,5):
    print "	sub15.u["+str(i*21)+"+k+8]=result["+str(i*21)+"+k+8];"
for i in xrange(5,9):
    print "	sub16.u["+str(i*21)+"+k+8]=result["+str(i*21)+"+k+8];"
for i in xrange(9,13):
    print "	sub17.u["+str(i*21)+"+k+8]=result["+str(i*21)+"+k+8];"
for i in xrange(13,17):
    print "	sub18.u["+str(i*21)+"+k+8]=result["+str(i*21)+"+k+8];"
for i in xrange(17,21):
    print "	sub19.u["+str(i*21)+"+k+8]=result["+str(i*21)+"+k+8];"

for i in xrange(2,5):
    print "	sub20.u["+str(i*21)+"+k+12]=result["+str(i*21)+"+k+12];"
for i in xrange(5,9):
    print "	sub21.u["+str(i*21)+"+k+12]=result["+str(i*21)+"+k+12];"
for i in xrange(9,13):
    print "	sub22.u["+str(i*21)+"+k+12]=result["+str(i*21)+"+k+12];"
for i in xrange(13,17):
    print "	sub23.u["+str(i*21)+"+k+12]=result["+str(i*21)+"+k+12];"
for i in xrange(17,21):
    print "	sub24.u["+str(i*21)+"+k+12]=result["+str(i*21)+"+k+12];"
print "}"

