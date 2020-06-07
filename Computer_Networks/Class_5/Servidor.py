import socket
import sys

GROUP = '224.1.2.3'
HOST = '10.26.208.98'

print('Entre com a porta do servidor')
porta = int(input())

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

try: 
    s.bind((HOST, porta))
    s.setsockopt( socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, socket.inet_aton(GROUP)+socket.inet_aton(HOST))
except:
   print('# erro de bind')
   sys.exit()

while True:
    data, addr = s.recvfrom(1024)
    print('sensor ', addr, ' enviou:', data)

print('o servidor encerrou')
s.close()