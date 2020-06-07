import socket
import sys

ESTADO = 'OFF'

def interpretaComando(comando, s):
    global ESTADO
    print('Recebi o comando', comando)
    if comando.lower() == 'ligar':
        ESTADO = 'ON'
    elif comando.lower() == 'desligar':
        ESTADO = 'OFF'
    elif comando.lower() == 'consulta':
        s.send(bytes(ESTADO,'utf-8'))
    else:
        print('comando desconhecido: ', comando)

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

print('Entre com o IP do servidor')
IP= input()

print('Entre com a porta do servidor')
PORTA= int(input())

print('Entre com o ID do sensor')
ID = input()

try:
    s.connect((IP, PORTA))
    #Envia o identificador
    s.send(bytes(ID,'utf-8'))

except:
    print('erro de conexao')

while True:
    try:
        dados = str(s.recv(100),'utf-8')
        interpretaComando(dados,s)
    except:
        print('Erro na conexão com o monitor')
        sys.exit()