function [melhoresFitness1, melhoresFitness2, melhoresFitness3] = maioresFitness(fitnessIndividuos)

%%Verificando qual o melhor valor de fitness dos individuos que foram
%%gerados
 melhorFitness = max(fitnessIndividuos);
 
 %%encontrando a posicao dos melhor individuo no vetor
 for i=1:size(fitnessIndividuos,2)
    if(fitnessIndividuos(1,i) == melhorFitness)
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
    if(fitnessIndividuos(1,i) == melhorFitness1)
        fitnessMelhor_Filho2 = i; 
        break;
    end
 end
 
 %Enviando saidas
 melhoresFitness1 = fitnessMelhor_Filho1; 
 melhoresFitness2 = fitnessMelhor_Filho2;
 melhoresFitness3 = melhorFitness;
end
 