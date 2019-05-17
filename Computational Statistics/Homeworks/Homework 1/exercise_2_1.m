
function[cdfExp] = expProb(lambda, prob)
y = quad(@(x)exppdf(x,1/lambda) , 0, prob)