#include <iostream>
#include <string>

using namespace std;

//using TipoDado = char; 
typedef char TipoDado;
const int MAXPILHA = 10;

class Pilha {
protected:
	TipoDado dados[MAXPILHA];
	int topo = -1;
public:
	Pilha();
	void Push(TipoDado x);
	TipoDado Pop();
	bool Vazia();
	bool Cheia();
};

Pilha::Pilha()
{
	topo = -1;
}

void Pilha::Push(TipoDado x)
{
	if (Cheia())
	{
		cout << "Pilha cheia" << endl;
	}
	else
	{
		topo++;
		dados[topo] = x;
	}
}

TipoDado Pilha::Pop()
{
	TipoDado aux;
	if (Vazia())
		cout << "Pilha Vazia!! " << endl;
	else
	{
		aux = dados[topo--];
	}
	return aux;
}

bool Pilha::Vazia() {
	return topo == -1;
}

bool Pilha::Cheia() {
	return topo == MAXPILHA - 1;
}

int main() {
	string s,s1;
	int a,b,x;
	float res;
	cout << "Digite uma expressao pos fixa" << endl;
	getline(cin,s);// getline é igual ao Cin todavia consegue ler o espaço
	cout << "string lida = " << s << endl;

	cout << "Tamanho da string = " << s.size() << endl;

	Pilha p;


	for (int i = 0; i < s.size(); ++i) {
		//cin e colocar criterio de parada 
		if (s[i] >= '0' && s[i] <= '9') {
			p.Push(s[i] - '0');
		}
		else {
			switch (s[i]) {
			case'+':
				a = p.Pop(); b = p.Pop();
				res = b + a;
				cout << res << endl;
				break;
			case '-':
				a = p.Pop(); b = p.Pop();
				res = b - a;
				cout << res << endl;
				break;
			case '*':
				a = p.Pop(); b = p.Pop();
				res = b * a;
				cout << res << endl;
				break;
			case '/':
				a = p.Pop(); b = p.Pop();
				res = b / a;
				cout << res << endl;
				break;
			case ' ':
				break;
			default:
				cout << "Nao foi possivel identificar o operador" << endl;

			}
		}
	}
	 while (!p.Vazia())
		cout << p.Pop() << endl;
		

	return 0;
}
