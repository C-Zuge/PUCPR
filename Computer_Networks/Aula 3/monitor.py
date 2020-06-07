import socket
import sys
import threading

CONSOLE = None
SENSORES = {}

def TrataSensor(conn, addr):

  global CONSOLE
          
  print('A thread', addr, 'iniciou')

  # O sensor deve enviar seu ID apos a conexao
  sensor = str(conn.recv(10),'utf-8')
  print(len(sensor))
  SENSORES[sensor] = conn

  print('sensor ', sensor, ' registrado no socket', conn)
  
  while True:
        data = conn.recv(100)
        if not data:
          break
        print('sensor ', sensor, addr, 'enviou ', data)

        if CONSOLE is not None:
          CONSOLE.send(data)
        
  conn.close()      
  print('O sensor', addr, 'encerrou')

#--------------------------------------------------------------------------
  
def Console():

  global CONSOLE
  
  s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
  try: 
    s.bind(('', 8888))
  except:
     print('# erro de bind')
     sys.exit()

  s.listen(1)

  while True:
    conn, addr = s.accept()
    print('console ativado ')
    CONSOLE = conn
    
    CONSOLE.send(bytes('Digite SENSOR_ID COMANDO\r\n','utf-8'))  
    while True:
          data = str(CONSOLE.recv(200),'utf-8')
          if not data:
            print('Console encerrou')
            break
          if(len(data) < 4):
            continue
          try:
            (sensor, comando) = data.split(' ', 1)
          except:
            CONSOLE.send(bytes('Digite SENSOR_ID:COMANDO\r\n','utf-8'))
            print(data)

          if sensor in SENSORES:
            SENSORES[sensor].send(bytes(comando,'utf-8'))
          else:
            CONSOLE.send(bytes('Esse sensor nao existe\r\n','utf-8'))


#--------------------------------------------------------------------------

t = threading.Thread( target=Console, args=())
t.start()

print('Entre com a porta do servidor')
porta = int(input())

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try: 
    s.bind(('', porta))
except:
   print('# erro de bind')
   sys.exit()

s.listen(5)
 
print('aguardando conexoes em ', porta)

while True:
    conn, addr = s.accept()
    print('recebi uma conexao de ', addr)

    t = threading.Thread( target=TrataSensor, args=(conn,addr,))
    t.start()

print('o servidor encerrou')
s.close()

