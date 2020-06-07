#include <cmath>
#include <iostream>
#include "CARRO-REMOTO.h"

using namespace std;

Motor::Motor()
{
	vel_max = 1.0;
	velocidade = 0.0;
}

Motor::Motor(float max)
{
	vel_max = max;
	velocidade = 0.0;	
}

Motor::~Motor(){
	cout << " Modo Destrucao Ativado!!!!" << endl;
}

void Motor::muda_vel_max(float max)
{
	vel_max = max;
}

float Motor::obtem_vel()
{
	return velocidade;
}

void Motor::muda_vel(float delta){
	velocidade = delta;
}

void Motor::inverte_rotacao() // duvida
{
}

/*--------------------------------------------------------------------------------------------*/ 

Carro::Carro(){
	DIR = N;
	MAR = Frente;
}

Carro::Carro (float vel){
	vel_max = vel;
}

float Carro::Velocimetro(){
	return Velocimetro;
}

void Motor::Acelera(){
	return velocidade + 0.1;
}
void Motor::Freia(){
	return velocidade - 0.1;
}
MAR Carro::Obtem_marcha(){  // duvida
	
}
void Carro::Muda_marcha(){ // duvida
	return 0;
}
void Carro::Vira (MDIR Dir) // duvida

DIR Carro::Obtem_direcao()
{
	return DIR;
}
