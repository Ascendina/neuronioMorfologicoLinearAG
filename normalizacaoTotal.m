function normalizado = normalizacaoTotal(serie)


valorMin = min(serie);
valorMax = max(serie);

normalizado = (serie - valorMin) / (valorMax - valorMin);



end