#include <iostream>

using namespace std;

using TipoDado = int;
const int MAXFILA = 8;

int prox(int i) 
{
	if (i == MAXFILA - 1)
		return 0;
	else
		return i + 1;
}

class Fila{
protected:
	TipoDado dados[MAXFILA];
	int frente, fim;
public:
	Fila();
	void Insere(TipoDado x);
	TipoDado Remove();
	bool Vazia();
	bool Cheia();
};

Fila::Fila() 
{
	frente = fim = MAXFILA-1;
}

void Fila::Insere(TipoDado x) 
{
	if (Cheia())
		cout << "Fila Cheia!!" << endl;
	else
	{
		fim = prox(fim);
		dados[fim] = x;
	}
}

TipoDado Fila::Remove() 
{
	TipoDado aux;
	if (Vazia()) 
	{
		cout << "Fila Vazia!!" << endl;
		aux = -1;
	}
	else
	{
		frente = prox(frente);
		aux = dados[frente];
	}
	return aux;
}

bool Fila::Vazia()
{
	return (frente == fim);
}

bool Fila::Cheia()
{
	return prox(fim) == frente;
}

int main() {
	Fila f[3];
	TipoDado s=0;
	

	while (s!=-1) {
		int num = s % 10;

		if (num < 4 && num > 0)
			f[0].Insere(s);
		else {
			if (num < 7 && num > 3)
				f[1].Insere(s);
			else {
				if (num < 10 && num > 6)
					f[2].Insere(s);
				else {
					cout << "Digito terminado em 0" << endl;
				}
			}
		}
		cout << "Digite um Numero" << endl;
		cin >> s;
	}

	while (!f[0].Vazia()) {
		cout << f[0].Remove() << endl;
	}
	while (!f[1].Vazia()) {
		cout << f[1].Remove() << endl;
	}
	while (!f[2].Vazia()) {
		cout << f[2].Remove() << endl;
	}
	return 0;
}