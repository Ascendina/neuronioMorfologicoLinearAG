function avaliacaoPopulacao = fitnessPopulacao(entrada,populacao,saidaDesejada)

avaliacaoPopulacao = ones(1,size(populacao,1));

%%Fazendo a avaliacao da papulacao para uma saida
for i=1:size(populacao,1)
    avaliacaoPopulacao(1,i) = fitnessIndividuo (entrada, individuo, saidaDesejada);
end

end