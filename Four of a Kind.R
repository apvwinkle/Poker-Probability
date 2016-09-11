#Four of a Kind Probabilities 

N=choose(52,5)

#After the draw
#P(Xi=4)
Pxi4=choose(13,1)*choose(4,4)*choose(48,1)/N
Pxi3=choose(13,1)*choose(4,3)*choose(12,1)*choose(4,1)*choose(11,1)*choose(4,1)/(factorial(2)*N)
Pxi2=choose(13,1)*choose(4,2)*choose(12,1)*choose(4,1)*choose(11,1)*choose(4,1)*choose(10,1)*choose(4,1)/(factorial(3)*N)
Pxi1=choose(13,5)*choose(4,1)^5/N
Pxi0=0

sum=Pxi4+Pxi3+Pxi2+Pxi1+Pxi0
sum