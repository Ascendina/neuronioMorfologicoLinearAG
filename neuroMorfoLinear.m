function neuronioMorfoLinear = neuroMorfoLinear (entrada, pesoA, pesoB, pesoC, pesoD, pesoG, bias, theta, lambda)

        %%----------------------------------------------------
        %%Calculando a saida do neuronio
        %%----------------------------------------------------
        
        r1 = erosaoVetorial(entrada.',pesoA);
        r2 = antiDilatacaoVetorial(entrada.', pesoB);
        t = min(r1, r2);
        chi = max(t);
        
        s1 = dilatacaoVetorial(entrada.', pesoC);
        s2 =  antiErosaoVetorial(entrada.', pesoD);
        z = max(s1, s2);
        psi = min(z); 
        
        alfa = theta * chi + (1 - theta) * psi;

        beta = neuronioMLP(entrada.', pesoG, bias);
       
        %saida do neuronio ja passando pela funcao de ativacao
        neuronioMorfoLinear = tanh((lambda * alfa) + ((1 - lambda) * beta));
end