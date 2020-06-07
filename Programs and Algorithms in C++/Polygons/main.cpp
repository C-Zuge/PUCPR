#include <iostream>
#include<cmath>

using namespace std;

class Poligono {
protected:
	float base, altura;
	int num_lados;
public:
	Poligono(float lado) 
	{
		base = altura = lado;
	}
	float area();
	float perimetro();
	int obtem_num_lados() { return num_lados; }
};


class Retangulo : public Poligono // Retangulo é subclasse de poligono
{
protected:
	static int num_rets;
public:
	Retangulo(float b, float a); // construtor 
	float area() { return base*altura; }
	float perimetro() { return 2 * (base + altura); }
	void imprime() { cout << "Sou Um Retangulo!! " << endl; }
	int obtem_num_rets() { return num_rets; }

};

int Retangulo::num_rets = 0;

Retangulo::Retangulo(float b, float a) : Poligono (1.0)
{
	base = b;
	altura = a;
	num_lados = 4;
	++num_rets;
	//testar se é um retangulo
}

class Quadrado : public Retangulo // Quadrado é subclasse de Retangulo que é subclasse de poligono
{
public:
	Quadrado(float lado) { num_lados = 4.0; base = altura = lado; }

}

class Triangulo : public Poligono{
public:
	Triangulo(float b, float a) { base = b; altura = a; num_lados = 3; }
	float area() { return base*altura / 2.0; }
};




int main() {
	Retangulo r1, r2;
	Triangulo t(1, 2);

	Retangulo r1(10, 5);
	Retangulo r2(3, 20);

	cout << "Numero de lados = " << r1.obtem_num_lados() << endl;
	cout << "Area = " << r1.area() << endl;
	cout << "Perimetro = " << r1.perimetro() << endl;

	cout << "Numero de lados = " << r2.obtem_num_lados() << endl;
	cout << "Area = " << r2.area() << endl;
	cout << "Perimetro = " << r2.perimetro() << endl;

	cout << "Numero de lados = " << t.obtem_num_lados() << endl;
	cout << "Area = " << t.area() << endl;
	cout << "Perimetro = " << t.perimetro() << endl;

	cout << "Numero de ratangulos = " << r1.obtem_num_rets << endl;
	cout << "Numero de ratangulos = " << r2.obtem_num_rets << endl;




	system("pause");
	return 0;
}