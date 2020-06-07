#include <iostream>
#include <limits>

using namespace std;


using Vertice_t = unsigned int;
using Distancia_t = int;

const Vertice_t MAXNOS = 100;
const Distancia_t INFINITO = numeric_limits<Distancia_t>::max();	// retorna o maior número inteiro (Distancia_t=int)
//Duvida sobre "numeric_limits<Distancia_t>::max()"


class Grafo {
private:
	int nos;
	bool adj[MAXNOS][MAXNOS];
	int pes[MAXNOS][MAXNOS];
public:
	Grafo(Vertice_t n);
	void unep(Vertice_t a, Vertice_t b, Distancia_t p);
	void remv(Vertice_t a, Vertice_t b);
	bool adjacente(Vertice_t a, Vertice_t b);
	Distancia_t peso(Vertice_t a, Vertice_t b);
	Distancia_t menor_caminho(Vertice_t s, Vertice_t t, Vertice_t precede[]);
};

Grafo::Grafo(Vertice_t n)
{
	nos = 0;
	for (int i = 0; i < n;++i) //Modifica a matriz peso e adjacente para valores padroes F e 0
	{
		for (int j = 0; j < n;++j) {
			adj[i][j] = false;
			pes[i][j] = 0;
		}
	}
}
void Grafo::unep(Vertice_t a, Vertice_t b, Distancia_t p)
{
	adj[a][b] = true;
	pes[a][b] = p;
}
void Grafo::remv(Vertice_t a, Vertice_t b)
{
	adj[a][b] = false;
	pes[a][b] = INFINITO;
}
bool Grafo::adjacente(Vertice_t a, Vertice_t b)
{
	return adj[a][b];
}
Distancia_t Grafo::peso(Vertice_t a, Vertice_t b)
{
	if (adjacente(a,b))
		return pes[a][b];
	else
		return INFINITO;
}
Distancia_t Grafo::menor_caminho(Vertice_t s, Vertice_t t, Vertice_t precede[])
{
    Distancia_t distancia[MAXNOS];
    bool calculado[MAXNOS];
    int menordist, novadist, i, k;
    int dc;  // distância calculada de s até o nó corrente

    for (i=0; i<nos; i++) {
         distancia[i] = INFINITO;
         calculado[i] = false;
    }
    distancia[s] = 0;
    calculado[s] = true;
    Vertice_t corrente = s;
    while (corrente != t) {
         menordist = INFINITO;
         dc = distancia[corrente];
         for (i=0; i<nos; i++) {
              if (!calculado[i]) {
                   novadist = dc + peso(corrente,i);
                   if (novadist < distancia[i]) {
                        distancia[i] = novadist;
                        precede[i] = corrente;
                   }
                   if (distancia[i] < menordist) {
                        menordist = distancia[i];
                        k = i;
                   }
              } // se já calculado não faz nada
          } // fim do for
          corrente = k;
          calculado[corrente] = true;
    }
    return distancia[t];
}




int main(int argc, char* argv[])
{
	cout << "TAP: GRAFOS" << endl;

	Vertice_t n;
	cout << "Numero de nos = ";
	cin >> n;

	Grafo g(n);		// instancia grafo com n nós

	Vertice_t a, b;
	Distancia_t peso;

	cout << "Grafo (a >= " << n << ", para terminar):" << endl;
	cout << "   a = ";
	cin >> a;
	while (a < n) {
		cout << "   b = ";
		cin >> b;
		cout << "   peso = ";
		cin >> peso;

		g.unep(a, b, peso);

		cout << "   a = ";
		cin >> a;
	}

	cout << "\nMENOR CAMINHO" << endl;

	Vertice_t s;
	Vertice_t t;
	Vertice_t precede[MAXNOS];

	cout << "   de: ";
	cin >> s;
	cout << "   a:";
	cin >> t;

	Distancia_t d = g.menor_caminho(s, t, precede);

	cout << "Menor distancia = " << d << endl;
	cout << "Menor caminho = ";

	// * escreva o trecho que programa que imprime o menor caminho
	//   a partir do vetor precede


}