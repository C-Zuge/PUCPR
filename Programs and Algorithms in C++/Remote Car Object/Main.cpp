#include <iostream>
#include "CARRO-REMOTO.h"
#include <cmath>

int main(){
	Carro c(1);
	c.Acelera();
	//c.Vira(Dir);
	c.Acelera();
	cout << c.Velocimetro() <<endl;
	//c.Vira(Esq);
	c.Freia();
	c.Freia();
	//c.Muda_marcha();
	c.Acelera();
	c.Freia();
	cout << c.Obtem_direcao() << endl;
	return 0;
}
