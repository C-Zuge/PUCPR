#!/usr/bin/env python3
import socket
import time

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

print('Entre com o IP do servidor')
IP= input()

print('Entre com a porta do servidor')
PORTA= int(input())

print('Entre com o ID do Sensor')
SENSOR = input()

try:
    s.connect((IP, PORTA))
except:
    print('erro de conexao')
    
s.send(bytes(SENSOR,'utf-8'))
    
while True: 
    data = s.recv(8)
    if not data:
            break
    else:
        print(len(data),':', data)
        if data == b'CONSULTA':
            data = bytes(time.ctime(time.time()), 'utf-8')
            tam = s.send(data)
            print('sensor enviou ',tam, 'bytes')
            print(data)
        else:
            print('comando desconhecido: ', data)
                
        print('enviei ',tam, 'bytes')
        print(data)