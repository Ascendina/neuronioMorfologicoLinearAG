%x e a devem ser vetores linha
function erosaoVetorial = erosaoVetor (x,a)

entrada = kron(x, ones(length(x), 1));
unitario = geraVetorUnitario(a);

%adicaoDual = adicaoDualMinMax(entrada, unitario);
adicaoDual = entrada + unitario;

erosaoVetorial = min(adicaoDual,[],2);
end