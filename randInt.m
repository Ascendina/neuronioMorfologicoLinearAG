function numeroAleatorio = randInt(inicioIntervalo, fimIntervalo)

%%Funcao apresentada pelo Matlab no site mathworks
%%https://www.mathworks.com/help/matlab/math/floating-point-numbers-within-specific-range.html
numeroAleatorio = floor((fimIntervalo - inicioIntervalo).* rand(1) + inicioIntervalo);


end