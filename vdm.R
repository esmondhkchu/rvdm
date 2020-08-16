setwd('../vdm_package/rvdm/')

data = data.frame(color = c('w','r','b','r','r','w'),
                  cartype = c('v','s','s','se','se','v'))


append_table = function (x, y, i) {
  subset = y[x == i]
  proba = sapply(sort(unique(y)), function (j) sum(subset == j) / length(subset))
  return(proba)
}

# get vdm probabilities for a single dimension
vdm_proba_single = function(x, y) {
  proba = lapply(unique(x), function (i) append_table(x, y, i))
  names(proba) = unique(x)
  return(proba)
  }

# get delta
vdm_delta_single = function(proba, val_1, val_2, norm=2) {
  delta = sum(abs(proba[[val_1]] - proba[[val_2]])^norm)
  return(delta)
}

# nd proba
vdm_proba = function(data, y) {
  
  if (dim(data)[2] == 2) {
    print('yo')
    x = data[, colnames(data) != y]
    y_ = data$y
    proba = vdm_proba_single(x, y)
    return(proba)
  }
  
  else {
    X = data[, colnames(data) != y]
    proba = lapply(colnames(X), function (i) vdm_proba_single(X[,i], data[,y]))
    return(proba)
  }
}

# nd delta
vdm_delta = function(proba, ins_1, ins_2, norm=2) {
  delta_dim = sapply(1:length(proba), function (i) sum(abs(proba[[i]][[ins_1[i]]] - proba[[i]][[ins_2[i]]])^norm))
  delta = sum(vdm_dim)^(1/norm)
  return(delta)
}

#############
data = read.csv('../data.csv')

proba = vdm_proba(data, 'cartype')


vdm_proba_single(data[,1], data$cartype)

vdm_delta(proba, c('0','1'), c('1','7'))



