function individuoMutado = mutacao(individuo, tamanhoEntrada)

%para a arquitetura com 4 neuronios na camada de oculta e 1 neuronio na
%camada de saida, temos 40 genes (8 genes para cada camada). Desta forma,
%os genes:
%1,2,3,4,5,9,10,11,12,13,17,18,19,20,21,25,26,27,28,29,33,34,35,36,37
%possuem o tamanho da entrada, já os genes:
%6,7,8,14,15,16,22,23,24,30,31,31,38,39,40 possuem tamanho unitario

elementosUnitarios = [6,7,8,14,15,16,22,23,24,30,31,31,38,39,40];
bias = [6,14,22,30,38];

for i = 1:40
    indicadorMutacao = realizaMutacao();
    
    if(indicadorMutacao == 1)
        %%Elementos nao unitarios
        if(i ~= elementosUnitarios)
            peso = randInterval (-1, 1, 1, tamanhoEntrada);
        %%Elementos unitarios
        else 
            %elementos que podem variar de 0 ate 1
           if(i ~= bias)
               peso = randInterval (0, 1, 1, 1);
            %elementos que podem variar de -1 ate 1   
           else
               peso = randInterval (-1, 1, 1, 1);
           end
        end  
        
        individuo(i) = peso;
    end
    
end








end