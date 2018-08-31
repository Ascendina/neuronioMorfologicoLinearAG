function redeNeuralMorfologica = redeNeural(entrada, pesoA_N1, pesoB_N1, pesoC_N1, pesoD_N1, pesoG_N1, bias_N1, phi_N1, lambda_N1, pesoA_N2, pesoB_N2, pesoC_N2, pesoD_N2, pesoG_N2, bias_N2, phi_N2, lambda_N2, pesoA_N3, pesoB_N3, pesoC_N3, pesoD_N3, pesoG_N3, bias_N3, phi_N3, lambda_N3, pesoA_N4, pesoB_N4, pesoC_N4, pesoD_N4, pesoG_N4, bias_N4, phi_N4, lambda_N4, pesoA_NS, pesoB_NS, pesoC_NS, pesoD_NS, pesoG_NS, bias_NS, phi_NS, lambda_NS)


%%---------------
%% CAMADA OCULTA
%%---------------

%%--------------
%% Neuronio 1
%%--------------
saidaNeuronio1 = neuroMorfoLinear (entrada, pesoA_N1, pesoB_N1, pesoC_N1, pesoD_N1, pesoG_N1, bias_N1, phi_N1, lambda_N1);

%%--------------
%% Neuronio 2
%%--------------
saidaNeuronio2 = neuroMorfoLinear (entrada, pesoA_N2, pesoB_N2, pesoC_N2, pesoD_N2, pesoG_N2, bias_N2, phi_N2, lambda_N2);

%%--------------
%% Neuronio 3
%%--------------
saidaNeuronio3 = neuroMorfoLinear (entrada, pesoA_N3, pesoB_N3, pesoC_N3, pesoD_N3, pesoG_N3, bias_N3, phi_N3, lambda_N3);

%%--------------
%% Neuronio 4
%%--------------
saidaNeuronio4 = neuroMorfoLinear (entrada, pesoA_N4, pesoB_N4, pesoC_N4, pesoD_N4, pesoG_N4, bias_N4, phi_N4, lambda_N4);


%%---------------
%% CAMADA SAIDA
%%---------------

vetorEntradaCamadaSaida = [saidaNeuronio1, saidaNeuronio2, saidaNeuronio3, saidaNeuronio4];

redeNeuralMorfologica = neuroMorfoLinear (vetorEntradaCamadaSaida, pesoA_NS, pesoB_NS, pesoC_NS, pesoD_NS, pesoG_NS, bias_NS, phi_NS, lambda_NS);

end