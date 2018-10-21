function [geradorSelecionado1,geradorSelecionado2] = selecaoGeradores(vetorFitnessIndividuos)

individuoSelecionadoRoleta_vetor1 = 0;      %Individuo que foi selecionado para ser o gerador (gerador1)
individuoSelecionadoRoleta_vetor2 = 0;      %Individuo que foi selecionado para ser o outro gerador (gerador 2)
fitnessTemporarioEscolhaPais = 0;           %Fitness temporario para auxiliar na escolha dos pais

%%Escolhendo o gerador
individuoSelecionadoRoleta_vetor1 = roleta(vetorFitnessIndividuos);

%%removendo do vetor de fitness o individuo selecionado pela roleta
%%fitnessTemporarioEscolhaPais = vetorFitnessIndividuos(vetorFitnessIndividuos ~= individuoSelecionadoRoleta_vetor1);
if(individuoSelecionadoRoleta_vetor1 ~= 1)
    fitnessTemporarioEscolhaPais = [vetorFitnessIndividuos(1:(individuoSelecionadoRoleta_vetor1-1)), vetorFitnessIndividuos((individuoSelecionadoRoleta_vetor1+1):size(vetorFitnessIndividuos,2))];
else 
     fitnessTemporarioEscolhaPais = vetorFitnessIndividuos(2:size(vetorFitnessIndividuos,2));
end

individuoSelecionadoRoleta_vetor2 = roleta(fitnessTemporarioEscolhaPais);

%Retornando saida
geradorSelecionado1 = individuoSelecionadoRoleta_vetor1;
geradorSelecionado2 = individuoSelecionadoRoleta_vetor2; 

end