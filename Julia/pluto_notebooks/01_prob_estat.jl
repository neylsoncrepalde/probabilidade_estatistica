### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ aada3470-7177-11eb-231f-fbd72b894888
using StatsBase

# ╔═╡ a4759e9e-7118-11eb-148a-d916b4cf3620
md"
# Probabilidade e Estatística - Ciência de Dados IMIH

### Prof. Dr. Neylson Crepalde

Conteúdo abordado: medidas de tendência central e medidas de dispersão.

**Principal fonte**:
STEVENSON, Wiliam J.; DE FARIAS, Alfredo Alves. *Estatística aplicada à administração.* São Paulo: Harper e Row do Brasil, 1981.

## Medidas de Tendência Central

**Média**: Somatório de todos os valores sobre o número de ítens do conjunto.

$$\overline{x} = \frac{\sum_{i=1}^{n}x_i}{n}$$

#### Exemplo

Um estudante fez quatro avaliações na disciplina Probabilidade e Estatística e obteve as notas 83, 94, 95 e 86. Qual foi a sua nota média?
"

# ╔═╡ ad307a4e-7119-11eb-3073-217b654d36ad
# Na calculadora
med1 = (83+94+95+86) / 4

# ╔═╡ b8a239bc-7119-11eb-1a8a-abffb860e486
md"A nota média do aluno foi de $med1"

# ╔═╡ d915ebbc-7119-11eb-2e75-b14d1df8ec6d
# Função para média em Julia
function media(x)
    n = length(x)
    return sum(x) / n
end

# ╔═╡ cdec11c6-7119-11eb-13bd-958b74c973b6
begin
	notas = [83, 94, 95, 86]
	media(notas)
end

# ╔═╡ ebb5e9a2-7119-11eb-078b-2d1d751a5059
md"
**Média Ponderada**: A média ponderada por algum vetor que dá peso diferente às observações.

$$\overline{x}_p = \frac{\sum_{i=1}^{n} w_i x_i}{\sum_{i=1}^{n} w_i}$$

#### Exemplo

Um estudante fez três avaliações com pesos diferentes. Na tabela abaixo constam as notas e os pesos das avaliações do aluno:

| Exame | Nota | Peso |
|-------|------|------|
| N1    | 80   | 0,30 |
| N2    | 90   | 0,30 |
| Final | 96   | 0,40 |

Calcule a média ponderada das notas do aluno.
"

# ╔═╡ d34c6cdc-711a-11eb-04d6-d74c96d3076f
# Na calculadora
medp = (80*0.30 + 90*0.30 + 96*0.40) / (0.30+0.30+0.40)

# ╔═╡ fc6943c4-711a-11eb-10c1-adf22e52d26b
md"A média ponderada das notas do estudante foi $medp"

# ╔═╡ 079d68ec-711b-11eb-18c8-c1d8040073ba
# Função para média ponderada em Julia
function media_ponderada(x, w)
    if length(x) != length(w)
        error("x and w must have the same length")
    end
    somatorio = 0
    for i in 1:length(x)
        somatorio += x[i] * w[i]
    end
    return somatorio / sum(w)
end

# ╔═╡ 111d8dac-711b-11eb-383b-c7228bc5b7e3
begin
	notas1 = [80, 90, 96]
	pesos1 = [0.3, 0.3, 0.4]
	media_ponderada(notas1, pesos1)
end

# ╔═╡ 32842fd2-711b-11eb-294d-251f5164f04c
# Checando se a exceção foi bem programada
media_ponderada(notas1, [0.3, 0.7]) # Deve retornar erro

# ╔═╡ e6f01e7a-711d-11eb-21af-5d1aff2be431
md"
**Mediana**: Uma vez que o vetor está ordenado, a mediana é o caso que está na posição central do vetor. Caso o número de elementos no vetor seja par, a mediana é a média aritmética dos dois valores centrais.

Segundo Stevenson (1981) o processo para determinar a mediana consiste de:

1. Ordenar os valores
2. Verificar se há um múmero ímpar ou par de valores
3. Para um número ímpar de valores, a mediana é o valor do meio. Para um número par de valores, a mediana é a média dos dois valores do meio.

#### Exemplo

Os alunos de uma sala tiraram, respectivamente, as seguintes notas finais no semestre: 80, 90, 78, 95, 86. Qual foi a nota mediana da sala? E se na turma houvesse mais um aluno que tivesse tirado 89, qual seria então a mediana?

Resposta: Ordenando os valores: 78, 80, 86, 90 e 95. Mediana foi 86.

Se tivesse também 89: 78, 80, 86, 89, 90 e 95, $Mediana = \frac{86+89}{2} = 87,5$
"

# ╔═╡ 470e0ad4-7177-11eb-3c89-bff56a9be87c
(86 + 89) / 2

# ╔═╡ 535a0d60-7177-11eb-24bd-45fed23934f1
# Implmentando uma função de mediana em Julia
function mediana(x)
    #1 - ordenar os valores
    res = sort(x)
    n = length(x)
    #2 - Verificar se o tamanho é par ou ímpar
    if n % 2 == 1
        indice = trunc(Int, (n+1)/2)
        return res[indice]
    else
        indice1 = trunc(Int, n/2)
        indice2 = indice1+1
        return media([res[indice1], res[indice2]])
    end
end

# ╔═╡ 5895ada4-7177-11eb-2e11-3393038c51cf
begin
	notas2 = [80, 90, 78, 95, 86]
	mediana(notas2)
end

# ╔═╡ 674b32f4-7177-11eb-3244-5b17971bcd8b
begin
	notas3 = append!(notas2, 89)
	mediana(notas3)
end

# ╔═╡ 8583de18-7177-11eb-13ac-97874fade9e0
md"
**Moda**: A moda é o valor que ocorre com maior frequência. Se não houver apenas um valor com maior frequência, não foi possível encontrar uma moda.

#### Exemplo

Calcule a moda entre os números 10, 10, 8, 6 e 10. Moda = 10

Implementando a moda em Julia:
"

# ╔═╡ b4e24c46-7177-11eb-2b85-715ed5a12483
begin
	numeros = [10,10,8,6,10]
	dic = countmap(numeros)
end

# ╔═╡ c6bb66dc-7177-11eb-1411-679bb96f9f51
function moda(x)
    contagens = countmap(x)
    valores = sort(collect(values(contagens)), rev=true)
    if valores[1] == valores[2]
        return "Não existe moda"
    else
        res = collect(keys(contagens))[findmax(collect(values(contagens)))[2]]
        return res
    end
end

# ╔═╡ d42bafca-7177-11eb-26aa-bf23d8685f3f
moda(numeros)

# ╔═╡ d9bf90dc-7177-11eb-34b0-7bc55fddb841
begin
	numeros2 = [1,2,4,4,6,6,10]
	countmap(numeros2)
end

# ╔═╡ ecec1a40-7177-11eb-3b9b-e9f1dd8b1c22
moda(numeros2)

# ╔═╡ fbd2aace-7177-11eb-0e1f-6d6359fdd3dc
md"
**Quartis**: Os quartis são valores que dividem o conjunto ordenado de dados em partes iguais. O primeiro quartil representa 25% dos dados, o terceiro quartil representa 75% dos dados (o que seria o segundo quartil, representando 50% dos dados é a mediana).


"

# ╔═╡ Cell order:
# ╟─a4759e9e-7118-11eb-148a-d916b4cf3620
# ╠═ad307a4e-7119-11eb-3073-217b654d36ad
# ╟─b8a239bc-7119-11eb-1a8a-abffb860e486
# ╠═d915ebbc-7119-11eb-2e75-b14d1df8ec6d
# ╠═cdec11c6-7119-11eb-13bd-958b74c973b6
# ╟─ebb5e9a2-7119-11eb-078b-2d1d751a5059
# ╠═d34c6cdc-711a-11eb-04d6-d74c96d3076f
# ╟─fc6943c4-711a-11eb-10c1-adf22e52d26b
# ╠═079d68ec-711b-11eb-18c8-c1d8040073ba
# ╠═111d8dac-711b-11eb-383b-c7228bc5b7e3
# ╠═32842fd2-711b-11eb-294d-251f5164f04c
# ╟─e6f01e7a-711d-11eb-21af-5d1aff2be431
# ╠═470e0ad4-7177-11eb-3c89-bff56a9be87c
# ╠═535a0d60-7177-11eb-24bd-45fed23934f1
# ╠═5895ada4-7177-11eb-2e11-3393038c51cf
# ╠═674b32f4-7177-11eb-3244-5b17971bcd8b
# ╟─8583de18-7177-11eb-13ac-97874fade9e0
# ╠═aada3470-7177-11eb-231f-fbd72b894888
# ╠═b4e24c46-7177-11eb-2b85-715ed5a12483
# ╠═c6bb66dc-7177-11eb-1411-679bb96f9f51
# ╠═d42bafca-7177-11eb-26aa-bf23d8685f3f
# ╠═d9bf90dc-7177-11eb-34b0-7bc55fddb841
# ╠═ecec1a40-7177-11eb-3b9b-e9f1dd8b1c22
# ╠═fbd2aace-7177-11eb-0e1f-6d6359fdd3dc
