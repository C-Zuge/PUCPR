#include <iostream>
#include<cmath>

using namespace std;

const double Pi = 3.1411592654;

class Poligono{
protected: 
	float base, altura;
	int num_lados;
public:
	float area();
	float perimetro();
	int obtem_num_lados() {return num_lados; }
};


class Retangulo : public Poligono // Retangulo é subclasse de poligono
{
public:
	Retangulo(float b, float a); // construtor 
	float area(){return base*altura;}
	float perimetro(){return 2*(base + altura); }
	void imprime(){cout<<"Sou Um Retangulo!! "<<endl; }

};

Retangulo::Retangulo(float b, float a)
{
	base = b;
	altura = a;
	num_lados = 4;
	//testar se é um retangulo
}

class Quadrado : public Retangulo // Quadrado é subclasse de Retangulo que é subclasse de poligono
{
public:
	Quadrado(float lado){num_lados = 4.0; base = altura = lado;	}
	
}

class Trinagulo : public Poligono{
public:
	Triangulo(float b, float a){base = b; altura = a; num_lados = 3;}
	float area(){return base*altura/2.0;	}
};




int main(){
	Retangulo r1,r2;
	Triangulo t(1,2);
	
	Retangulo r1(10,5);
	Retangulo r2(3,20);
	
	cout << "Numero de lados = " <<r1.obtem_num_lados()<<endl;
	cout << "Area = "<<r1.area()<<endl;
	cout << "Perimetro = "<<r1.perimetro()<<endl;
	
	cout << "Numero de lados = " <<r2.obtem_num_lados()<<endl;
	cout << "Area = "<<r2.area()<<endl;
	cout << "Perimetro = "<<r2.perimetro()<<endl;
	
	cout << "Numero de lados = " <<t.obtem_num_lados()<<endl;
	cout << "Area = "<<t.area()<<endl;
	cout << "Perimetro = "<<t.perimetro()<<endl;
	
	
	

	
	system("pause");
return 0;
}
