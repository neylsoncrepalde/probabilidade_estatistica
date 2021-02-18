### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ f2844fd8-718e-11eb-342d-c58b517f2e86
using Plots

# ╔═╡ 23f76dac-718f-11eb-0438-4fb9d095a36d
using Random

# ╔═╡ 41c8aa14-718f-11eb-045b-c76ae39916bc
using StatsPlots

# ╔═╡ 4d46e022-718d-11eb-0c17-d190a6c15f38
md"
# Probabilidade e Estatística - Ciência de Dados IMIH

### Prof. Dr. Neylson Crepalde

Conteúdo abordado: distribuições de frequência

**Principal fonte**:

STEVENSON, Wiliam J.; DE FARIAS, Alfredo Alves. *Estatística aplicada à administração.* São Paulo: Harper e Row do Brasil, 1981.

## Distribuições de frequência

Uma **distribuição de frequência** é um agrupamento de dados em classes, exibindo o número ou porcentagem de observações em cada classe.

**Distribuição de frequência para dados contínuos**

Para construir uma distribuição de frequências para dados contínuos, podemos:

1. Estabelecer as classes ou intervalos de grupamento dos dados;
2. Enquadrar os dados nas classes mediante contagem;
3. Contar o número em cada classe;
4. Apresentar os dados.

**Exemplo:**

Construa uma distribuição de frequências das seguintes idades: 25, 30, 69, 18, 24, 28, 44, 36, 19.

1. Vamos organizar os dados em 3 classes: Até 29, de 30 a 60 e acima de 60.
2. Fazendo as contagens: Até 29: 5 casos. De 30 a 60: 3 casos. Acima de 60: 1 caso.
3. Construindo a tabela ou a visualização:

| Classe | Observações | Percentual | Perc. Acumulado |
|--------|-------------|------------|-----------------|
| Até 29 | 5 |  55.56%| 55.56% |
| De 30 a 60 | 3 | 33.33% | 88.89% |
| Acima de 60 | 1 | 11.11% | 100.00% |
| Total | 9 | 100.00% | |
"

# ╔═╡ fdc8ec64-718e-11eb-2a7f-436a6d355827
begin
	x = ["Até 29", "De 30 a 60", "Acima de 60"]
	y = [5,3,1]
	bar(x,y, legend=false)
	title!("Gráfico de barras")
end

# ╔═╡ 0d60bce4-718f-11eb-1b6d-9bd4da44c997
md"Podemos utilizar um histograma para obter a distribuição de frequências de uma variável contínua."

# ╔═╡ 2ebe48fa-718f-11eb-07b8-9b7a8ee946fb
begin
	# Gerando 1000 números com distribuição normal
	a = randn(1000)
	histogram(a, legend=false)
	title!("Histograma")
end

# ╔═╡ 5aeedaae-718f-11eb-19b7-f58ff45a6a52
begin
	# Para representar o mesmo conjunto de dados como uma distribuição contínua, usamos um gráfico de densidade
	density(a, legend=false)
	title!("Density plot")
end

# ╔═╡ 769bd696-7190-11eb-1bc3-eb7374da99a8
md"
#### Exercícios

Stevenson (1981, p. 51-52), exercícios suplementares 1, 2, 3, 4, 7, 8 e 10
"

# ╔═╡ Cell order:
# ╟─4d46e022-718d-11eb-0c17-d190a6c15f38
# ╠═f2844fd8-718e-11eb-342d-c58b517f2e86
# ╠═fdc8ec64-718e-11eb-2a7f-436a6d355827
# ╟─0d60bce4-718f-11eb-1b6d-9bd4da44c997
# ╠═23f76dac-718f-11eb-0438-4fb9d095a36d
# ╠═2ebe48fa-718f-11eb-07b8-9b7a8ee946fb
# ╠═41c8aa14-718f-11eb-045b-c76ae39916bc
# ╠═5aeedaae-718f-11eb-19b7-f58ff45a6a52
# ╟─769bd696-7190-11eb-1bc3-eb7374da99a8
