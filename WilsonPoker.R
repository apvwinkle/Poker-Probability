##### Poker Scripts
############################################################################

############################################################################
##### Royal Flush###########################################################
############################################################################
### Global Variables
library(prob)
deck = cards()
face = c("A","K","Q","J","10")
indices = 1:52

Check.RF = function(hand1=NULL) {
#Check.RF generates a fresh hand, or receives a hand, and check whether it
#is a RF or not.
#'out' is a list eith 3 objects:
#  'RF' is a TRUE or FALSE, whether the hand is an RF
#  'hand1' is the hand under consideration
#  'inds[1:5] is 5 randomly generated indices, without replacement
if (is.null(hand1)==TRUE) {
  inds = sample(indices, 10, replace=FALSE)  #Sample 10 cards w/o replacement, for now and later
  hand1 = deck[inds[6:10],]                  #Create hand
}#end if
  matches = is.element(hand1$rank,face)      #Flag only 'face' cards
  if (sum(matches)==5 & max(table(hand1$suit))==5) RF=TRUE else (RF=FALSE) #Check for RF
  out = list(RF,hand1,inds[1:5])             #Return results
  return(out)
}#end function

Draw.RF = function(hand1, inds) {
#Draw.RF receives a poker hand and simulates a draw, holding for RF
#'hand1' is the initial hand dealt (from Check.RF)
#'inds' is the w/o replacement indices passed, for use in drawing
#'hand3' is the replenished hand, after drawing 
  matches = is.element(hand1$rank,face)      #Matches are indices with face cards
  table.of.suits=table(hand1$suit[matches])
  suit.to.keep=names(which(table.of.suits==max(table.of.suits)))[1]
  hand2 = hand1[hand1$suit==suit.to.keep,]   #Create hand2, the held cards
  num.cards.in.hand2 = dim(hand2)[1]
  hand3 = rbind(hand2, deck[inds[1:(5-num.cards.in.hand2)],]) #Create hand3, after discard and refill
  return(hand3)
}#end function

Simulation.RF = function(nsims) {
#Simulation.RF simulates multiple poker hands, holding for RF
t.start = Sys.time()
res = matrix(NA, nrow=nsims,ncol=1)
num.of.RFs=0
for (i in 1:nsims) {
  x=Check.RF()               #Check initial hand for RF
  x=Draw.RF(x[[2]],x[[3]])   #Discard & refill
  x=Check.RF(x)              #Check again
  num.of.RFs = num.of.RFs+x[[1]] #Count
}#end for
print(paste("Sum = ", num.of.RFs, "out of", nsims))
print(paste("Proportion = ", num.of.RFs/nsims))
t.end = Sys.time()
print(t.end-t.start)
return(num.of.RFs)
}#end function

Simulation.RF(10000)

###Other Notes
#library(mosaic)
#Cards #gives as a categorical list