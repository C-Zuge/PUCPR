import socket

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt( socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
while True:

    print('Entre com o IP de destino: ')
    ip = input()

    print('Entre com a porta de destino: ')
    porta = int(input())

    print('Entre com a mensagem: ')
    msg = input()

    s.sendto(bytes(msg, 'utf-8'), (ip, porta))

print('o cliente encerrou')
s.close()