#### Fundamentos Básicos de Julia
#### Prof. Dr. Neylson Crepalde

# Operações matemáticas básicas
5 + 5
5 - 3
3 * 7
14 / 2
3^3

10%3 # Resto da divisão
10/3 # Divisão comum
trunc(Int, 10/3) # Divisão inteira (truncada para um inteiro)

sqrt(49) # Raiz

exp(3) # exponencial
log(20.085536923187668) #logaritmo natural

#### Trabalhando com objetos
x = 3
y = 7

x + y
x * y

#...
### Vetores
# Vetores em Julia (Arrays) podem ser definidos como listas do Python
x = [6,8,2,5,1] # uma coluna
y = [4 7 3 2 5;] # uma linha

x + x # Adição elemento a elemento
# Alguns comandos precisam de um ponto (.) para funcionarem com vetores. 
# Esse é o indicativo de comando vetorial
x .* y # Multiplicação elemento a elemento
x ./ y # Divisão elemento a elemento


# Matrizes
A = ones((4,4))

  
A[14] = 2     # Define posição 14
A[9] = 15     # Define posição 9

A[2,3] = 10   # Define linha 2, coluna 3
A



