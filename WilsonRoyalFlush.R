N = choose(52,5)
pY5 = 4*choose(5,5)*choose(47,0)/N
pY4 = 4*choose(5,4)*choose(47,1)/N
pY3 = 4*choose(5,3)*choose(47,2)/N
pY2 = 4*choose(5,2)*(choose(32,3) + choose(32,2)*choose(15,1) + choose(32,1)*3*choose(5,2)/2 + choose(32,1)*choose(15,1)*choose(10,1)/2 + choose(15,1)*choose(10,1)*choose(5,1)/factorial(3))/N
pY1 = 4*choose(5,1)*(choose(32,4) + choose(32,3)*choose(15,1)/2 + choose(32,2)*choose(15,1)*choose(10,1)/factorial(3) + choose(32,1)*choose(15,1)*choose(10,1)*choose(5,1)/factorial(4))/N
pY0 = choose(32,5)/N

pY = c(pY0=pY0,pY1=pY1,pY2=pY2,pY3=pY3,pY4=pY4,pY5=pY5)

round(pY,6)
pY0      
pY2      
pY3      
pY4      
pY5 
sum(pY)

#That said, I am very close (within 0.003 of having P(Y)'s sum to 1), but not exact, yet (run scripts below).  Here are the primary principles to get these:
#1. *choose(47,3) or choose(47,4) is wrong because the 47 includes royal flush cards from the other suits.
#2. The choose(32,i) is the non-royal flush cards.
#3. I need to make mutually exclusive and jointly exhaustive cases: non-royal flush (RF) cards, non-RF cards+RF cards, but not enough RF cards to go over.
#4. When duplicated types are present, a divisor is needed to remove the multiple cases.
