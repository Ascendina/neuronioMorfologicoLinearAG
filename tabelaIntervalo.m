function intervalo = tabelaIntervalo(geneIndividuo, tamanhoEntrada, conexoesCamadaSaida)

switch(geneIndividuo)
    case 1
        intervalo = 1:tamanhoEntrada;
    case 2
        intervalo = tamanhoEntrada+1:tamanhoEntrada*2;
    case 3
        intervalo = tamanhoEntrada*2+1:tamanhoEntrada*3;   
    case 4
        intervalo = tamanhoEntrada*3+1:tamanhoEntrada*4;
    case 5
        intervalo = tamanhoEntrada*4+1:tamanhoEntrada*5;
    case 6
        intervalo = tamanhoEntrada*5+1;
    case 7
        intervalo = tamanhoEntrada*5+2;
    case 8
        intervalo = tamanhoEntrada*5+3;
    case 9
        intervalo = tamanhoEntrada*5+4:tamanhoEntrada*6+3;
    case 10
        intervalo = tamanhoEntrada*6+4:tamanhoEntrada*7+3;
    case 11
        intervalo = tamanhoEntrada*7+4:tamanhoEntrada*8+3;
    case 12
        intervalo = tamanhoEntrada*8+4:tamanhoEntrada*9+3;
    case 13
        intervalo = tamanhoEntrada*9+4:tamanhoEntrada*10+3;
    case 14
        intervalo = tamanhoEntrada*10+4;
    case 15
        intervalo = tamanhoEntrada*10+5;
    case 16
        intervalo = tamanhoEntrada*10+6;
    case 17
        intervalo = tamanhoEntrada*10+7:tamanhoEntrada*11+6;
    case 18
        intervalo = tamanhoEntrada*11+7:tamanhoEntrada*12+6;
    case 19
        intervalo = tamanhoEntrada*12+7:tamanhoEntrada*13+6;
    case 20
        intervalo = tamanhoEntrada*13+7:tamanhoEntrada*14+6;
    case 21
        intervalo = tamanhoEntrada*14+7:tamanhoEntrada*15+6;
    case 22
        intervalo = tamanhoEntrada*15+7;
    case 23
        intervalo = tamanhoEntrada*15+8;
    case 24
        intervalo = tamanhoEntrada*15+9;
    case 25
        intervalo = tamanhoEntrada*15+10:tamanhoEntrada*16+9;
    case 26
        intervalo = tamanhoEntrada*16+10:tamanhoEntrada*17+9;
    case 27
        intervalo = tamanhoEntrada*17+10:tamanhoEntrada*18+9;
    case 28
        intervalo = tamanhoEntrada*18+10:tamanhoEntrada*19+9;
    case 29
        intervalo = tamanhoEntrada*19+10:tamanhoEntrada*20+9;
    case 30
        intervalo = tamanhoEntrada*20+10;
    case 31
        intervalo = tamanhoEntrada*20+11;
    case 32
        intervalo = tamanhoEntrada*20+12;
    case 33
        intervalo = tamanhoEntrada*20+13:tamanhoEntrada*20+13+(conexoesCamadaSaida-1);
    case 34
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida):tamanhoEntrada*20+13+(conexoesCamadaSaida*2-1);
    case 35
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida*2):tamanhoEntrada*20+13+(conexoesCamadaSaida*3-1);
    case 36
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida*3):tamanhoEntrada*20+13+(conexoesCamadaSaida*4-1);
    case 37
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida*4):tamanhoEntrada*20+13+(conexoesCamadaSaida*5-1);
    case 38
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida*5);
    case 39
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida*5+1);
    case 40
        intervalo = tamanhoEntrada*20+13+(conexoesCamadaSaida*5+2);
end


end