#include <iostream>
#include<cmath>
#include"Ponto.h"

using namespace std;

const double Pi = 3.1411592654;


float Distancia(Ponto a, Ponto b)
{
	float dy = b.y-a.y;
	float dx = b.x-a.x;
	return sqrt(dy*dy + dx*dx);
	
}


class Retangulo
{
private:
	Ponto supdir,infesq;
public:
	Retangulo(Ponto sd, Ponto ie); // construtor 
	float area();
	float perimetro();
};

Retangulo::Retangulo(Ponto sd, Ponto ie)
{
	supdir = sd;
	infesq = ie;
	//testar se é um retangulo
}
float Retangulo::area()
{
	return (supdir.y-infesq.y)*(supdir.x-infesq.x);
}
float Retangulo::perimetro()
{
	return 2*((supdir.y-infesq.y)*(supdir.x-infesq.x));
}


class Circle 
{
private:
	Ponto centro;
    float Raio;
public:
    Circle();   //construtor
    Circle(float q ,float w, float e);   // construtor 2
    float area();
    float perimetro();
};
Circle::Circle(){
	centro.x = centro.y = 0.0;
	Raio = 0.0;
}
Circle::Circle(float q ,float w, float e){
	centro.x = q;
	centro.y = w;
	Raio = e;
}
float Circle::area(){
	return Pi*Raio*Raio;
}
float Circle::perimetro(){
	return 2*Pi*Raio;	
}


int main(){
	
	Ponto p;
	Ponto pp(3,4);
	
	Retangulo r(pp,p);
	cout << "Area = "<<r.area()<<endl;
	cout << "Perimetro = "<<r.perimetro()<<endl;
	
	Circle c(3.0,5.0,3.0);
	cout << "Area do circulo: " << c.area() << endl;
	cout << "Perimetro do circulo: " << c.perimetro() << endl;
	
	p.Imprime();
	pp.Imprime();
	
	cout << p.operator -(pp) << endl;
	cout << p - pp << endl;
	
	cout<< Distancia(pp,p) << endl;
	
	system("pause");
return 0;
}
