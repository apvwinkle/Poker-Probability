N = choose(52,5)

#P(X1 = x)
proby5 = 4*9*choose(5,5)*choose(47,0)/N
proby4 = 4*9*choose(5,4)*(choose(7,1)+choose(39,1))/N
proby3 = 4*9*choose(5,3)*(choose(3,2) + 3*choose(8,2) + 3*choose(13,1)*2*choose(13,1)/2)/N
proby2 = 4*9*choose(5,2)*(choose(2,2)*3*choose(13,1) + choose(2,1)*3*choose(2,2) + choose(2,1)*3*choose(13,1)*2*choose(13,1)/2 + 3*choose(2,2)*2*choose(13,1) + 3*choose(13,1)*2*choose(13,1)*1*choose(13,1)/6)/N 
proby1 = 4*9*choose(5,1)*((choose(2,2)*3*choose(2,2) + choose(2,2)*3*choose(13,1)*2*choose(13,1)/2 + choose(2,1)*3*choose(2,2)*2*choose(13,1) + (choose(2,1)*3*2*choose(13,1)^3)/6 + 3*choose(2,2)*2*choose(2,2)/2 + (3*choose(2,2)*2*choose(13,1)^2)/2))/N
proby0 = 0 #Impossible to have at least 1 card that can't be part of any straight flush
  
sum=proby5+proby4+proby3+proby2+proby1
sum

#Conditional probability
#In a real game of cards, these probabilities would be dependent on which card you are missing.
#You can one missing from the middle of the straight, or if you have consecutive numbers it could be
#either the number above or below the one you have. I am going to assume there is only one possible card
#that can complete each straight (rather than both a card above and below. If it is the card below, then 
#this would be classified as a different straight.)

#P(X2=5|X1=x)
p5g5 = 1
p5g4 = choose(1,1)/choose(47,1)
p5g3 = choose(2,2)/choose(47,2)
p5g2 = choose(3,3)/choose(47,3)
p5g1 = choose(4,4)/choose(47,4)
p5g0 = 1.385*10^-5

#P(X2=5 and X1=x)
p5a5 = p5g5*proby5
p5a4 = p5g4*proby4
p5a3 = p5g3*proby3
p5a2 = p5g2*proby2
p5a1 = p5g1*proby1
p5a0 = p5g0*proby0

afterdiscard = p5a5 + p5a4 + p5a3 + p5a2 + p5a1 + p5a0