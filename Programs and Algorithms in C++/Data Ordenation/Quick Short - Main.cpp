#include <iostream>

using namespace std;

int Divide(int x[], int inf, int sup);
void QuickSort(int x[], int inf, int sup);
void Imprime(int x[], int N);

int main(int argc, char* argv[])
{
	int x[] = { 14, 5, 20, 8, 30, 18, 17, 2, 9 };
	int N = 9;

	cout << "Vetor original:" << endl;
	Imprime(x,N);

	QuickSort(x,0,N-1);

	cout << "\nVetor ordenado:" << endl;
	Imprime(x,N);
}

int Divide(int x[], int inf, int sup)
{
	// completar
	return 0;
}

void QuickSort(int x[], int inf, int sup)
{
	// completar
}

void Imprime(int x[], int N)
{
	bool primeiro = true;
	for (int i=0; i<N; ++i) {
		if (primeiro) {
			cout << x[i];
			primeiro = false;
		} else
			cout << "," << x[i];
	}
	cout << endl;
}
