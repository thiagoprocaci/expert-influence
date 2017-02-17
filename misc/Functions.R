#functions
existsDiff <- function(x, y, title) {
  d1 <- as.numeric(x)
  d2 <- as.numeric(y)
  if(isGaussionDistribution(d1) == FALSE || isGaussionDistribution(d2) == FALSE || isGaussionDistribution(c(d1,d2)) == FALSE) {
    effectSize <- paste(round(vargha.delaney(d1,d2) * 100), sep = "", "%")
    pv <- wilcox.test(d1,d2)$p.value
    pvPrint <- ''
    valid <- FALSE
    if(is.nan(pv)) { 
      pvPrint  <- '-'
    }else if(pv < 0.001) {
      pvPrint<- '< 0,001'
    } else {
      pvPrint <- as.character(format(round(pv, digits = 4), nsmall = 4))
    }
    if(pv < 0.05) {
      valid = TRUE
    }
    print("--------------------------")
    print(pvPrint)
    print(effectSize)
    print(paste("Valid: ", valid))
    if(valid) {
      print(paste("There is difference ", title))
    } else {
      print(paste("Cannot say that there is difference ", title))
    }
    print("--------------------------")
  } else {
    print("--------------------------")
    print("Welch Test")
    pv <- t.test(d1,d2)$p.value
    # print(t.test(d1, d2));
    pvPrint <- ''
    valid <- FALSE
    if(is.nan(pv)) { 
      pvPrint  <- '-'
    }else if(pv < 0.001) {
      pvPrint<- '< 0,001'
    } else {
      pvPrint <- as.character(format(round(pv, digits = 4), nsmall = 4))
    }
    if(pv < 0.05) {
      valid = TRUE
    }
    print(pvPrint)
    print(paste("Valid: ", valid))
    d = cohenD(d1, d2)
    #Cohen, J. (1992), “A Power Primer”, Psychological Bulletin, 112, pp. 155-159
    interpretationEffectSize = "None"
    if(d >  0.20) {
      interpretationEffectSize = "small diff"
    }
    if(d >  0.50) {
      interpretationEffectSize = "medium diff"
    }
    if(d > 0.80) {
      interpretationEffectSize = "great diff"
    }
    print(interpretationEffectSize)
    if(valid) {
      print(paste("There is difference ", title))
    } else {
      print(paste("Cannot say that there is difference ", title))
    }
    if(mean(d1) > mean(d2)) {
      print("Effect size in favor d1")
    } else {
      print("Effect size in favor d2")      
    }
    print("--------------------------")
  }
  
  
}


cohenD <- function(data1, data2) {
  n1 <- length(data1);
  n2 <- length(data2);
  mean1 <- mean(data1);
  mean2 <- mean(data2);
  sd1 <- sd(data1);
  sd2 <- sd(data2);
  s <- sqrt(((n1 - 1) * sd1 * sd1 + (n2 - 1) * sd2 * sd2) / (n1 + n2 - 2));
  abs(mean1 - mean2) / s;
}

# Vargha & Delaney's A12
vargha.delaney <- function(r1, r2) {
  m <- length(r1);
  n <- length(r2);
  return ((sum(rank(c(r1, r2))[seq_along(r1)]) / m - (m + 1) / 2) / n);
}

isGaussionDistribution <- function(distribution) {
  
  #Kolmogorov-Smirnov test
  ks1 <- ks.test(distribution, "pnorm", mean=mean(distribution), sd=sd(distribution))
  if(ks1$p.value < 0.05){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

correlation <- function(data1, data2, title) {
  #Kolmogorov-Smirnov test
  ks1 <- ks.test(data1, "pnorm", mean=mean(data1), sd=sd(data1))
  ks2 <-  ks.test(data2, "pnorm", mean=mean(data2), sd=sd(data2))
  if(isGaussionDistribution(data1) && isGaussionDistribution(data2)) {
    #gaussion distribution
    correlationMethod(data1, data2, title, "pearson")
  } else {
    correlationMethod(data1, data2, title, "spearman")
  }
}

correlationMethod <- function(data1, data2, title, method) {
  print("--------------------------")
  print(paste("Method: ", method, " - " , title))
  correl <- round(as.numeric(cor(data1, data2, method = method)), digits = 4)
  pvalue <- as.numeric(cor.test(data1, data2, method = method)$p.value)
  valid <- FALSE
  pvaluePrint <- as.character(pvalue)
  
  if(pvalue < 0.05) {
    valid = TRUE
  }
  if(pvalue < 0.001) {
    pvaluePrint <- as.character("< 0.001")
  }
    
  #interpretation described at https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3576830/
  interpretation <- "insignificant"
  if (correl > 0.3 ){
    interpretation <- "weak"
  }
  if(correl > 0.5) {
    interpretation <- "moderate"
  }
  if(correl > 0.7) {
    interpretation <- "strong"
  }
  
  print(correl)
  print(pvaluePrint)
  print(paste("correl valid: ", as.character(valid)))
  print(interpretation)
  print("--------------------------")
}

