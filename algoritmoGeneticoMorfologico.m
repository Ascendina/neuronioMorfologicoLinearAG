function algoritmoGeneticoMorfologico()

%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PARAMETROS
%%%%%%%%%%%%%%%%%%%%%%%%%%

tamanhoEntrada = 10;                                                        %%Tamanho da entrada (corresponde ao tamanho da janela deslizante - depende da autocorrelacao dos elementos)
conexoesCamadaSaida = 4;                                                    %%Quantidade de neurônios na camada oculta que estão conectados ao neurônio de saída
quantidadeIndividuos = 10;                                                  %%Quantidade de individuos na populacao (10 ate 30)
tamanhoIndividuo = (20*tamanhoEntrada + 12) + (5*conexoesCamadaSaida+3);     %%Tamanho do indivíduo
quantidadeEntradas = 20;                                                    %%Quantidade de entradas da serie
quantidadeIteracoesAprendizado = 1000;                                      %%Quantidade de iteracoes do algoritmo genético (1000 ate 10000)


%%vetor de entrada (arquivo com uma coluna e várias linhas)
fileID = fopen('C:\Users\Mila\Documents\series_temporais\series_financeiras\neuronio_morfologico\series_previsao\sun.txt','r');
entrada = fscanf(fileID,'%f');
tamanhoArquivo = size(entrada);

MSETreinamento = fopen('C:\Users\Mila\Documents\series_temporais\series_financeiras\neuronio_morfologico\neuronio_morfologico_genetico\resultados\mseTreinamento.txt','w');
MSEValidacao = fopen('C:\Users\Mila\Documents\series_temporais\series_financeiras\neuronio_morfologico\neuronio_morfologico_genetico\resultados\mseValidacao.txt','w');
MSETeste = fopen('C:\Users\Mila\Documents\series_temporais\series_financeiras\neuronio_morfologico\neuronio_morfologico_genetico\resultados\mseTeste.txt','w');
MSEFilhos = fopen('C:\Users\Mila\Documents\series_temporais\series_financeiras\neuronio_morfologico\neuronio_morfologico_genetico\resultados\mseFilhos.txt','w');
%%Normalizando os elementos da serie
entrada = normalizacaoTotal(entrada);

%%Encontradando a quantidade de janelas a serem processadas 
qntEntradasTreinamento = floor(tamanhoArquivo(1) * 0.50);  %%Separando a quantidade de entradas (linhas) do treinamento
qntEntradasValidacao = floor(tamanhoArquivo(1) * 0.25);    %%Separando a quantidade de entradas (linhas) da validação
qntEntradasTeste = floor(tamanhoArquivo(1) * 0.25);        %%Separando a quantidade de entradas (linhas) do teste 
quantidadeEntradasTreinamento = (qntEntradasTreinamento - (tamanhoEntrada + 1)/1) + 1;  %%Quantidade de entradas (janelas) a serem processadas no treinamento
quantidadeEntradasValidacao = (qntEntradasValidacao - (tamanhoEntrada + 1)/1) + 1;      %%Quantidade de entradas (janelas) a serem processadas na validacao
quantidadeEntradasTeste = (qntEntradasTeste - (tamanhoEntrada + 1)/1) + 1;              %%Quantidade de entradas (janelas) a serem processadas no teste

%%Criando a populacao
disp('Iniciando Populacao');               
populacao = geraPopulacao(quantidadeIndividuos, tamanhoEntrada, tamanhoIndividuo, conexoesCamadaSaida);


MSEIndividuo = 0;                                   %MSEIndividuo - Treinamento
fitnessIndividuos = ones(1,quantidadeIndividuos);   %
contadorIteracoes = 0;                              %Conta a quantidade de iteracoes do while
individuoSelecionadoRoleta_vetor1 = 0;              %Individuo que foi selecionado para ser o gerador (gerador1)
individuoSelecionadoRoleta_vetor2 = 0;              %Individuo que foi selecionado para ser o outro gerador (gerador 2)
recombinaMax_filho1 = zeros(tamanhoIndividuo,1);     %Primeiro filho gerado pela recombinacao Max
recombinaMax_filho2 = zeros(tamanhoIndividuo,1);     %Segundo filho gerado pela recombinacao Max
recombinaMin_filho1 = zeros(tamanhoIndividuo,1);     %Primeiro filho gerado pela recombinacao Min
recombinaMedia_filho1 = zeros(tamanhoIndividuo,1);   %Primeiro filho gerado pela recombinacao Media
recombinaMedia_filho2 = zeros(tamanhoIndividuo,1);   %Segundo filho gerado pela recombinacao Media
agEstaEstagnado = 0;                                 %Verificando se o algoritmo esta estagnado

while(contadorIteracoes < quantidadeIteracoesAprendizado && agEstaEstagnado == 0)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% TREINAMENTO REDE NEURAL
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
   disp('TREINAMENTO');
    for i = 1:quantidadeEntradasTreinamento
        %%%%%%%%%%%%%%%%%%%%%%%%%%
        %% AVALIACAO INICIAL
        %%%%%%%%%%%%%%%%%%%%%%%%%%
        %Calculando erro individuos
        for j = 1:quantidadeIndividuos
            %%Calculo do erro
            for i=1:quantidadeEntradasTreinamento
                saidaDesejada = entrada(i+tamanhoEntrada+1);
                MSEIndividuo = MSEIndividuo + erroIndividuo (entrada((i):(i + (tamanhoEntrada-1))),populacao(j,:), saidaDesejada, conexoesCamadaSaida, MSETreinamento);
            end

            %calculo do fitness
            fitnessIndividuos(j) = 1 / (1 + MSEIndividuo);
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%
        %% TREINAMENTO GENETICO
        %%%%%%%%%%%%%%%%%%%%%%%%%%

        %%Selecionando os pais (metodo roleta)
        [individuoSelecionadoRoleta_vetor1, individuoSelecionadoRoleta_vetor2] = selecaoGeradores(fitnessIndividuos);

        %%Recombinacao pares de geradores
        %%Recombinacao Max
        [recombinaMax_filho1, recombinaMax_filho2] = recombinaMax(populacao(individuoSelecionadoRoleta_vetor1,:), populacao(individuoSelecionadoRoleta_vetor2,:));

        %%Recombinacao Min
        [recombinaMin_filho1, recombinaMin_filho2] = recombinaMin(populacao(individuoSelecionadoRoleta_vetor1,:), populacao(individuoSelecionadoRoleta_vetor2,:));

        %%Recombinacao Media
        [recombinaMedia_filho1, recombinaMedia_filho2] = recombinaMedia(populacao(individuoSelecionadoRoleta_vetor1,:), populacao(individuoSelecionadoRoleta_vetor2,:));


        %%Mutacao
        recombinaMax_filho1 = mutacao(recombinaMax_filho1, tamanhoEntrada,conexoesCamadaSaida);
        recombinaMax_filho2 = mutacao(recombinaMax_filho2, tamanhoEntrada, conexoesCamadaSaida);

        recombinaMin_filho1 = mutacao(recombinaMin_filho1, tamanhoEntrada, conexoesCamadaSaida);
       recombinaMin_filho2 = mutacao(recombinaMin_filho2, tamanhoEntrada, conexoesCamadaSaida);

        recombinaMedia_filho1 = mutacao(recombinaMedia_filho1, tamanhoEntrada, conexoesCamadaSaida);
        recombinaMedia_filho2 = mutacao(recombinaMedia_filho2, tamanhoEntrada, conexoesCamadaSaida);

        %%Avaliando os candidatos
        fitnessIndividuosMutadosRecombinados(1) = fitnesseTotal(recombinaMax_filho1, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, MSEFilhos);
        fitnessIndividuosMutadosRecombinados(2) = fitnesseTotal(recombinaMax_filho2, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, MSEFilhos);
        fitnessIndividuosMutadosRecombinados(3) = fitnesseTotal(recombinaMin_filho1, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, MSEFilhos);
        fitnessIndividuosMutadosRecombinados(4) = fitnesseTotal(recombinaMin_filho2, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, MSEFilhos);
        fitnessIndividuosMutadosRecombinados(5) = fitnesseTotal(recombinaMedia_filho1, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, MSEFilhos);
       fitnessIndividuosMutadosRecombinados(6) = fitnesseTotal(recombinaMedia_filho2, quantidadeEntradas, entrada, tamanhoEntrada, conexoesCamadaSaida, MSEFilhos);

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
        %populacao = populacao(populacao ~= populacao(individuoSelecionadoRoleta_vetor1,:));
        %populacao = populacao(populacao ~= populacao(individuoSelecionadoRoleta_vetor2,:));
        populacao(individuoSelecionadoRoleta_vetor1,:) = [];
        populacao(individuoSelecionadoRoleta_vetor2,:) = [];
        
        %%Adicionando os filhos gerados na populacao
        populacao(size(populacao,1)+1, :) = filho1;
        populacao(size(populacao,1)+1, :) = filho2;
        
        %Modificando a entrada da rede
    end
    
    %%Verificando estagnacao
    fitnessMelhorado5porcento = fitnessIndividuos(individuoSelecionadoRoleta_vetor1) +(0.05*fitnessIndividuos(individuoSelecionadoRoleta_vetor1));
    
    if(melhorFitnessGerado > fitnessMelhorado5porcento)
        agEstaEstagnado = 0;
    else
        agEstaEstagnado = 1;
    end
    
   
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    %% VALIDACAO 
    %%%%%%%%%%%%%%%%%%%%%%%%%%
   disp('VALIDACAO');
   % for j = quantidadeEntradasTreinamento:(quantidadeEntradasValidacao + quantidadeEntradasTreinamento)
    %for j = 1:quantidadeEntradasValidacao
        %Calculando erro individuos
        for j = 1:quantidadeIndividuos
            %%Calculo do erro
            for i= quantidadeEntradasTreinamento:(quantidadeEntradasValidacao + quantidadeEntradasTreinamento)
               MSEIndividuo = MSEIndividuo + erroIndividuo (entrada(i:(i + (tamanhoEntrada-1))),populacao(j,:),entrada(i+tamanhoEntrada),conexoesCamadaSaida, MSEValidacao);
            end
        end
   % end
    
    %%atualizando o contador de interacoes
    contadorIteracoes = contadorIteracoes + 1;
    
    x = ['Execucao ', num2str(contadorIteracoes)];
    disp(x);
end %end while



  %%%%%%%%%%%%%%%%%%%%%%%%%%
  %% TESTE 
  %%%%%%%%%%%%%%%%%%%%%%%%%%
  disp('TESTE');
  %for k = (quantidadeEntradasTreinamento + quantidadeEntradasValidacao):(quantidadeEntradasTreinamento + quantidadeEntradasValidacao + quantidadeEntradasTeste)
     %Calculando erro individuos
        for j = 1:quantidadeIndividuos
            %%Calculo do erro
            for i=(quantidadeEntradasTreinamento + quantidadeEntradasValidacao):(quantidadeEntradasTreinamento + quantidadeEntradasValidacao + quantidadeEntradasTeste)
                MSEIndividuo = MSEIndividuo + erroIndividuo (entrada((i):(i + (tamanhoEntrada-1))),populacao(j,:),entrada(i+tamanhoEntrada), conexoesCamadaSaida, MSETeste);
            end
        end

  %end

  
  %Fechando os arquivos
  fclose(MSETreinamento);
  fclose(MSEValidacao);
  fclose(MSETeste);


end %end function