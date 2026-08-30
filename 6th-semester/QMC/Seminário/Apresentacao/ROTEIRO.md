# Roteiro de apresentação (Victor)

Guia dos meus slides: o que está em cada um, o que falar e onde é fácil
tropeçar. Tópicos ímpares (1, 3, 5 e 7), mais abertura e fechamento.

Tempo alvo: **9:45**. Ritmo de 45 segundos por slide.

---

## Antes de começar

Três regras que resolvem a maior parte dos problemas de apresentação:

1. **Não leia o slide.** O texto é para a plateia acompanhar. Sua fala é o
   resumo do que está escrito, com uma frase a mais que não está lá.
2. **Um número por slide.** Cada slide tem um número que impressiona. Diga
   esse e deixe os outros na tela para quem quiser ler.
3. **Termine cada tópico com a ligação com telecom.** É o quadro verde no
   rodapé de alguns slides. É o que justifica o seminário existir na
   Engenharia de Telecomunicações.

---

## Capa e sumário (0:30)

Apresente os dois nomes, o tema e a divisão. Algo como:

> Bom dia. Eu sou o Victor, esse é o Alisson, e o nosso tema é materiais
> semicondutores na fabricação de dispositivos de telecomunicações. São sete
> tópicos, eu apresento os ímpares e o Alisson os pares, alternando.

No sumário, não leia os sete títulos. Aponte a sequência: começamos pelo que
o material é, passamos pela fabricação e terminamos no preço.

---

## Introdução: "Do quartzo da praia ao 5G" (1:00)

**No slide:** três pontos e o roteiro do seminário em uma linha.

**O que falar:**

> Qualquer comunicação que a gente use hoje passa por um cristal
> semicondutor. O celular, a antena da operadora, o satélite, o roteador de
> casa. E a matéria-prima disso é areia, basicamente dióxido de silício.
>
> O que transforma areia em processador não é mecânica, é química. São três
> coisas: a estrutura do cristal, a pureza do material e a dopagem
> controlada. É exatamente isso que a gente vai percorrer.
>
> Para dar a escala do problema: um chip moderno tem dezenas de bilhões de
> transistores em poucos centímetros quadrados, e basta uma impureza no lugar
> errado para um deles não funcionar.

**Fechamento:** aponte o quadro do roteiro e diga que a apresentação segue
essa ordem, do material até o preço.

---

## Tópico 1: O que são esses materiais? (2:15)

### Slide "Nem conduz, nem isola"

**No slide:** cobre, vidro e silício comparados, mais o desenho com as faixas
de elétrons presos e soltos e o degrau entre elas.

**O que falar:**

> Para entender o que é um semicondutor, compare três materiais.
>
> No cobre, os elétrons estão soltos o tempo todo. Por isso ele conduz sempre,
> você não tem escolha.
>
> No vidro, todos os elétrons estão presos nas ligações químicas. Para soltar
> um você precisaria de uma energia enorme, então ele nunca conduz.
>
> No silício, os elétrons estão presos, mas o degrau para soltar é pequeno. Um
> pouco de calor, de luz ou uma tensão aplicada já solta alguns.

**A frase que fecha o slide:**

> E é aí que está a graça. O semicondutor é o único dos três em que nós
> escolhemos o quanto ele conduz. Sem isso não existiria eletrônica.

**Se perguntarem o que é esse degrau:** é a energia mínima para um elétron sair
de uma ligação química e passar a andar livre pelo cristal. No silício vale
cerca de 1,1 elétron-volt, e a energia térmica ambiente é de 0,025, então só
uns poucos conseguem.

### Slide "Sozinho o silício não serve"

**No slide:** o número do silício puro, a ideia de dopagem e os dois blocos de
fósforo e boro.

**O que falar:**

> Só que silício puro não serve para nada. Em silício puro, na temperatura
> ambiente, só um átomo a cada cinco trilhões solta um elétron. Ele conduz tão
> pouco que é quase um isolante.
>
> A solução é contraintuitiva: sujar o cristal de propósito. Isso se chama
> dopagem.
>
> O silício precisa de quatro elétrons para fechar as ligações com os vizinhos.
> Se você põe um fósforo no lugar de um silício, o fósforo tem cinco, então
> sobra um elétron livre. Isso é o tipo N.
>
> Se você põe um boro, que tem três, falta um elétron para fechar a ligação.
> Essa falta é o que a gente chama de lacuna, e ela também se move pelo
> cristal. Isso é o tipo P.

**O número deste slide:**

> E a proporção é impressionante: trocar um átomo em cada milhão aumenta a
> condutividade em cem mil vezes.

**Passe a bola:** diga que o detalhe das ligações e o que acontece quando você
junta um tipo P com um tipo N é o tópico do Alisson.

### Slide "Quem é quem na família"

**No slide:** tabela com Si, GaAs, GaN e InP.

**O que falar:**

> Semicondutor não é só silício. Essa tabela tem os quatro que interessam para
> telecom.
>
> O silício é o mais barato e está em praticamente todo chip.
>
> O arseneto de gálio tem degrau um pouco maior e é o que está no amplificador
> do seu celular.
>
> O nitreto de gálio tem degrau bem grande, de 3,4. Degrau grande significa
> que ele aguenta tensão alta sem conduzir sozinho, e por isso ele está nas
> antenas de 5G e nos carregadores rápidos.
>
> E o fosfeto de índio é o que emite luz no comprimento de onda da fibra
> óptica, 1550 nanômetros.

**Fechamento, apontando o quadro verde:**

> As duas bases são silício e gálio. O silício domina por ser barato, e o
> gálio entra onde é preciso trabalhar em alta frequência ou emitir luz.

---

## Tópico 3: Pureza dos materiais (1:30)

### Slide "Quão puro é puro?"

**No slide:** os 11N, a comparação em ppb e a tabela dos três graus.

**O que falar:**

> Agora, a pergunta é: quão puro esse silício precisa ser?
>
> A resposta é 11N, que significa onze noves. 99,999999999 por cento de
> pureza. Isso é menos de um átomo estranho para cada bilhão de átomos de
> silício.
>
> Para dar uma noção, é como dissolver um grão de açúcar numa piscina
> olímpica e conseguir provar a diferença.

**A tabela:** mostre que existem graus diferentes. O metalúrgico, de 98 por
cento, serve para liga metálica. O solar, de seis noves, para painel. O
eletrônico é o de onze noves.

**A explicação do porquê**, que está no rodapé:

> E o motivo é direto. A dopagem que a gente faz de propósito é de mais ou
> menos um átomo em um milhão. Se houver contaminante nessa mesma faixa, ele
> compete com o dopante e você perde o controle do material. A pureza existe
> para que a dopagem signifique alguma coisa.

### Slide "Contaminantes e as três etapas"

**No slide:** tabela de contaminantes à esquerda, as três etapas numeradas à
direita, e o quadro verde do amplificador.

**O que falar:**

> Nem todo contaminante incomoda igual. Metais como ferro e cobre são os
> piores, porque criam armadilhas no meio do cristal que capturam os
> portadores. Sódio e potássio, que vêm do suor da mão de quem manipula,
> deslocam a tensão de funcionamento do transistor.
>
> A purificação tem três etapas, e cada uma resolve um pedaço.
>
> Primeiro a redução, no forno a arco, que tira o oxigênio do quartzo e dá um
> silício de 98 por cento.
>
> Depois o processo Siemens, que transforma o silício em um gás, destila esse
> gás e devolve o silício sólido já purificado.
>
> E por último a cristalização, que além de formar o cristal ainda empurra as
> impurezas restantes para a ponta do lingote, que é cortada fora.

**Fechamento, o quadro verde:**

> E por que isso importa para telecom? Num amplificador de baixo ruído de
> estação rádio-base, cada impureza a mais é uma fonte de ruído a mais. Ruído
> maior significa alcance menor da célula.

**Cuidado:** não entre no `k = Cs/Cl`. Se perguntarem, é só a razão entre a
concentração de impureza no sólido e no líquido, e ela ser menor que um é o
que faz a impureza preferir ficar no líquido.

---

## Tópico 5: Reações químicas (2:15)

Este é o tópico mais técnico. A regra aqui é: **diga o que a reação faz, não
soletre a equação.**

### Slide "Da areia ao silício metalúrgico"

**No slide:** a equação da redução carbotérmica e três pontos.

**O que falar:**

> A primeira reação da cadeia toda é essa. Você pega quartzo, que é dióxido de
> silício, joga junto com carbono num forno a arco elétrico a dois mil graus, e
> o carbono rouba o oxigênio do silício.
>
> É uma oxirredução clássica: o carbono é o agente redutor, e o silício sai do
> estado de oxidação mais quatro para zero, ou seja, vira silício puro.

**O número deste slide:**

> Só que ela é fortemente endotérmica. Consome cerca de treze megawatt-hora
> por tonelada, o que é muita energia. Por isso a produção mundial se concentra
> em países com energia barata.

**Fechamento:**

> E o resultado ainda é um silício de 98 por cento, que é um bilhão de vezes
> mais sujo do que a gente precisa. Daí a próxima etapa.

### Slide "Processo Siemens"

**No slide:** duas equações, a clorinação e a deposição.

**O que falar:**

> Esse é o processo mais elegante da cadeia. A ideia é que é difícil purificar
> um sólido, mas é fácil purificar um gás por destilação.
>
> Então primeiro você faz o silício reagir com ácido clorídrico a trezentos
> graus e ele vira triclorossilano, que é um líquido que ferve a trinta e dois
> graus. Aí você destila, exatamente como se destila bebida, e separa as
> impurezas.
>
> Depois você faz a reação inversa, a mil e cem graus, e o silício ultrapuro
> se deposita de volta numa haste aquecida, formando um bastão.

**A frase que amarra:**

> Repare que a segunda equação é a primeira de trás para frente. O silício sai
> e volta, e no meio do caminho ele deixou a sujeira para trás.

**Se perguntarem por que os metais não vão junto:** porque ferro, cobre e
alumínio não formam cloretos voláteis nessa temperatura, então eles ficam para
trás no reator.

### Slide "Reações na fabricação do dispositivo"

**No slide:** três reações, oxidação, corrosão com HF e MOCVD.

**O que falar:**

> Com o wafer pronto, ainda tem química no processo de fabricação. Três
> exemplos.
>
> A oxidação térmica: você aquece o silício com oxigênio e cresce uma camada
> de vidro, dióxido de silício, sobre ele. Essa camada é o isolante do
> transistor, e é uma sorte enorme que o silício tenha um óxido tão bom. É um
> dos motivos de ele ter vencido o germânio.
>
> A corrosão com ácido fluorídrico: o HF dissolve o óxido e não ataca o
> silício. Isso permite desenhar o circuito, removendo óxido só onde você quer.
>
> E a epitaxia por MOCVD, que é como se fabrica o arseneto de gálio. Você joga
> dois gases sobre o substrato quente e eles depositam o cristal camada
> atômica por camada atômica.

**O ponto de segurança, que rende comentário:**

> Vale dizer que essa química é perigosa. A arsina, que é o gás de arsênio, é
> tóxica na casa de cinquenta partes por bilhão. Todo o processo é confinado e
> monitorado.

### Se der tempo apertado neste tópico

Corte o detalhe da oxidação e do HF e fique só com a frase "ainda tem química
depois do wafer, para criar o isolante e desenhar o circuito".

---

## Tópico 7: Valores comerciais (1:30)

### Slide "O preço da pureza"

**No slide:** tabela de preços do quartzo até o wafer de SiC.

**O que falar:**

> Agora, quanto custa tudo isso.
>
> O quartzo, que é a matéria-prima, custa centavos por quilo. É areia, tem em
> qualquer lugar.
>
> O silício metalúrgico, de 98 por cento, custa uns dois dólares o quilo. É
> commodity.
>
> E o polisilício de grau eletrônico, o de onze noves, custa entre vinte e
> cinco e sessenta dólares o quilo.

**O número deste slide:**

> Ou seja, do quartzo até o silício eletrônico o valor sobe cerca de mil vezes.
> E o que foi comprado nesse caminho não foi material, foi pureza.

Mostre também as duas últimas linhas: o wafer de arseneto de gálio custa umas
três vezes o de silício, e o de carbeto de silício ainda mais, porque é difícil
de crescer.

### Slide "Onde o valor se concentra"

**No slide:** o custo do wafer processado, a máscara, a fábrica, e o quadro do
mercado.

**O que falar:**

> Só que o wafer é a parte barata. Um wafer de trezentos milímetros custa cento
> e vinte dólares cru. Depois de processado numa fábrica moderna, ele sai por
> quinze a vinte mil dólares. Todo o valor está no processo, não no material.
>
> E a barreira de entrada é brutal. Só a máscara de fabricação de um nó de três
> nanômetros passa de vinte milhões de dólares, e uma fábrica de ponta custa de
> quinze a vinte bilhões. É por isso que existem poucas no mundo.

**O quadro do mercado:** o mercado global de semicondutores é de uns 630
bilhões de dólares por ano, e comunicações responde por cerca de 30 por cento
disso.

**Fechamento, o quadro verde, que é um bom gancho para atualidade:**

> E uma questão geopolítica interessante: o gálio não é minerado, ele é
> subproduto do refino da bauxita para fazer alumínio. Mais de noventa por
> cento da oferta mundial vem da China. Quando a China criou controles de
> exportação em 2023, o preço saltou de trezentos para mais de seiscentos
> dólares o quilo.

---

## Conclusão: "Fechando o ciclo" (0:45)

**No slide:** quatro pontos que amarram os meus tópicos.

**O que falar:** não leia os quatro. Diga a linha do raciocínio:

> Fechando: um semicondutor é um cristal cuja condução a gente aprendeu a
> controlar. Para esse controle existir, o material precisa ser absurdamente
> puro, porque a dopagem que faz o trabalho é de um átomo em um milhão. Chegar
> nessa pureza é uma sequência de reações químicas bem conhecidas, do forno a
> arco até a destilação. E o preço que se paga no fim não é pelo material, é
> pela pureza e pelo controle do processo.

Agradeça e abra para perguntas.

---

## Perguntas prováveis

| Pergunta | Resposta curta |
|---|---|
| Por que silício e não germânio? | O germânio conduz melhor, mas o óxido dele é solúvel em água e instável. O óxido do silício é um isolante excelente e cresce sozinho. Além disso o silício aguenta temperatura maior e é muito mais abundante. |
| Por que não purificar até 100 por cento? | Porque não é necessário e o custo explode. Onze noves já deixa o contaminante bem abaixo da dopagem intencional. |
| O que é ppb? | Partes por bilhão. Um átomo estranho a cada bilhão de átomos. |
| Czochralski ou zona flutuante? | Czochralski puxa o cristal de um banho fundido e é o método de volume. A zona flutuante não encosta em cadinho e dá pureza maior, mas é mais cara e limitada em diâmetro. |
| De onde vem o gálio? | Não existe minério de gálio. Ele é extraído como subproduto do refino da bauxita. |
| O Brasil produz? | Silício metalúrgico sim, o Brasil é um dos maiores produtores. Grau eletrônico e wafers, não. |

Se não souber, a resposta honesta funciona bem: "não sei, mas posso verificar
e te respondo".

---

## Ensaio

Cronometre uma passada completa em voz alta, sozinho, e depois uma com o
Alisson para acertar as transições. Marque nos seus slides onde você passa a
palavra para ele e onde retoma. As transições mal ensaiadas são o que mais
custa tempo em apresentação de dupla.
