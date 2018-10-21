function erroAvaliado = erroIndividuo (entrada,individuo,saidaDesejada,conexoesCamadaSaida, arquivo)

%Separando individuos
%%Peso N1
pesoA_N1 = individuo(1:size(entrada,1));
pesoB_N1 = individuo((size(entrada,1)+1):(size(entrada,1)*2));
pesoC_N1 = individuo(size(entrada,1)*2+1:size(entrada,1)*3);
pesoD_N1 = individuo(size(entrada,1)*3+1:size(entrada,1)*4);
pesoG_N1 = individuo(size(entrada,1)*4+1:size(entrada,1)*5);
bias_N1 = individuo(size(entrada,1)*5+1);
phi_N1 = individuo(size(entrada,1)*5+2);
lambda_N1 = individuo(size(entrada,1)*5+3);

%%Peso N2
pesoA_N2 = individuo(size(entrada,1)*5+4:size(entrada,1)*6+3);
pesoB_N2 = individuo(size(entrada,1)*6+4:size(entrada,1)*7+3);
pesoC_N2 = individuo(size(entrada,1)*7+4:size(entrada,1)*8+3);
pesoD_N2 = individuo(size(entrada,1)*8+4:size(entrada,1)*9+3);
pesoG_N2 = individuo(size(entrada,1)*9+4:size(entrada,1)*10+3);
bias_N2 = individuo(size(entrada,1)*10+4);
phi_N2 = individuo(size(entrada,1)*10+5);
lambda_N2 = individuo(size(entrada,1)*10+6);

%%Peso N3
pesoA_N3 = individuo(size(entrada,1)*10+7:size(entrada,1)*11+6);
pesoB_N3 = individuo(size(entrada,1)*11+7:size(entrada,1)*12+6);
pesoC_N3 = individuo(size(entrada,1)*12+7:size(entrada,1)*13+6);
pesoD_N3 = individuo(size(entrada,1)*13+7:size(entrada,1)*14+6);
pesoG_N3 = individuo(size(entrada,1)*14+7:size(entrada,1)*15+6);
bias_N3 = individuo(size(entrada,1)*15+7);
phi_N3 = individuo(size(entrada,1)*15+8);
lambda_N3 = individuo(size(entrada,1)*15+9);

%%Peso N4
pesoA_N4 = individuo(size(entrada,1)*15+10:size(entrada,1)*16+9);
pesoB_N4 = individuo(size(entrada,1)*16+10:size(entrada,1)*17+9);
pesoC_N4 = individuo(size(entrada,1)*17+10:size(entrada,1)*18+9);
pesoD_N4 = individuo(size(entrada,1)*18+10:size(entrada,1)*19+9);
pesoG_N4 = individuo(size(entrada,1)*19+10:size(entrada,1)*20+9);
bias_N4 = individuo(size(entrada,1)*20+10);
phi_N4 = individuo(size(entrada,1)*20+11);
lambda_N4 = individuo(size(entrada,1)*20+12);

%%Peso NS
pesoA_NS = individuo(size(entrada,1)*20+13:size(entrada,1)*20+13+(conexoesCamadaSaida-1));
pesoB_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida):size(entrada,1)*20+13+(conexoesCamadaSaida*2-1));
pesoC_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida*2):size(entrada,1)*20+13+(conexoesCamadaSaida*3-1));
pesoD_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida*3):size(entrada,1)*20+13+(conexoesCamadaSaida*4-1));
pesoG_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida*4):size(entrada,1)*20+13+(conexoesCamadaSaida*5-1));
bias_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida*5));
phi_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida*5+1));
lambda_NS = individuo(size(entrada,1)*20+13+(conexoesCamadaSaida*5+2));


%%Calculo da resposta do neuronio
saidaNeuronio = redeNeural(entrada, pesoA_N1, pesoB_N1, pesoC_N1, pesoD_N1, pesoG_N1, bias_N1, phi_N1, lambda_N1, pesoA_N2, pesoB_N2, pesoC_N2, pesoD_N2, pesoG_N2, bias_N2, phi_N2, lambda_N2, pesoA_N3, pesoB_N3, pesoC_N3, pesoD_N3, pesoG_N3, bias_N3, phi_N3, lambda_N3, pesoA_N4, pesoB_N4, pesoC_N4, pesoD_N4, pesoG_N4, bias_N4, phi_N4, lambda_N4, pesoA_NS, pesoB_NS, pesoC_NS, pesoD_NS, pesoG_NS, bias_NS, phi_NS, lambda_NS);

%%Calculo erro MSE
erroAvaliado = (saidaDesejada - saidaNeuronio)^2;

%%Salvando resultado no arquivo
fprintf(arquivo,'%f, %f, %f \n',saidaDesejada, saidaNeuronio, erroAvaliado);

end