#include <iostream>
#include <cmath>
#include "Ponto.h"

using namespace std;

void Ponto::Imprime()
{
	cout << "(" << x <<","<< y <<")"<<endl;
}
Ponto::Ponto()
{
	x = y = 0.0;
}
Ponto::Ponto(float vx, float vy)
{
	x=vx;
	y=vy;
}

float Ponto::operator - (Ponto p)
{
	float dx = x-p.x;
	float dy = y - p.y;
	return sqrt(dx*dx+dy*dy);
}
