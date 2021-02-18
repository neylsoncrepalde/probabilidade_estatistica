### A Pluto.jl notebook ###
# v0.12.20

using Markdown
using InteractiveUtils

# ╔═╡ 2d5ed302-718b-11eb-2117-a5b4e2a07837
md"
# Probabilidade e Estatística - Ciência de Dados IMIH

### Prof. Dr. Neylson Crepalde

Conteúdo abordado: medidas de tendência central e medidas de dispersão.

**Principal fonte**:
STEVENSON, Wiliam J.; DE FARIAS, Alfredo Alves. *Estatística aplicada à administração.* São Paulo: Harper e Row do Brasil, 1981.

## Medidas de Dispersão

**Desvio médio** absoluto: é a média dos desvios dos valores a contar da média, ignorando-se o sinal de diferença.

$$DMA = \frac{\sum |x_i - \bar{x}|}{n}$$

#### Exemplo

Determine o desvio médio para o seguinte conjunto de números: 2,4,6,8,10.
"

# ╔═╡ b39d5fb2-718b-11eb-06d8-e5406e65ce09
# Função para média em Julia
function media(x)
    n = length(x)
    return sum(x) / n
end

# ╔═╡ 8dd75600-718b-11eb-0462-515de1ae7373
# Implementando uma funcao de desvio
function desvio(x)
    n = length(x)
    somatorio = 0
    for i in 1:n
        somatorio += abs(x[i] - media(x))
    end
    return somatorio / n
end

# ╔═╡ 90de844a-718b-11eb-0fa1-3d315525f375
begin
	numeros = [2,4,6,8,10]
	desvio(numeros)
end

# ╔═╡ 99a7261a-718b-11eb-0f8c-87ba6ed8b788
md"
**Variância**: é a média dos quadrados dos desvios dos valores a contar da média, calculada usando-se n-1 em lugar de n (variância amostral).

$${S_x}^2 = \frac{\sum (x_i - \bar{x})^2}{n-1}$$

#### Exemplo

Calcule a variância para o vetor 2, 4, 6, 8, 10.
"

# ╔═╡ fc37dcfa-718b-11eb-2cd9-1d00a2b56f4b
function variancia(x)
    n = length(x)
    somatorio = 0
    for i in 1:n
        somatorio += (x[i] - media(x))^2
    end
    return somatorio / (n-1)
end

# ╔═╡ 13ade53c-718c-11eb-08c1-db2e677cfd51
variancia([2,4,6,8,10])

# ╔═╡ 17bdfaae-718c-11eb-1e75-7f634b44ac99
md"
**Desvio Padrão**: é a raiz quadrada da variância. Formalmente:

$${S_x} = \sqrt{\frac{\sum (x_i - \bar{x})^2}{n-1} }$$

#### Exemplo

Calcule o desvio padrão da amostra 20, 5, 10, 15, 25.
"

# ╔═╡ 3586b8f0-718c-11eb-0cb7-2379bea0ad9c
desvio_padrao(x) = sqrt(variancia(x))

# ╔═╡ 44c69f74-718c-11eb-10ff-577e1d9554dd
desvio_padrao([20,5,10,15,25])

# ╔═╡ 4d91b026-718c-11eb-29ef-3546e15615d7
# Arredondando para dois dígitos (como no livro)
round(desvio_padrao([20,5,10,15,25]), digits=2)

# ╔═╡ 34094744-718d-11eb-1866-df4a1bc9a553
begin
	vari = variancia([20,5,10,15,25])
	raiz = sqrt(vari)
end

# ╔═╡ 517be33a-718c-11eb-0328-af7af769cff0
md"
Conferindo:

A variância do vetor: $vari

Raiz quadrada calculada da variância: $raiz

# Exercícios

Stevenson (1981, p. 30-31), exercícios 1, 2, 3, 5, 6, 7, 9, 10, 11
"

# ╔═╡ Cell order:
# ╟─2d5ed302-718b-11eb-2117-a5b4e2a07837
# ╠═b39d5fb2-718b-11eb-06d8-e5406e65ce09
# ╠═8dd75600-718b-11eb-0462-515de1ae7373
# ╠═90de844a-718b-11eb-0fa1-3d315525f375
# ╟─99a7261a-718b-11eb-0f8c-87ba6ed8b788
# ╠═fc37dcfa-718b-11eb-2cd9-1d00a2b56f4b
# ╠═13ade53c-718c-11eb-08c1-db2e677cfd51
# ╟─17bdfaae-718c-11eb-1e75-7f634b44ac99
# ╠═3586b8f0-718c-11eb-0cb7-2379bea0ad9c
# ╠═44c69f74-718c-11eb-10ff-577e1d9554dd
# ╠═4d91b026-718c-11eb-29ef-3546e15615d7
# ╠═34094744-718d-11eb-1866-df4a1bc9a553
# ╟─517be33a-718c-11eb-0328-af7af769cff0
