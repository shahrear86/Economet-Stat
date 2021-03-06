created by: shahrear
student.eco86@gmail.com
(c) Md. Shahrear Zaman

#############################################################
Reference:
1 . Applied Macroeconometrics
    by Carlo A. Favero
    
2 . New Introduction to Multiple Time Series Analysis
    by Helmut Lütkephol

3 . Time Series Analysis
    by James D. Hamilton 
    
4 . Econometric Analysis
    by William H. Greene

5 . VAR, SVAR and SVEC Models: Implementation
    Within R Package vars 
    by Bernhard Pfaff   
#############################################################


..........read the data
data
attach(data)
names(data)
A <- Agriculture
I <- Industry..Mining.and.Quarrying
C <- Constructions
P <- Power..Gas.Water...Sanitary.Services
T <- Transport..Storage.and.Communication
G <- GDP.at.Market.Prices......1.to.10.

AL1 <- A
IL1 <- I
CL1 <- C
PL1 <- P
TL1 <- T
GL1 <- G

AL2 <- A
IL2 <- I
CL2 <- C
PL2 <- P
TL2 <- T
GL2 <- G

Y <- cbind(A,I,C,P,T,G)
X <- cbind(A,I,C,P,T,G)
XL1 <- cbind(AL1,IL1,CL1,PL1,TL1,GL1)
XL2 <- cbind(AL2,IL2,CL2,PL2,TL2,GL2)
n <- nrow(Y)

#lag = 2
#X[1:n-lag]

lag1 = 1
lag2 = 2
#X1=X1[1:n-lag1,]
#X1=X1[1:(n-lag1),]

lagadj1 = n-lag1
lagadj2 = n-lag2
X1=XL1[1:lagadj1,]
X2=XL2[1:lagadj2,]

# you can continue the process by increasing the lag order, depending on # the length of the observations
 
n1 = nrow(X1)
n2 = nrow(X2)
diff = n1 - n2
n11 = 1 + diff
X1 = X1[n11:n1,]
Xbind1 = cbind(X1,X2)
nl = nrow(Xbind1) 

diff2 = n - nl 
n12   = 1 + diff2  
Y = Y[n12:n,]
b = solve(t(Xbind1)%*%Xbind1,t(Xbind1)%*%Y) 
#############################################
r1=nrow(Xbind1)
c1=ncol(X)
I1=Xbind1[1:r1,1:c1]
c11=ncol(Xbind1)
c1=c1+1
I2=Xbind1[1:r1,c1:c11]
I10 = matrix(0,nrow(I1),ncol(I1))

I11=cbind(I1,I10)
I22=cbind(I10,I2)

Xbind2=rbind(Xbind1,I11,I22)
Y2=rbind(Y,I1,I2)

b1 = solve(t(Xbind2)%*%Xbind2,t(Xbind2)%*%Y2)
 

# mistakes could be possible..still developing...

