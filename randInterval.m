function randIntervalo = randInterval (inicioIntervalo, fimIntervalo, linhas, colunas)

%%Funcao apresentada pelo Matlab no site mathworks
%%https://www.mathworks.com/help/matlab/math/floating-point-numbers-within-specific-range.html
randIntervalo = (fimIntervalo - inicioIntervalo).* rand(linhas, colunas) + inicioIntervalo;


end