#ifndef PONTO_H
#define PONTO_H 

class Ponto {
public:
	float x,y;
	Ponto();   //construtor
	Ponto(float vx, float vy);   //construtor 2
	void Imprime();
	float operator - (Ponto p);
};

#endif
