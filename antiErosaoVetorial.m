function antiErosaoVetorial = antiErosaoVetores (x, a)

conjugadoX = kron(conjugado(x), ones(length(x), 1));
unitario = geraVetorUnitario(a);


%adicaoVetorial = adicaoMinMax(conjugadoX, unitario);
adicaoVetorial = conjugadoX + unitario;

antiErosaoVetorial = max(adicaoVetorial,[],2);
   
end