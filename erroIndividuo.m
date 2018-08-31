function erroAvaliado = erroIndividuo (entrada,individuo,saidaDesejada)

%Separando individuos
%%Peso N1
pesoA_N1 = individuo(1:size(entrada,2));
pesoB_N1 = individuo(size(entrada,2)+1:size(entrada,2)*2+1);
pesoC_N1 = individuo(size(entrada,2)*2+2:size(entrada,2)*3+2);
pesoD_N1 = individuo(size(entrada,2)*3+3:size(entrada,2)*4+3);
pesoG_N1 = individuo(size(entrada,2)*4+4:size(entrada,2)*5+4);
bias_N1 = individuo(size(entrada,2)*5+5);
phi_N1 = individuo(size(entrada,2)*5+6);
lambda_N1 = individuo(size(entrada,2)*5+7);

%%Peso N2
pesoA_N2 = individuo(size(entrada,2)*5+8:size(entrada,2)*6+8);
pesoB_N2 = individuo(size(entrada,2)*6+9:size(entrada,2)*7+9);
pesoC_N2 = individuo(size(entrada,2)*8:size(entrada,2)*9);
pesoD_N2 = individuo(size(entrada,2)*9+1:size(entrada,2)*10+1);
pesoG_N2 = individuo(size(entrada,2)*10+2:size(entrada,2)*11+2);
bias_N2 = individuo(size(entrada,2)*11+3);
phi_N2 = individuo(size(entrada,2)*11+4);
lambda_N2 = individuo(size(entrada,2)*11+5);

%%Peso N3
pesoA_N3 = individuo(size(entrada,2)*11+6:size(entrada,2)*12+6);
pesoB_N3 = individuo(size(entrada,2)*12+7:size(entrada,2)*13+7);
pesoC_N3 = individuo(size(entrada,2)*13+8:size(entrada,2)*14+8);
pesoD_N3 = individuo(size(entrada,2)*14+9:size(entrada,2)*15+9);
pesoG_N3 = individuo(size(entrada,2)*16:size(entrada,2)*17);
bias_N3 = individuo(size(entrada,2)*17+1);
phi_N3 = individuo(size(entrada,2)*17+2);
lambda_N3 = individuo(size(entrada,2)*17+3);

%%Peso N4
pesoA_N4 = individuo(size(entrada,2)*17+4:size(entrada,2)*18+4);
pesoB_N4 = individuo(size(entrada,2)*19+5:size(entrada,2)*20+5);
pesoC_N4 = individuo(size(entrada,2)*20+6:size(entrada,2)*21+6);
pesoD_N4 = individuo(size(entrada,2)*21+7:size(entrada,2)*22+7);
pesoG_N4 = individuo(size(entrada,2)*22+8:size(entrada,2)*23+8);
bias_N4 = individuo(size(entrada,2)*23+9);
phi_N4 = individuo(size(entrada,2)*24);
lambda_N4 = individuo(size(entrada,2)*24+1);

%%Peso NS
pesoA_NS = individuo(size(entrada,2)*24+2:size(entrada,2)*25+2);
pesoB_NS = individuo(size(entrada,2)*25+3:size(entrada,2)*26+3);
pesoC_NS = individuo(size(entrada,2)*26+4:size(entrada,2)*27+4);
pesoD_NS = individuo(size(entrada,2)*27+5:size(entrada,2)*28+5);
pesoG_NS = individuo(size(entrada,2)*28+6:size(entrada,2)*29+6);
bias_NS = individuo(size(entrada,2)*29+7);
phi_NS = individuo(size(entrada,2)*29+8);
lambda_NS = individuo(size(entrada,2)*29+9);


%%Calculo da resposta do neuronio
redeNeural(entrada, pesoA_N1, pesoB_N1, pesoC_N1, pesoD_N1, pesoG_N1, bias_N1, phi_N1, lambda_N1, pesoA_N2, pesoB_N2, pesoC_N2, pesoD_N2, pesoG_N2, bias_N2, phi_N2, lambda_N2, pesoA_N3, pesoB_N3, pesoC_N3, pesoD_N3, pesoG_N3, bias_N3, phi_N3, lambda_N3, pesoA_N4, pesoB_N4, pesoC_N4, pesoD_N4, pesoG_N4, bias_N4, phi_N4, lambda_N4, pesoA_NS, pesoB_NS, pesoC_NS, pesoD_NS, pesoG_NS, bias_NS, phi_NS, lambda_NS);

%%Calculo erro MSE
erro = (saidaDesejada - saidaNeuronio)^2;

end