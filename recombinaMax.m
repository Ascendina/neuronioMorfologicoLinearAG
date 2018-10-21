function [recombinacao1,recombinacao2] = recombinaMax (vetor1, vetor2)

%%Se o numero de colunas dos vetores pais forem iguais,
%% Os calculos podem ser realizados

if (size(vetor1,2) == size(vetor2,2))
    pontoCorte = randInt(1, size(vetor1,2));
    
    %%Criando o vetor temporario
    vetorMaxPais = max(vetor1, vetor2); 
    
    %%Criando vetor filhos
    vetorfilho1 = [vetor1(1:pontoCorte),vetorMaxPais(pontoCorte+1:size(vetor1,2))];
    vetorfilho2 = [vetor2(1:pontoCorte),vetorMaxPais(pontoCorte+1:size(vetor2,2))];
    
    %%Reunindo filhos em uma matriz para ter saida unica
    recombinacao1 = vetorfilho1;
    recombinacao2 = vetorfilho2;
    %%antes era assim [vetorfilho1',vetorfilho2']';
    
else
    recombinacao1 = 0;
    recombinacao2 = 0;
end

end