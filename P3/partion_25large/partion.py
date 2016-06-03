print "for(k=1;k<=8;k++){"
for i in xrange(1,9):
    print "	sub00.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub00.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(7,15):
    print "	sub01.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub01.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(13,21):
    print "	sub02.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub02.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(19,27):
    print "	sub03.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub03.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(25,32):
    print "	sub04.U["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
    print "	sub04.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
#print "}"


#print "for(k=7;k<=14;k++){"
for i in xrange(1,9):
    print "	sub05.U["+str(i*31)+"+k+6]=U["+str(31*i)+"+k+6];"
    print "	sub05.V["+str(i*31)+"+k+6]=V["+str(31*i)+"+k+6];"
for i in xrange(7,15):
    print "	sub06.U["+str(i*31)+"+k+6]=U["+str(31*i)+"+k+6];"
    print "	sub06.V["+str(i*31)+"+k+6]=V["+str(31*i)+"+k+6];"
for i in xrange(13,21):
    print "	sub07.U["+str(i*31)+"+k+6]=U["+str(31*i)+"+k+6];"
    print "	sub07.V["+str(i*31)+"+k+6]=V["+str(31*i)+"+k+6];"
for i in xrange(19,27):
    print "	sub08.U["+str(i*31)+"+k+6]=U["+str(31*i)+"+k+6];"
    print "	sub08.V["+str(i*31)+"+k+6]=V["+str(31*i)+"+k+6];"
for i in xrange(25,32):
    print "	sub09.U["+str(i*31)+"+k+6]=U["+str(i*31)+"+k+6];"
    print "	sub09.V["+str(i*31)+"+k+6]=V["+str(31*i)+"+k+6];"
#print "}"

#print "for(k=13;k<=20;k++){"
for i in xrange(1,9):
    print "	sub10.U["+str(i*31)+"+k+12]=U["+str(31*i)+"+k+12];"
    print "	sub10.V["+str(i*31)+"+k+12]=V["+str(31*i)+"+k+12];"
for i in xrange(7,15):
    print "	sub11.V["+str(i*31)+"+k+12]=V["+str(31*i)+"+k+12];"
    print "	sub11.U["+str(i*31)+"+k+12]=U["+str(31*i)+"+k+12];"
for i in xrange(13,21):
    print "	sub12.U["+str(i*31)+"+k+12]=U["+str(31*i)+"+k+12];"
    print "	sub12.V["+str(i*31)+"+k+12]=V["+str(31*i)+"+k+12];"
for i in xrange(19,27):
    print "	sub13.U["+str(i*31)+"+k+12]=U["+str(31*i)+"+k+12];"
    print "	sub13.V["+str(i*31)+"+k+12]=V["+str(31*i)+"+k+12];"
for i in xrange(25,32):
    print "	sub14.U["+str(i*31)+"+k+12]=U["+str(i*31)+"+k+12];"
    print "	sub14.V["+str(i*31)+"+k+12]=V["+str(31*i)+"+k+12];"
#print "}"

#print "for(k=19;k<=26;k++){"
for i in xrange(1,9):
    print "	sub15.U["+str(i*31)+"+k+18]=U["+str(31*i)+"+k+18];"
    print "	sub15.V["+str(i*31)+"+k+18]=V["+str(31*i)+"+k+18];"
for i in xrange(7,15):
    print "	sub16.U["+str(i*31)+"+k+18]=U["+str(31*i)+"+k+18];"
    print "	sub16.V["+str(i*31)+"+k+18]=V["+str(31*i)+"+k+18];"
for i in xrange(13,21):
    print "	sub17.U["+str(i*31)+"+k+18]=U["+str(31*i)+"+k+18];"
    print "	sub17.V["+str(i*31)+"+k+18]=V["+str(31*i)+"+k+18];"
for i in xrange(19,27):
    print "	sub18.U["+str(i*31)+"+k+18]=U["+str(31*i)+"+k+18];"
    print "	sub18.V["+str(i*31)+"+k+18]=V["+str(31*i)+"+k+18];"
for i in xrange(25,32):
    print "	sub19.U["+str(i*31)+"+k+18]=U["+str(i*31)+"+k+18];"
    print "	sub19.V["+str(i*31)+"+k+18]=V["+str(31*i)+"+k+18];"
print "}"

print "for(k=25;k<=31;k++){"
for i in xrange(1,9):
    print "	sub20.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub20.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(7,15):
    print "	sub21.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub21.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(13,21):
    print "	sub22.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub22.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(19,27):
    print "	sub23.U["+str(i*31)+"+k]=U["+str(31*i)+"+k];"
    print "	sub23.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
for i in xrange(25,32):
    print "	sub24.U["+str(i*31)+"+k]=U["+str(i*31)+"+k];"
    print "	sub24.V["+str(i*31)+"+k]=V["+str(31*i)+"+k];"
print "}"

