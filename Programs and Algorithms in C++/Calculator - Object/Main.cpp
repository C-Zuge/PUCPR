#include <iostream>


using namespace std;

class Calculadora {
private:  // deixa o conteudo invisivel e imutavel ao usuario, o contrario é: "Public:"
		  //DADOS - ATRIBUTOS
	float memoria;
	float ultimo_resultado;

public:  // deixa o conteudo visivel e mutavel ao usuario, o contrario é: "Private::"

		 //OPERAÇÕES - MÉTODOS

	Calculadora(); //Construtor
	~Calculadora(); //Destrutor
	float soma(float a, float b);
	float subtracao(float a, float b);
	float multiplica(float a, float b);
	float divide(float a, float b);
	void salva();
	void limpa();
	float display();
	float mem();
};

int main()
{

	Calculadora calc1, calc2, calc3; // criação de objeto - INSTANSIAÇÃO DE CLASSE

	cout << "calc1: " << calc1.display() << endl;
	cout << "calc2: " << calc2.display() << endl;
	cout << "calc3: " << calc3.display() << endl;

	float x, y, z;

	x = calc1.soma(5, 2);
	cout << x << endl;

	y = calc2.multiplica(x, 5);
	cout << y << endl;

	if (x>2)
	{
		Calculadora c3;
		c3.limpa();
		cout << c3.display() << endl;
	}

	cout << "calc1: " << calc1.display() << endl;
	cout << "calc2: " << calc2.display() << endl;

	//Calculadora::salva();

	z = calc3.divide(calc2.display(), 2);
	cout << "calc3: " << z << endl;
	//cout << Calculadora::mem << endl;

	cout << "calc1: " << calc1.display() << endl;
	cout << "calc2: " << calc2.display() << endl;
	cout << "calc3: " << calc3.display() << endl;

	system("pause");

	return 0;
}

Calculadora::Calculadora()
{
	cout << "Construindo........." << endl;
	memoria = ultimo_resultado = 1.0;
}

Calculadora::~Calculadora()
{
	cout << " Modo Destrucao Ativado!!!!" << endl;
}

float Calculadora::soma(float a, float b)
{
	float res = a + b;
	ultimo_resultado = res;
	return res;
}

float Calculadora::subtracao(float a, float b)
{
	float res = a - b;
	ultimo_resultado = res;
	return res;
}

float Calculadora::multiplica(float a, float b)
{
	float res = a * b;
	ultimo_resultado = res;
	return res;

}
float Calculadora::divide(float a, float b)
{
	float res = a / b;
	ultimo_resultado = res;
	return res;
}

void Calculadora::salva()
{
	memoria = ultimo_resultado;
}

void Calculadora::limpa()
{
	ultimo_resultado = memoria = 0.0;
}

float Calculadora::display()
{
	return ultimo_resultado;
}

float Calculadora::mem()
{
	return memoria;
}
