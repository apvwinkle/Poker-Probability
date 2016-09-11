#Four of a Kind Probabilities 

N=choose(52,5)
#The probability of 1,2,3 or 4 cards needed for the four of a kind 

#P(Xi=4)
p4=choose(13,1)*choose(4,4)*choose(48,1)/N
p3=choose(13,1)*choose(4,3)*choose(12,1)*choose(4,1)*choose(11,1)*choose(4,1)/(factorial(2)*N)
p2=choose(13,1)*choose(4,2)*choose(12,1)*choose(4,1)*choose(11,1)*choose(4,1)*choose(10,1)*choose(4,1)/(factorial(3)*N)
p1=choose(13,5)*choose(4,1)^5/N
p0=0

#The other options are two pairs or a full house. Those have to be included in the options to get the sum equal to one
ptwopairs=choose(13,1)*choose(4,2)*choose(12,1)*choose(4,2)*choose(11,1)*choose(4,1)/factorial(2)/N
pfullhouse=choose(13,1)*choose(4,3)*choose(12,1)*choose(4,2)/factorial(2)/N

sum=p4+p3+p2+p1+p0+ptwopairs+pfullhouse
sum

#P(X2=4|X1=x)
p4g4=1
p4g3=choose(1,1)*choose(46,1)/choose(47,2)
p4g2=choose(2,2)*choose(45,1)/choose(47,3)
p4g1=choose(3,3)*choose(44,1)/choose(47,4)
#P(X2=4 and X1=x)
p4a4=p4g4*p4
p4a3=p4g3*p3
p4a2=p4g2*p2
p4a1=p4g1*p1

p4ax=p4a4+p4a3+p4a2+p4a1
