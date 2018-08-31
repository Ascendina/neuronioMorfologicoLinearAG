function geradorSelecionado = selecaoGeradores(vetorFitnessIndividuos)

individuoSelecionadoRoleta_vetor1;      %Individuo que foi selecionado para ser o gerador (gerador1)
individuoSelecionadoRoleta_vetor2;      %Individuo que foi selecionado para ser o outro gerador (gerador 2)
fitnessTemporarioEscolhaPais;           %Fitness temporario para auxiliar na escolha dos pais

%%Escolhendo o gerador
individuoSelecionadoRoleta_vetor1 = roleta(vetorFitnessIndividuos);

%%removendo do vetor de fitness o individuo selecionado pela roleta
fitnessTemporarioEscolhaPais = fitnessIndividuos(vetorFitnessIndividuos ~= individuoSelecionadoRoleta_vetor1);

individuoSelecionadoRoleta_vetor2 = roleta(fitnessTemporarioEscolhaPais);

geradorSelecionado = [individuoSelecionadoRoleta_vetor1,individuoSelecionadoRoleta_vetor2];

end