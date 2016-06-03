print "for(k=1;k<=3;k++){"
for i in xrange(1,4):
    print "	sub00.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub00.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(2,6):
    print "	sub01.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub01.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(4,8):
    print "	sub02.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub02.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(6,10):
    print "	sub03.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub03.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(8,12):
    print "	sub04.U["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
    print "	sub04.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
print "}"


print "for(k=2;k<=5;k++){"
for i in xrange(1,4):
    print "	sub05.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub05.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(2,6):
    print "	sub06.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub06.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(4,8):
    print "	sub07.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub07.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(6,10):
    print "	sub08.U["+str(i*11)+"+k]=U["+str(11*i)+"+k];"
    print "	sub08.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
for i in xrange(8,12):
    print "	sub09.U["+str(i*11)+"+k]=U["+str(i*11)+"+k];"
    print "	sub09.V["+str(i*11)+"+k]=V["+str(11*i)+"+k];"
#print "}"

#print "for(k=13;k<=20;k++){"
for i in xrange(1,4):
    print "	sub10.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
    print "	sub10.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
for i in xrange(2,6):
    print "	sub11.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
    print "	sub11.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
for i in xrange(4,8):
    print "	sub12.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
    print "	sub12.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
for i in xrange(6,10):
    print "	sub13.U["+str(i*11)+"+k+2]=U["+str(11*i)+"+k+2];"
    print "	sub13.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
for i in xrange(8,12):
    print "	sub14.U["+str(i*11)+"+k+2]=U["+str(i*11)+"+k+2];"
    print "	sub14.V["+str(i*11)+"+k+2]=V["+str(11*i)+"+k+2];"
#print "}"

#print "for(k=19;k<=26;k++){"
for i in xrange(1,4):
    print "	sub15.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
    print "	sub15.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(2,6):
    print "	sub16.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
    print "	sub16.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(4,8):
    print "	sub17.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
    print "	sub17.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(6,10):
    print "	sub18.U["+str(i*11)+"+k+4]=U["+str(11*i)+"+k+4];"
    print "	sub18.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
for i in xrange(8,12):
    print "	sub19.U["+str(i*11)+"+k+4]=U["+str(i*11)+"+k+4];"
    print "	sub19.V["+str(i*11)+"+k+4]=V["+str(11*i)+"+k+4];"
#print "}"

#print "for(k=25;k<=11;k++){"
for i in xrange(1,4):
    print "	sub20.U["+str(i*11)+"+k+6]=U["+str(11*i)+"+k+6];"
    print "	sub20.V["+str(i*11)+"+k+6]=V["+str(11*i)+"+k+6];"
for i in xrange(2,6):
    print "	sub21.U["+str(i*11)+"+k+6]=U["+str(11*i)+"+k+6];"
    print "	sub21.V["+str(i*11)+"+k+6]=V["+str(11*i)+"+k+6];"
for i in xrange(4,8):
    print "	sub22.U["+str(i*11)+"+k+6]=U["+str(11*i)+"+k+6];"
    print "	sub22.V["+str(i*11)+"+k+6]=V["+str(11*i)+"+k+6];"
for i in xrange(6,10):
    print "	sub23.U["+str(i*11)+"+k+6]=U["+str(11*i)+"+k+6];"
    print "	sub23.V["+str(i*11)+"+k+6]=V["+str(11*i)+"+k+6];"
for i in xrange(8,12):
    print "	sub24.U["+str(i*11)+"+k+6]=U["+str(i*11)+"+k+6];"
    print "	sub24.V["+str(i*11)+"+k+6]=V["+str(11*i)+"+k+6];"
print "}"

