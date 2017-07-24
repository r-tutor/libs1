#include <Rcpp.h>

using namespace Rcpp;

//C
//C-----------------------------------------------------------------------
// [[Rcpp::export]]
NumericVector wqm_points(NumericVector q, NumericVector p,
                         NumericVector prob, NumericVector sd,
                         int lsd, int m, NumericVector yplot,
                         NumericVector pplot, NumericVector sdplot,
                         int mplot)
{

  //C-----------------------------------------------------------------------
  //C     #
  //C*    #convert complete cdf estimate into plotting points
  //C     #modified feb 1989 by wqm to correct problems with cases
  //C     #with interval censoring in which intervals do not touch
  //C     #based on a continuous linear interpolation mapping
  //C     #between the extreme cases of right censored data
  //C     #and inspection data.
  //C     #
  mplot = 0;
  double delta;
  double denom;
  double sdnow;
  double pnow;
  double plast;
  double sdlast;
  for(int j = 0; j < m; j++) {
  sdnow = 0;
    //C
    //C     #do not plot anything if prob=0
    //C
    if (prob(j) <= 0) {
      continue;
    } 
    pnow = prob(j);
    if (lsd == 1) {
      sdnow = sd(j);
    }
    //C
    //C     #if j=1,  then we have left censored stuff and want to plot the prob
    //C
    if (j == 1) {
      goto statement_52;
    }
    delta = 1;
    denom = (p(j) - p(j - 1));
    if (denom <= 0) {
      goto statement_50;
    }
    //C
    //C     #otherwise, do an averaging  -- first find delta
    //C
    delta = ((q(j - 1) - p(j - 1)) / (denom)) / 2;
    statement_50:
    pnow = delta * prob(j - 1) + (1 - delta) * prob(j);
    sdnow = delta * sd(j - 1) + (1 - delta) * sd(j);
    //C
    //C     #check for plotting probability outside 0-1 interval
    //C
    statement_52:
    if ((pnow <= 0) || (pnow >= 1)) {
      continue;
    }
    //C
    //C     #everything ok for current point, add to the vector
    //C
    mplot = mplot + 1;
    yplot(mplot) = p(j);
    pplot(mplot) = pnow;
    sdplot(mplot) = sdnow;
    //C
    //C     #save current values for possible use in next jump point
    //C
    plast = prob(j);
    if (lsd == 1) {
      sdlast = sd(j);
    }
    
  } 
  return(yplot);
}


