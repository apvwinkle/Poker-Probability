N=choose(52,5)
proby5 = 4*9*choose(5,5)*choose(47,0)/N
proby4 = 4*9*choose(5,4)*choose(47,1)/N
proby3 = 4*9*choose(5,3)*choose(47,2)/N
proby2 = 4*9*choose(5,2)*choose(47,3)/N
proby1 = 4*9*choose(5,1)*choose(47,4)/N
proby0 = 4*9*choose(5,0)*choose(47,5)/N
sum=proby5+proby4+proby3+proby2+proby1+proby0
sum