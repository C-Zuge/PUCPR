#include <iostream>
#include <string>

using namespace std;

using TipoDado = char;

struct No {
	TipoDado info;
	No *prox;
};

class Lista {
protected:
	No *lista;
	unsigned int numnos;
public:
	Lista();
	~Lista();
	void Insere(TipoDado x);
	TipoDado Remove();
	bool Vazia();
	unsigned int Tam();
	void Imprime();
	TipoDado Josefo(TipoDado n); // Método que exclui a variável sorteada pelo método de Josefo
};

Lista::Lista()
{
	lista = nullptr;
	numnos = 0;
}

Lista::~Lista()
{
	while (!Vazia())
		Remove();
}

void Lista::Insere(TipoDado x)
{
	++numnos;

	No *novono; // Cria Ponteiro para um Nó
	novono = new No; // New armazena espaço dinamicamente
	novono->info = x;

	if (lista == nullptr)
	{
		lista = novono;
		novono->prox = lista;
	}
	else
	{
		novono->prox = lista->prox;
		lista->prox = novono;
		lista = novono;
	}
}

TipoDado Lista::Remove()
{
	TipoDado x;

	if (numnos == 0) {
		cout << "Lista vazia!" << endl;
		return x;
	}

	--numnos;
	if ( numnos == 0)
	{
		x = lista->info;
		delete lista->prox;
		lista = nullptr;
		return x;
	}
	else
	{
		No *rem;
		rem = lista->prox;
		x = rem->info;  // Armazena a informação do Nó
		lista->prox = rem->prox;
		delete rem; // Deleta o Nó para onde o ponteiro apontava
		return x;
	}
}

bool Lista::Vazia()
{
	return numnos == 0;
}

unsigned int Lista::Tam()
{
	return numnos;
}

void Lista::Imprime()
{
	if (Vazia())
		return;

	No *aux;
	aux = lista->prox;
	// Varredura da lista
	while (aux!=lista) {
		cout << "  " << aux->info << endl;
		aux = aux->prox;
	}
	cout << "  " << aux->info << endl;
	//}
}

TipoDado Lista::Josefo(TipoDado n)
{
	TipoDado aux;
	for (int i = 0; i < n-1; ++i) {
		lista = lista->prox;  // Varredura da lista
	}
	aux = lista->info;
	return aux;
}

int main()
{
	Lista l;
	TipoDado x;
	unsigned int i, n;
	string s;

	cout << "Insira a info: " << endl;
	cin >> s;
	for (int i=0; i<s.size(); ++i)
		l.Insere(s[i]);

	cout << "\n\n";
	cout << "Digite o numero do salto" << endl;
	cin >> n;

	l.Imprime();  // Probelma no Case Vazia()
	              // Programa está imprimindo 3 vezes a mesma lista sem remover EFETIVAMENTE o caracter.

	while (l.Vazia()!=true) {
		l.Josefo(n);
		x = l.Remove(); // Problema no Vazia()

		cout << "Deletado: " << x << endl;
		cout << "\n\n";

//`		l.Imprime();

	}

	return 0;
}