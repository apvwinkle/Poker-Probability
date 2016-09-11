# X ~ four of a kind

# Global Variables
library(prob)
deck = cards()
indices = 1:52


Check.F7 = function(hand1=NULL) 
{  
#Check.F7 generates a fresh hand, or receives a hand, and checks whether it
#is a four of a kind or not.
#'out' is a list with 3 objects:
#  'F7' is a TRUE or FALSE, whether the hand is a four of a kind with 7's
#  'hand1' is the hand under consideration
#  'inds[1:5] is 5 randomly generated indices, without replacement
  
  #Create hand
  if (is.null(hand1)==TRUE) 
  {
    inds = sample(indices, 10, replace=FALSE)  #Sample 10 cards w/o replacement, for now and later
    hand1 = deck[inds[6:10],]
  }
  
  #Flag cards of specific rank
  matches2 = is.element(hand1$rank,"2")
  matches3 = is.element(hand1$rank,"3")
  matches4 = is.element(hand1$rank,"4")
  matches5 = is.element(hand1$rank,"5")
  matches6 = is.element(hand1$rank,"6")
  matches7 = is.element(hand1$rank,"7")
  matches8 = is.element(hand1$rank,"8")
  matches9 = is.element(hand1$rank,"9")
  matches10 = is.element(hand1$rank,"10")
  matchesJ = is.element(hand1$rank,"J")
  matchesQ = is.element(hand1$rank,"Q")
  matchesK = is.element(hand1$rank,"K")
  matchesA = is.element(hand1$rank,"A")
  
  #Sum the matches
  s2 = sum(matches2)
  s3 = sum(matches3)
  s4 = sum(matches4)
  s5 = sum(matches5)
  s6 = sum(matches6)
  s7 = sum(matches7)
  s8 = sum(matches8)
  s9 = sum(matches9)
  s10 = sum(matches10)
  sJ = sum(matchesJ)
  sQ = sum(matchesQ)
  sK = sum(matchesK)
  sA = sum(matchesA)
  
  allsums = c(sA, s2, s3, s4, s5, s6, s7, s8, s9, sJ, sQ, sK)
  
  #Check for Four of a kind
  a = max(allsums)
  
  if (a==4) 
    F7 = TRUE 
  else
    F7=FALSE
  
  #Return results
  out = list(F7,hand1,inds[1:5])
  return(out)
}#end function


Draw.F7 = function(hand1, inds) 
{
#Draw.F7 receives a poker hand and simulates a draw, holding for F7
#'hand1' is the initial hand dealt (from Check.F7)
#'inds' is the w/o replacement indices passed, for use in drawing
#'hand3' is the replenished hand, after drawing 

  #Redo matches
  matches2 = is.element(hand1$rank,"2")
  matches3 = is.element(hand1$rank,"3")
  matches4 = is.element(hand1$rank,"4")
  matches5 = is.element(hand1$rank,"5")
  matches6 = is.element(hand1$rank,"6")
  matches7 = is.element(hand1$rank,"7")
  matches8 = is.element(hand1$rank,"8")
  matches9 = is.element(hand1$rank,"9")
  matches10 = is.element(hand1$rank,"10")
  matchesJ = is.element(hand1$rank,"J")
  matchesQ = is.element(hand1$rank,"Q")
  matchesK = is.element(hand1$rank,"K")
  matchesA = is.element(hand1$rank,"A")
  
  #Sum the matches
  s2 = sum(matches2)
  s3 = sum(matches3)
  s4 = sum(matches4)
  s5 = sum(matches5)
  s6 = sum(matches6)
  s7 = sum(matches7)
  s8 = sum(matches8)
  s9 = sum(matches9)
  s10 = sum(matches10)
  sJ = sum(matchesJ)
  sQ = sum(matchesQ)
  sK = sum(matchesK)
  sA = sum(matchesA)
  
  allsums = c(sA, sK, sQ, sJ, s10, s9, s8, s7, s6, s5, s4, s3, s2)
  spot = which.max(allsums)
  
  if (spot == 1)
    num.to.keep = "A"
  else if (spot == 2)
    num.to.keep = "K"
  else if (spot == 3)
    num.to.keep = "Q"
  else if (spot == 4)
    num.to.keep = "J"
  else if (spot == 5)
    num.to.keep = "10"
  else if (spot == 6)
    num.to.keep = "9"
  else if (spot == 7)
    num.to.keep = "8"
  else if (spot == 8)
    num.to.keep = "7"
  else if (spot == 9)
    num.to.keep = "6"
  else if (spot == 10)
    num.to.keep = "5"
  else if (spot == 11)
    num.to.keep = "4"
  else if (spot == 12)
    num.to.keep = "3"
  else if (spot == 13)
    num.to.keep = "2"
  
  #number.to.keep =
  
  #table.of.suits=table(hand1$suit[matches])
  #suit.to.keep=names(which(table.of.suits==max(table.of.suits)))[1]
  hand2 = hand1[hand1$rank==num.to.keep,]   #Create hand2, the held cards
  num.cards.in.hand2 = dim(hand2)[1]
  hand3 = rbind(hand2, deck[inds[1:(5-num.cards.in.hand2)],]) #Create hand3, after discard and refill
  
  return(hand3)
}#end function

Simulation.F7 = function(nsims) 
{
#Simulation.F7 simulates multiple poker hands, holding for F7

  #Set up initial values
  t.start = Sys.time()
  res = matrix(NA, nrow=nsims,ncol=1)
  num.of.F7s=0

  for (i in 1:nsims) 
  {
    x=Check.F7()               #Check initial hand for F7
    x=Draw.F7(x[[2]],x[[3]])   #Discard & refill
    x=Check.F7(x)              #Check again
    num.of.F7s = num.of.F7s+x[[1]] #Count
  }#end for
print(paste("Sum = ", num.of.F7s, "out of", nsims))
print(paste("Proportion = ", num.of.F7s/nsims))
t.end = Sys.time()
print(t.end-t.start)

return(num.of.F7s)
}#end function

Simulation.F7(100000)

###Other Notes
#library(mosaic)
#Cards #gives as a categorical list