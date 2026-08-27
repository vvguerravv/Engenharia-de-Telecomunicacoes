# Apresentação: Materiais semicondutores em telecomunicações

Documento principal do seminário de Química nas Telecomunicações, compartilhado
no Overleaf entre Victor Guerra e Alisson Pereira.

Divisão combinada: Victor nos tópicos ímpares (1, 3, 5 e 7), Alisson nos pares
(2, 4 e 6). Os tópicos pares já estão no lugar com a capa de seção; é só
escrever os slides dentro do `.tex` da pasta correspondente.

## Compilar

```bash
make
```

Isso roda o `pdflatex` duas vezes (a segunda é para o sumário) e apaga os
arquivos intermediários em seguida. Para limpar manualmente: `make clean`.

No Overleaf, basta subir a pasta e definir `apresentacao.tex` como documento
principal, com compilador **pdfLaTeX**.

## Organização

| Caminho | Conteúdo |
|---|---|
| `apresentacao.tex` | Metadados e ordem das seções. Só isso. |
| `preambulo/tema.tex` | Aparência: tema metropolis e paleta de cores. |
| `preambulo/macros.tex` | Comandos próprios (`\qui`, `\un`, `\termo`, `\gancho`). |
| `topicos/00-introducao/` | Abertura |
| `topicos/01-o-que-sao/` | Tópico 1, Victor |
| `topicos/02-estrutura-quimica/` | Tópico 2, Alisson (a escrever) |
| `topicos/03-pureza/` | Tópico 3, Victor |
| `topicos/04-ligacoes-quimicas/` | Tópico 4, Alisson (a escrever) |
| `topicos/05-reacoes-quimicas/` | Tópico 5, Victor |
| `topicos/06-aplicabilidade/` | Tópico 6, Alisson (a escrever) |
| `topicos/07-valores-comerciais/` | Tópico 7, Victor |
| `topicos/08-encerramento/` | Conclusão e slide final |
| `referencias/referencias.tex` | Slide de referências |
| `referencias/referencias.bib` | As mesmas referências em BibTeX |
| `figuras/` | Imagens, se forem adicionadas |

Cada tópico está isolado em uma pasta: para mexer em um deles, edite apenas o
`.tex` correspondente. Para incluir ou remover um tópico, basta acrescentar ou
comentar o `\input` respectivo em `apresentacao.tex`.

Como cada tópico é um arquivo separado, os dois podem editar ao mesmo tempo no
Overleaf sem conflito: quem escreve o tópico 3 mexe apenas em
`topicos/03-pureza/pureza.tex`.

## Comandos disponíveis

| Comando | Efeito |
|---|---|
| `\qui{SiO_2}` | Fórmula química com índices |
| `\seta` | Seta de reação |
| `\un{45}{meV}` | Valor com unidade |
| `\grau{1100}` | Temperatura em graus Celsius |
| `\termo{texto}` | Termo-chave em destaque |
| `\gancho{texto}` | Caixa "por que isso importa em Telecom" |
| `\fonte{texto}` | Citação da fonte no rodapé do slide |
| `\atomo{x}{y}{cor}{Si}` | Átomo nos diagramas TikZ |

## Paleta

As três cores em `preambulo/tema.tex` (`mPrimary`, `mPrimaryLight`,
`mPrimaryDark`) definem a identidade visual inteira; `mAccent` é a cor de
contraste usada nos diagramas.

## Tempo

A entrega pede **no mínimo 15 e no máximo 20 minutos** para a dupla. O alvo
razoável é fechar em **17 minutos**, que deixa margem para atrasar sem
estourar. Orçamento por seção:

| # | Seção | Quem | Slides | Tempo |
|---|---|---|---|---|
| | Capa e sumário | Victor | 2 | 0:30 |
| | Introdução | Victor | 1 | 1:00 |
| 1 | O que são esses materiais? | Victor | 3 | 2:15 |
| 2 | Estrutura química | Alisson | 3 | 2:15 |
| 3 | Pureza dos materiais | Victor | 2 | 1:30 |
| 4 | Ligações químicas | Alisson | 3 | 2:45 |
| 5 | Reações químicas | Victor | 3 | 2:15 |
| 6 | Aplicabilidade | Alisson | 3 | 2:15 |
| 7 | Valores comerciais | Victor | 2 | 1:30 |
| | Fechando o ciclo | Victor | 1 | 0:45 |
| | Referências | | 1 | não se fala |
| | **Total** | | **24** | **17:00** |

Isso dá **9:45 para o Victor** e **7:15 para o Alisson**. A diferença é
natural: o Victor tem quatro tópicos mais a abertura e o fechamento, já que o
tópico 7 é o último antes da conclusão.

O ritmo médio é de **45 segundos por slide**. Não dá para ler o slide inteiro
em voz alta nesse tempo: o texto é apoio, a fala é o resumo.

### O que já está pronto e o que falta

Os tópicos ímpares estão fechados em **10 slides de conteúdo**, mais a
introdução e a conclusão, o que bate com os 9:45. Os pares ainda não têm
slides. Para não estourar o limite, o Alisson precisa ficar em **9 slides no
total** entre os três tópicos dele, ou seja, 3 por tópico. Cada slide a mais
custa cerca de 45 segundos.

O tópico 4 tem 30 segundos a mais no orçamento porque é onde entra a
**junção PN**, que o enunciado pede explicitamente.

### Slides que costumam atrasar

- **A família dos semicondutores** (tópico 1) e **O preço da pureza**
  (tópico 7): tabelas de 6 linhas. Comentar duas ou três e seguir, não ler
  linha por linha.
- **Reações na fabricação do dispositivo** (tópico 5): três equações em um
  slide só. Vale dizer o que cada uma faz, sem soletrar coeficientes.

### Antes de apresentar

Cronometrar uma passada completa em voz alta, com o Alisson. Se passar de 18
minutos, o corte mais barato é o slide de contaminantes do tópico 3, que pode
virar uma frase dentro do slide anterior.
