a1 = dhyper(4,4,48,5)
b1 = dhyper(3,4,48,5)
c1 = dhyper(2,4,48,5)
d1 = dhyper(1,4,48,5)
e1 = dhyper(0,4,48,5)
total1 = a1 + b1 + c1 + d1 + e1
E1 = 4*a1 + 3*b1 + 2*c1 + 1*d1 + 0*e1
Esq1 = (4^2)*a1 + (3^2)*b1 + (2^2)*c1 + d1 + 0*e1
V1 = Esq1 - E1^2

a2 = a1
b2 = dhyper(3,4,47,5)
c2 = dhyper(2,4,47,5)
d2 = dhyper(1,4,47,5)
e2 = dhyper(0,4,47,5)
total2 = a2 + b2 + c2 + d2 + e2
E2 = 4*a2 + 3*b2 + 2*c2 + 1*d2 + 0*e2
Esq2 = (4^2)*a2 + (3^2)*b2 + (2^2)*c2 + d2 + 0*e2
V2 = Esq2 - E2^2