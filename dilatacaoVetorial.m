function dilatacaoVetorial = dilatacaoVetor (x,a)

entrada = kron(x, ones(length(x), 1));
unitario = geraVetorUnitario(a);

%adicao = adicaoMinMax(entrada, unitario);
adicao = entrada + unitario;

dilatacaoVetorial = max(adicao,[],2);
end