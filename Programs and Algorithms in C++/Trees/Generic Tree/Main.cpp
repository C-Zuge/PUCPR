#include<iostream>
#include<string>

using namespace std;
using TipoDado = int;

struct No {
	TipoDado info;
	No *pai;
	No *filho;
	No *prox;
};

class ArvGen {
private:
	No* raiz;
	TipoDado info(No* p) { return p->info; }
	No* filho(No* p) { return p->filho; }
	No* prox(No* p) { return p->prox; }
	void CriaFilho(No* p, TipoDado x);
	void CriaIrmao(No* p, TipoDado x);
	void adiciona(No* r, TipoDado x);
	void percorre(No* r);
	void remove(No* r);

public:
	ArvGen() { raiz->filho = raiz->prox = raiz->pai = nullptr; }
	~ArvGen() { remove(raiz); }
	No* Raiz() { }
	void Adiciona(TipoDado x) { }
	void Percorre() { }
};


void ArvGen::CriaFilho(No* p, TipoDado x)
{
	No *novono = new No;
	novono->info = x;
	novono->filho = novono->prox = nullptr;
	novono->pai = p;
	p->filho = novono;

}

void ArvGen::CriaIrmao(No* p, TipoDado x)
{
	No *novono = new No;
	novono->info = x;
	novono->filho = novono->prox = nullptr;
	novono->pai = p;
	p->prox = novono;
}

void ArvGen::adiciona(No* r, TipoDado x)
{
	if (x == info(r))
		cerr << "Repetido" << endl;
	else {
		if (x < info(r)) {
			if (filho(r) == nullptr) {
				CriaFilho(r, x);
			}
			else {
				adiciona(filho(r), x);
			}
		}
		else {
			if (prox(r) == nullptr)
				CriaIrmao(r, x);
			else
				adiciona(prox(r), x);
		}
	}
}

void ArvGen::percorre(No* r)
{
	if (r != nullptr) {
		percorre(filho(r));
		cout << info(r) << endl;
		percorre(prox(r));
	}
}

void ArvGen::remove(No* r)
{
	if (r != nullptr) {
		remove(filho(r));
		remove(prox(r));
		delete r;
	}
}

int main() {
	ArvGen a;
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