function antiDilatacaoVetorial = antiDilatacaoVetores (x, a)

conjugadoX = kron(conjugado(x), ones(length(x), 1));
unitario = geraVetorUnitario(a);

%adicaoDual = adicaoDualMinMax(conjugadoX, unitario);
adicaoDual = conjugadoX + unitario;

antiDilatacaoVetorial = min(adicaoDual,[],2);
   
end