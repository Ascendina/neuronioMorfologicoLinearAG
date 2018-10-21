function individuoMutado = mutacao(individuo, tamanhoEntrada, conexoesCamadaSaida)

%para a arquitetura com 4 neuronios na camada de oculta 
%%temos 40 genes (8 genes para cada camada). Desta forma,
%os genes:
%1,2,3,4,5,9,10,11,12,13,17,18,19,20,21,25,26,27,28,29 - tamanho entrada
%possuem o tamanho da entrada, 
%%1 neuronio na camada de saida possui entradas do tamanho da conexoes
%% da camada de saida, desta forma, os genes:
%%33,34,35,36,37 - possuem o tamanho conexoesCamadaSaida
%já os genes:
%6,7,8,14,15,16,22,23,24,30,31,32,38,39,40 possuem tamanho unitario

elementosSaida = [33,34,35,36,37];
elementosUnitarios = [6,7,8,14,15,16,22,23,24,30,31,32,38,39,40];
bias = [6,14,22,30,38];

%%Salvando individuo para poder gerar a mutacao
individuoMutado = individuo;
for i = 1:40
    indicadorMutacao = realizaMutacao();
    
    if(indicadorMutacao == 1)
        %%Elementos nao unitarios
        if(i ~= elementosUnitarios)
            if(i ~= elementosSaida)
                peso = randInterval (-1, 1, 1, tamanhoEntrada);
            else
                peso = randInterval (-1, 1, 1, conexoesCamadaSaida);
            end
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
        
        individuoMutado(tabelaIntervalo(i,tamanhoEntrada, conexoesCamadaSaida)) = peso;
    end
    
end








end