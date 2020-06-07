#include <iostream>

using namespace std;

const unsigned int MAX = 24;

using Indice = int; 	// ou typedef int Indice;
using TipoChave = int;	// typedef int TipoChave;

struct Entrada {
    TipoChave valor;
    bool vazio;			// true, se posi��o da tabela est� "vazia"
};

class TabelaHash {
private:
	unsigned int tamanho;
	Entrada tab[MAX];
public:
	TabelaHash();
	Indice busca_insere(TipoChave chave);
	void imprime();
};

/* Prot�tipos das fun��es de hash e re-hash */

Indice h(TipoChave chave);
Indice rh(Indice i);

//
//	MAIN
//

int main()
{
	cout << "*** HASHING ***\nTAP\nEscola Politecnica\n" << endl;

	cout << "h(chave) = chave % 13\nrh(i) = (i+7) % 24\n\n";

	TabelaHash th;
	Indice i;
	TipoChave chave;

	cout << "Chave [-1 para sair]: ";
	cin >> chave;
	while (chave != -1) {
		i = th.busca_insere(chave);
		cout << "\tIndice da chave = " << i << endl;
		cout << "Chave [-1 para sair]: ";
		cin >> chave;
	}

	cout << "\nTABELA:\n------\n";
	th.imprime();

	return 0;
}


Indice h(TipoChave chave)
{
    return (chave % 13);
}

Indice rh(Indice i)
{
    return (i+7) % MAX;
}

TabelaHash::TabelaHash()
{
    /* Faz todas posi��es ficarem vazias + tamanho = 0 */
    /* COMPLETAR */
}

Indice TabelaHash::busca_insere(TipoChave chave)
{
    /* Retorna posi��o da chave na tabela se encontrada, ou
       insere caso n�o seja encontrada, retornando tb. sua posi��o */
    /* COMPLETAR */
}

void TabelaHash::imprime()
{
    /* Mostra tabela na tela */
    /* COMPLETAR */
}
