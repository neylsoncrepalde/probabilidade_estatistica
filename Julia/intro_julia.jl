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

# Tipos de variáveis
typeof(3) # Int64
typeof(3.0) # Float64
typeof('b') # Char - um caracter apenas
typeof("Neylson") # String - Um texto
typeof(true)      # Bool - booleano ou lógico
A = [1 2 3 4; 5 6 7 8; 9 10 11 12]
typeof(A)         # Array (vetores ou matrizes)

# Matrizes
B = zeros((4,4))  # Cria uma matriz vazia de zeros, 4x4

  
B[14] = 2     # Define posição 14
B[9] = 15     # Define posição 9
B[2,3] = 10   # Define linha 2, coluna 3
B

#### Funções, condicionais e controle de fluxo
# Em Julia, blocos de condicionais if, loops e funções precisam ser encerrados com end

for i in 1:10
    println(i)
end

# Usando if
for i in 1:10
    if i % 2 == 0 # se for para
        println("Par")
    else
        println("Ímpar")
    end
end

# Usando while
let j = 0
    while j < 100
        if j % 5 == 0
            println(j)
        end
        j += 1
    end
end

# Programando uma função simples para calcular a média
# Fazendo de uma maneira simples quando não há necessidade de várias linhas
media(x) = sum(x) / length(x)

media([5,6,7,8])

# Agora, vamos incrementar nossa média para dar conta de ponderações, se houver
# Em julia, parâmetros com valores pré definidos vem no final e são separaados por ; dos anteriores
function media(x; w=nothing)
    n = length(x)
    if isnothing(w)
        return sum(x) / n
    else
        if length(x) != length(w)
            error("x e w precisam ser do mesmo tamanho")
        else
            new_x = x .* w
            return sum(new_x) / sum(w)
        end
    end
end

media([4,5,6,7,8,9])  # OK
media([4,5,6,7,8,9], w=[1,1,1,.5,.3,.2]) #OK
media([4,5,6,7,8,9], w=[1,2,3])  # Tem que dar erro de tamanhos diferentes. OK


# Agora, vamos testar a função de uma maneira mais profissional
# usando testes unitários automatizados
# Estudar sobre TDD (Test Driven Development)
using Test
@test media([4,5,6,7,8]) == 6 # Check value
@test isa(media([4,5,6,7,8]), Number)
@test media([4,5,6,7,8], w=[1,1,.5,.5,.2]) == 5.34375
@test_throws MethodError media([4,5,6,7,8], [1,2,3])




