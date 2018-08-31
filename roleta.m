function escolhidoRoleta = roleta(vetorFitnessIndividuos)

%%Soma de todos os fitnesses da populacao
somaFitnessTotal = sum(vetorFitnessIndividuos);

%% vetor em porcentagem 
vetorPorcentagemIndividuos = vetorFitnessIndividuos / somaFitnessTotal;

%%Inicializando vetor
vetorIntervalo(1) = vetorPorcentagemIndividuos(1);

%%passando de porcentagem para intervalo de valores
for i=2:size(vetorPorcentagemIndividuos,2)
    vetorIntervalo(i) = vetorPorcentagemIndividuos(i) + vetorIntervalo(i-1); 
end

%%gerando numero aleatorio entre 0 e 1
valorRoleta = rand();

i = 1;
while(valorRoleta > vetorIntervalo(i) && i < size(vetorPorcentagemIndividuos,2))
   i = i + 1; 
end

escolhidoRoleta = i;

end