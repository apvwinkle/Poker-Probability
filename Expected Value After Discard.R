#Expected Value of The Number of 7s in a given hand after the first discard
#X=Number of 7s
#X follows a hypergeometric distribution

#P(X1=X)
prob4=dhyper(4,4,48,5)
prob3=dhyper(3,4,48,5)
prob2=dhyper(2,4,48,5)
prob1=dhyper(1,4,48,5)
prob0=dhyper(0,4,48,5)

#P(X2=4|X1=x)
prob4g4=1
prob4g3=dhyper(1,1,46,2)
prob4g2=dhyper(2,2,45,3)
prob4g1=dhyper(3,3,44,4)
prob4g0=dhyper(4,4,43,5)

#P(X2=4 and X1=x)
prob4a4=prob4*prob4g4
prob4a3=prob4*prob4g3
prob4a2=prob4*prob4g2
prob4a1=prob4*prob4g1
prob4a0=prob4*prob4g0

prob4ax=prob4a4+prob4a3+prob4a2+prob4a1+prob4a0

#P(X2=3|X1=x)
prob3g3=dhyper(0,1,46,2)
prob3g2=dhyper(1,2,45,3)
prob3g1=dhyper(2,3,44,4)
prob3g0=dhyper(3,4,43,5)
#P(X2=3 and X1=x)
prob3a3=prob3*prob3g3
prob3a2=prob3*prob3g2
prob3a1=prob3*prob3g1
prob3a0=prob3*prob3g0

prob3ax=prob3a3+prob3a2+prob3a1+prob3a0

#P(X2=2|X1=x)
prob2g2=dhyper(0,2,45,3)
prob2g1=dhyper(1,3,44,4)
prob2g0=dhyper(2,4,42,5)
#P(X2=2 and X1=x)
prob2a2=prob2*prob2g2
prob2a1=prob2*prob2g1
prob2a0=prob2*prob2g0

prob2ax=prob2a2+prob2a1+prob2a0

#P(X2=1|X1=x)
prob1g1=dhyper(0,3,44,4)
prob1g0=dhyper(1,4,43,5)
#P(X2=1 and X1=x)
prob1a1=prob1*prob1g1
prob1a0=prob1*prob1g0

prob1ax=prob1a1+prob1a0


#P(X2=0|X1=x)
prob0g0=dhyper(0,4,43,5)
#P(X2=0 and X1=x)
prob0a0=prob0*prob0g0

prob0ax=prob0a0

##E(X) after the first discard
Eofx=4*prob4ax+3*prob3ax+2*prob2ax+1*prob1ax+0*prob0ax

Eofx2=4^2*prob4ax+3^2*prob3ax+2^2*prob2ax+1^1*prob1ax+0*prob0ax

##V(X) after the first discard
Vofx=Eofx2-(Eofx)^2