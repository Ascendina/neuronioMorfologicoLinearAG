function melhoresFitness = maioresFitness(fitnessIndividuos)

%%Verificando qual o melhor valor de fitness dos individuos que foram
%%gerados
 melhorFitness = max(fitnessIndividuos);
 
 %%encontrando a posicao dos melhor individuo no vetor
 for i=1:size(fitnessIndividuos,2)
    if(fitnessIndividuo == melhorFitness)
        fitnessMelhor_Filho1 = i; 
        break;
    end
 end

 %%Removendo o melhor individuo da lista para escolher o segundo melhor
 %%individuo
 fitnessIndividuosTemp = fitnessIndividuos(fitnessIndividuos~= fitnessMelhor_Filho1);
 
 %%Escolhendo o segundo melhor individuo
 melhorFitness1 = max(fitnessIndividuosTemp);
 
 %%encontrando a posicao dos melhor individuo no vetor
 for i=1:size(fitnessIndividuos,2)
    if(fitnessIndividuo == melhorFitness1)
        fitnessMelhor_Filho2 = i; 
        break;
    end
 end
 
 
 melhoresFitness = [fitnessMelhor_Filho1, fitnessMelhor_Filho2, melhorFitness];
 
end
 