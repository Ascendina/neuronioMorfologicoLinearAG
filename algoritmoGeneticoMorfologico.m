function algoritmoGeneticoMorfologico()

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PARAMETROS REDE
%%%%%%%%%%%%%%%%%%%%%%%%%%
tamanhoEntrada = 10;                        %%Tamanho da entrada (corresponde ao tamanho da janela deslizante)
quantidadeIndividuos = 10;                  %%Quantidade de individuos na populacao (10 ate 30)
tamanhoIndividuo = 25*tamanhoEntrada + 15;  %%Tamanho do indivíduo
quantidadeEntradas = 20;                    %%Quantidade de entradas da serie
quantidadeIteracoesAprendizado = 1000;      %%Quantidade de iteracoes do algoritmo genético (1000 ate 10000)

%%vetor de entrada
fileID = fopen('C:\Users\Mila\Documents\series_temporais\series_financeiras\neuronio_morfologico\series_previsao\sun.txt','r');
entrada = fscanf(fileID,'%f');

%%Criando a populacao
populacao = geraPopulacao(quantidadeIndividuos, tamanhoEntrada, tamanhoIndividuo);


%%%%%%%%%%%%%%%%%%%%%%%%%%
%% AVALIACAO INICIAL
%%%%%%%%%%%%%%%%%%%%%%%%%%
MSEIndividuo = 0;
fitnessIndividuos = ones(1,quantidadeIndividuos); 

%Calculando erro individuos
for j = 1:quantidadeIndividuo
    %%Calculo do erro
    for i=1:quantidadeEntradas
        MSEIndividuo = MSEIndividuo + erroIndividuo (entrada(i),populacao(j),saidaDesejada(i));
    end
    
    %calculo do fitness
    fitnessIndividuos(j) = 1 / (1 + MSEIndividuo);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TREINAMENTO GENETICO
%%%%%%%%%%%%%%%%%%%%%%%%%%
contadorIteracoes = 1;                      %Conta a quantidade de iteracoes do while
individuoSelecionadoRoleta_vetor1 = 0;      %Individuo que foi selecionado para ser o gerador (gerador1)
individuoSelecionadoRoleta_vetor2 = 0;      %Individuo que foi selecionado para ser o outro gerador (gerador 2)
recombinaMax_filho1;                        %Primeiro filho gerado pela recombinacao Max
recombinaMax_filho2;                        %Segundo filho gerado pela recombinacao Max
recombinaMin_filho1;                        %Primeiro filho gerado pela recombinacao Min
recombinaMin_filho2;                        %Segundo filho gerado pela recombinacao Min
recombinaMedia_filho1;                      %Primeiro filho gerado pela recombinacao Media
recombinaMedia_filho2;                      %Segundo filho gerado pela recombinacao Media

while(contadorIteracoes <= quantidadeIteracoesAprendizado && agEstaEstagnado == 0)
    
    %%Selecionando os pais (metodo roleta)
    [individuoSelecionadoRoleta_vetor1, individuoSelecionadoRoleta_vetor2] = selecaoGeradores(fitnessIndividuos);
    
    %%Recombinacao pares de geradores
    %%Recombinacao Max
    [recombinaMax_filho1, recombinaMax_filho2] = recombinaMax(populacao(individuoSelecionadoRoleta_vetor1), populacao(individuoSelecionadoRoleta_vetor2));
    
    %%Recombinacao Min
    [recombinaMin_filho1, recombinaMin_filho2] = recombinaMin(populacao(individuoSelecionadoRoleta_vetor1), populacao(individuoSelecionadoRoleta_vetor2));
    
    %%Recombinacao Media
    [recombinaMedia_filho1, recombinaMedia_filho2] = recombinaMedia(populacao(individuoSelecionadoRoleta_vetor1), populacao(individuoSelecionadoRoleta_vetor2));

    
    %%Mutacao
    recombinaMax_filho1 = mutacao(recombinaMax_filho1, tamanhoEntrada);
    recombinaMax_filho2 = mutacao(recombinaMax_filho2, tamanhoEntrada);
    
    recombinaMin_filho1 = mutacao(recombinaMin_filho1, tamanhoEntrada);
    recombinaMin_filho2 = mutacao(recombinaMin_filho2, tamanhoEntrada);

    recombinaMedia_filho1 = mutacao(recombinaMedia_filho1, tamanhoEntrada);
    recombinaMedia_filho2 = mutacao(recombinaMedia_filho2, tamanhoEntrada);
    
    %%Avaliando os candidatos
    fitnessIndividuosMutadosRecombinados(1) = fitnesseTotal(recombinaMax_filho1, quantidadeEntradas, entrada, saidaDesejada);
    fitnessIndividuosMutadosRecombinados(2) = fitnesseTotal(recombinaMax_filho2, quantidadeEntradas, entrada, saidaDesejada);
    fitnessIndividuosMutadosRecombinados(3) = fitnesseTotal(recombinaMin_filho1, quantidadeEntradas, entrada, saidaDesejada);
    fitnessIndividuosMutadosRecombinados(4) = fitnesseTotal(recombinaMin_filho2, quantidadeEntradas, entrada, saidaDesejada);
    fitnessIndividuosMutadosRecombinados(5) = fitnesseTotal(recombinaMedia_filho1, quantidadeEntradas, entrada, saidaDesejada);
    fitnessIndividuosMutadosRecombinados(6) = fitnesseTotal(recombinaMedia_filho2, quantidadeEntradas, entrada, saidaDesejada);
    
    %%Escolhendo os melhores candidatos para substituir os geradores
    [melhorFilho1, melhorFilho2, melhorFitnessGerado] = maioresFitness(fitnessIndividuosMutadosRecombinados);
    
    %obtendo o individuo com melhor fitness
    switch melhorFilho1
        case 1
            filho1 = recombinaMax_filho1;
        case 2
            filho1 = recombinaMax_filho2;
        case 3
            filho1 = recombinaMin_filho1;
        case 4
            filho1 = recombinaMin_filho2;
        case 5
            filho1 = recombinaMedia_filho1;
        case 6
            filho1 = recombinaMedia_filho2;
    end
    

     %obtendo o individuo com o segundo melhor fitness
    switch melhorFilho2
        case 1
            filho2 = recombinaMax_filho1;
        case 2
            filho2 = recombinaMax_filho2;
        case 3
            filho2 = recombinaMin_filho1;
        case 4
            filho2 = recombinaMin_filho2;
        case 5
            filho2 = recombinaMedia_filho1;
        case 6
            filho2 = recombinaMedia_filho2;
    end
  

    %%Eliminando os geradores da populacao
    populacao = populacao(populacao ~= populacao(individuoSelecionadoRoleta_vetor1));
    populacao = populacao(populacao ~= populacao(individuoSelecionadoRoleta_vetor2));
    
    %%Adicionando os filhos gerados na populacao
    populacao(size(populacao)+1) = filho1;
    populacao(size(populacao)+1) = filho2;
    
    
    %%Verificando estagnacao
    fitnessMelhorado5porcento = fitnessIndividuos(individuoSelecionadoRoleta_vetor1) +(0.05*fitnessIndividuos(individuoSelecionadoRoleta_vetor1));
    
    if(melhorFitnessGerado > fitnessMelhorado5porcento)
        agEstaEstagnado = 0;
    else
        agEstaEstagnado = 1;
    end
    
    %%atualizando o contador de interacoes
    contadorIteracoes = contadorIteracoes + 1;
end








end