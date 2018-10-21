function populacao = geraPopulacao(quantidadeIndividuos, tamanhoEntrada, tamanhoIndividuo,conexoesCamadaSaida)

%Criando a matriz que contera a populacao
%%cada linha da matriz corresponde a um individuo da populacao
populacao = ones(quantidadeIndividuos,tamanhoIndividuo);

for i = 1:quantidadeIndividuos
    
%%Criando os individuos
%%Peso A
pesoA_N1 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoA_N2 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoA_N3 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoA_N4 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoA_NS = randInterval (-1, 1, 1, conexoesCamadaSaida);

%%Peso B
pesoB_N1 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoB_N2 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoB_N3 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoB_N4 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoB_NS = randInterval (-1, 1, 1, conexoesCamadaSaida);

%%Peso C
pesoC_N1 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoC_N2 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoC_N3 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoC_N4 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoC_NS = randInterval (-1, 1, 1, conexoesCamadaSaida);

%%Peso D
pesoD_N1 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoD_N2 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoD_N3 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoD_N4 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoD_NS = randInterval (-1, 1, 1, conexoesCamadaSaida);

%%Peso G
pesoG_N1 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoG_N2 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoG_N3 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoG_N4 = randInterval (-1, 1, 1, tamanhoEntrada);
pesoG_NS = randInterval (-1, 1, 1, conexoesCamadaSaida);

%%Bias
bias_N1 = randInterval (-1, 1, 1, 1);
bias_N2 = randInterval (-1, 1, 1, 1);
bias_N3 = randInterval (-1, 1, 1, 1);
bias_N4 = randInterval (-1, 1, 1, 1);
bias_NS = randInterval (-1, 1, 1, 1);

%%Phi
phi_N1 = randInterval (0, 1, 1, 1);
phi_N2 = randInterval (0, 1, 1, 1);
phi_N3 = randInterval (0, 1, 1, 1);
phi_N4 = randInterval (0, 1, 1, 1);
phi_NS = randInterval (0, 1, 1, 1);

%%Lambda
lambda_N1 = randInterval (0, 1, 1, 1);
lambda_N2 = randInterval (0, 1, 1, 1);
lambda_N3 = randInterval (0, 1, 1, 1);
lambda_N4 = randInterval (0, 1, 1, 1);
lambda_NS = randInterval (0, 1, 1, 1);

populacao(i,:) = criandoIndividuo (pesoA_N1, pesoB_N1, pesoC_N1, pesoD_N1, pesoG_N1, bias_N1, phi_N1, lambda_N1, pesoA_N2, pesoB_N2, pesoC_N2, pesoD_N2, pesoG_N2, bias_N2, phi_N2, lambda_N2, pesoA_N3, pesoB_N3, pesoC_N3, pesoD_N3, pesoG_N3, bias_N3, phi_N3, lambda_N3, pesoA_N4, pesoB_N4, pesoC_N4, pesoD_N4, pesoG_N4, bias_N4, phi_N4, lambda_N4, pesoA_NS, pesoB_NS, pesoC_NS, pesoD_NS, pesoG_NS, bias_NS, phi_NS, lambda_NS);

end









end