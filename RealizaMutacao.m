function selecaoMutacao = realizaMutacao()

%%Escolhendo um numero entre 0 e 1 para selecionar a mutacao
numeroAleatorio = rand();

taxaMutacao = 0.05;

if(numeroAleatorio > taxaMutacao)
    selecaoMutacao = 1;
else 
   selecaoMutacao = 0; 
end

end