#### 

shannon = function(x){
  v = x[!is.na(x)]
  v = v[v != 0]
  v = v/sum(v)
  return(-sum(v*log(v, base = exp(1))))
}

simpson = function(x){
  v = x[!is.na(x)]
  v = v/sum(v)
  return(sum(v*v))
}

diversidade = function(x, indice){
  if(indice == 'shannon'){
    return(apply(x,2,shannon))
  }else if(indice == 'simpson'){
    return(apply(x,2,simpson)) 
  }else{
    print('erro')
  }
}