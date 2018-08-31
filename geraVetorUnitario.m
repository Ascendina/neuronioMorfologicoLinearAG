function geraVetorUnitario = vetorUnitario (x)

vetor = kron(x, ones(length(x),1));
geraVetorUnitario = vetor.';

end

