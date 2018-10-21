function fitnessIndividuoTotal = fitnesseTotal(individuo, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, arquivo)

MSEIndividuo = 0;

%%Calculo do erro
for i=1:quantidadeEntradas
    MSEIndividuo = MSEIndividuo + erroIndividuo (entrada(i:(i+(tamanhoEntrada-1))), individuo, entrada(i+tamanhoEntrada), conexoesCamadaSaida, arquivo);
end

%calculo do fitness
fitnessIndividuoTotal = 1 / (1 + MSEIndividuo);


end