import socket
import sys
import time

ESTADO='OFF'
ID='Torneira'
HOST='10.26.208.98'

#------------------------------------------------------
def interpretaComando(comando, addr):
    global ESTADO
    strcomando = str(comando,'utf-8').lower()
    print('Recebi o comando', strcomando)
    if strcomando == 'ligar':
        ESTADO = 'ON'
    elif strcomando == 'desligar':
        ESTADO = 'OFF'
    elif strcomando == 'consulta':
        s.sendto(bytes('ESTADO '+ ESTADO, 'utf-8'), addr)
    else:
        print('comando desconhecido:', strcomando)
        
def registraSensor(s,ip,porta):
    s.sendto(bytes('REGISTRO '+ ID, 'utf-8'), (ip, porta))
    s.setblocking(0)
    time.sleep(5)
    try:
        data, addr = s.recvfrom(1024)
        strdata = str(data,'utf-8')
        if strdata == 'ACKregistro':
            print('registrado no monitor ', addr)
            return True
        else:
            return False
    except:
        print('\no monitor está desligado')
        return False

#------------------------------------------------------

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt( socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
s.bind((HOST,0)) #fazemos isso para poder usar o broadcast 255.255.255.255

while True:
    if registraSensor(s,'255.255.255.255',9999):
        break

s.setblocking(1)   

while True:
    data, addr = s.recvfrom(1024)
    interpretaComando(data, addr)

print('o cliente encerrou')
s.close()