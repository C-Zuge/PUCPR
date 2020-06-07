#include <iostream>

using namespace std;
using TipoDado = int;

struct No {
	TipoDado info;
	No *pai;
	No *esq;
	No *dir;
};

class Arvbin {
private:
	No* raiz;
	TipoDado info(No* p) { return p->info; }
	No* esq(No* p) { return p->esq; }
	No* dir(No* p) { return p->dir; }
	void CriaNoEsq(No* p, TipoDado x)
	{
		if (esq(p) != nullptr) {
			cout << "Erro!" << endl; //cerr
		}
		else {
			No *novono = new No;
			novono->info = x;
			novono->esq = novono->dir = nullptr;
			novono->pai = p;
			p->esq = novono;
		}
	}
	void CriaNoDir(No* p, TipoDado x)
	{
		if (dir(p) != nullptr) {
			cout << "Erro!" << endl; //cerr
		}
		else {
			No *novono = new No;
			novono->info = x;
			novono->esq = novono->dir = nullptr;
			novono->pai = p;
			p->dir = novono;
		}
	}
	void adiciona(No* r, TipoDado x)
	{
		if (x == info(r))
			cerr << "Repetido" << endl;
		else {
			if (x < info(r)) {
				if (esq(r) == nullptr) {
					CriaNoEsq(r, x);
				}
				else {
					adiciona(esq(r), x);
				}
			}
			else {
				if (dir(r) == nullptr)
					CriaNoDir(r, x);
				else
					adiciona(dir(r), x);
			}
		}
	}
	void percorre(No* r)
	{
		if (r != nullptr) {
			percorre(esq(r));
			cout << info(r) << endl;
			percorre(dir(r));
		}
	}
	void remove(No* r)
	{
		if (r != nullptr) {
			remove(esq(r));
			remove(dir(r));
			delete r;
		}
	}

public:
	Arvbin() { raiz = nullptr; }
	~Arvbin() { remove(raiz); }
	No* Raiz(){ return raiz; }
	void Adiciona(TipoDado x) {
		if (raiz == nullptr) {
			No* novono = new No;
			novono->info = x;
			novono->esq = novono->dir = novono->pai = nullptr;
			raiz = novono;
		} else
			adiciona(raiz,x);
	}
	void Percorre(){ percorre(raiz); }
};

int main() {
	Arvbin a;
	TipoDado x;

	cout << "Digite numero: " << endl;
	cin >> x;

	while (x > 0) {
		a.Adiciona(x);
		cout << "Digite numero: " << endl;
		cin >> x;
	}

	a.Percorre();
	return 0;
}