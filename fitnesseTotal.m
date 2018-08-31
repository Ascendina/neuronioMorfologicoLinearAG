function fitnessIndividuoTotal = fitnesseTotal(individuo, quantidadeEntradas, entrada, saidaDesejada)

%%Calculo do erro
for i=1:quantidadeEntradas
    MSEIndividuo = MSEIndividuo + erroIndividuo (entrada(i), individuo, saidaDesejada(i));
end

%calculo do fitness
fitnessIndividuoTotal = 1 / (1 + MSEIndividuo);


end