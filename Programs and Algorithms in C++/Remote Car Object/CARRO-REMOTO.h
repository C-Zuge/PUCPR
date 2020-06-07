#ifndef CARRO-REMOTO_H
#define CARRO-REMOTO_H

enum MAR {	Frente, Re };
enum DIR { N,S,L,O };
enum MDIR {Dir, Esq };

class Motor {
private:
	float vel_max;
	float velocidade;
public:
	Motor();
	Motor(float max);
	~Motor();
	void muda_vel_max(float max);
	float obtem_vel();
	void muda_vel(float delta);
	void inverte_rotacao();
};

class Carro{
private:
	DIR Direcao;  // duvida
	MAR Marcha;
	float Motor(float vel_max); // duvida
public:
	Carro();
	Carro (float vel);
	float Velocimetro();
	void Acelera();
	void Freia();
	MAR Obtem_marcha(); // duvida
	void Muda_marcha();
	void Vira (MDIR Dir);
	DIR Obtem_direcao(); //duvida
	
	
};
#endif
