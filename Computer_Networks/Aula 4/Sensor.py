import socket
import sys

ESTADO='OFF'

#------------------------------------------------------
def defineMonitor():
    print('IP do monitor: <ENTER>=localhost')
    ip = input()
    if not ip:  #IP Default
        ip = '127.0.0.1'

    print('PORTA do monitor: <ENTER>=9999')
    data = input()
    if not data:
        porta=9999  #Porta Default
    else:
        porta=int(data)

    print('ID do sensor: <ENTER>=sala')
    ID= input()
    if not ID:
        ID='sala' #ID Default

    return(ip, porta, ID)
    
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
    elif strcomando == 'ackregistro': # recebe confirmação de registro do sensor
        print('registro confirmado')
    else:
        print('comando desconhecido: ', comando)

#------------------------------------------------------

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

(ip, porta, ID) = defineMonitor()
      
s.sendto(bytes('REGISTRO '+ ID, 'utf-8'), (ip, porta))
 
while True:
        data, addr = s.recvfrom(1024)
        interpretaComando(data, (ip,porta))
        
print('o cliente encerrou')
s.close()