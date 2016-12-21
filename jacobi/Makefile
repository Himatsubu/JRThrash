all:
	gcc -o jacobi_c Jacobi.c -lm
	gfortran -o jacobi_f jacobi.f90
	javac Jacobi.java

jacobi_c:
	gcc -o jacobi_c Jacobi.c -lm

jacobi_f: jacobi.f90
	gfortran -o jacobi_f jacobi.f90

jacobi_j:
	javac Jacobi.java

JRT:
	java -jar /home/yanai/JRThrash/JRThrash.jar Jacobi.java
