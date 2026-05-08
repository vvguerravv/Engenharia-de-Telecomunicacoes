# Limitações dos Semáforos

> Resposta da questão 4 da Etapa 1 — Lab. Parte II / Aula 03.

Semáforos (Dijkstra, 1965) são primitivas poderosas, mas de baixo nível. As
limitações abaixo são amplamente discutidas em livros como Tanenbaum
(Modern Operating Systems) e Silberschatz (Operating System Concepts).

## 1. Falta de associação explícita entre semáforo e recurso
Um semáforo é apenas um inteiro com `wait()`/`signal()`. Nada na linguagem
indica *qual* dado ele protege. Se um programador esquecer de adquirir o
semáforo antes de tocar no recurso, **o compilador não acusa**. A correção
fica totalmente a cargo da disciplina humana.

> Esta é a principal motivação para a criação do conceito de **Monitor**
> (Hoare, 1974), no qual a região crítica e os dados são encapsulados.

## 2. Inversão de `wait()` e `signal()`
Trocar a ordem (`signal` antes do `wait`, ou esquecer um `signal` no caminho
de erro) gera comportamentos catastróficos:
- `wait` esquecido → race condition silenciosa.
- `signal` esquecido → deadlock; threads dormem para sempre.
- Dois `wait` no lugar de `wait`+`signal` → deadlock duplo.

## 3. Deadlock por ordem de aquisição
Quando uma tarefa precisa de **mais de um** semáforo, a ordem de aquisição
importa. Um clássico é o jantar dos filósofos: cada um pega o garfo da
esquerda e tenta pegar o da direita; todos travam. Semáforos não impõem
nenhuma disciplina de ordem.

## 4. Starvation (inanição)
Sem uma política de fila justa (FIFO, "fairness"), uma thread pode ficar
indefinidamente sem ser acordada quando há disputa. Em Java, isso é mitigado
com `new Semaphore(n, true)` (modo justo) — note que isso reduz throughput.

## 5. Inversão de prioridade
Uma thread de baixa prioridade que detém um semáforo pode bloquear uma de
alta prioridade que precisa do mesmo recurso (caso famoso: Mars Pathfinder,
1997). A solução exige protocolos como *priority inheritance*, externos ao
semáforo padrão.

## 6. Difícil composição
Operações compostas (ex.: "transferir entre duas contas atomicamente") não
são naturais com semáforos. Forçam padrões repetitivos e propensos a erro.
Locks reentrantes e monitores compõem melhor.

## 7. Não-reentrância
Semáforos POSIX não são reentrantes: a mesma thread, ao tentar dar dois
`wait` no mesmo semáforo binário, trava em si mesma. (Em Java, o
`Semaphore` segue o mesmo princípio; quem precisa de reentrância deve usar
`ReentrantLock` ou `synchronized`.)

## 8. Espera ocupada em implementações ingênuas
Semáforos pedagógicos implementados em user-space costumam virar `while
(s==0);` (busy wait). Implementações reais usam suporte do SO (filas de
bloqueio), mas o conceito ainda exige cuidado em código de baixo nível.

## 9. Ausência de espera por condição complexa
Semáforos sinalizam apenas "há vaga / não há vaga". Para condições como
"buffer com pelo menos 3 itens *e* horário antes das 18h" o programador
precisa combinar vários semáforos — propenso a erros. Variáveis de
condição (`wait`/`notify`) ou monitores resolvem com mais clareza.

---

## Resumo do que essas limitações podem provocar
| Falha de uso              | Consequência                              |
|---------------------------|--------------------------------------------|
| Esquecer `wait`           | Condição de disputa, dados corrompidos    |
| Esquecer `signal`         | Deadlock                                   |
| Ordem inversa de locks    | Deadlock circular                          |
| Sem fairness              | Starvation                                 |
| Prioridades sem protocolo | Inversão de prioridade                     |
| Recurso não encapsulado   | Bug invisível para o compilador            |

## Conclusão
Semáforos são suficientes em teoria (qualquer problema de sincronização
pode ser resolvido com eles), mas perigosos na prática. Por isso linguagens
modernas — Java incluída — oferecem mecanismos de mais alto nível
(`synchronized`/monitor, `ReentrantLock`, `BlockingQueue`,
`CountDownLatch`, `CyclicBarrier`, `Phaser`) que encapsulam semáforos e
mitigam essas armadilhas.

## Referências
- Tanenbaum, A. *Modern Operating Systems*, 4ª ed., cap. 2.
- Silberschatz, A. *Operating System Concepts*, 10ª ed., cap. 6 e 7.
- Hoare, C.A.R. "Monitors: An operating system structuring concept",
  *CACM* 17(10), 1974.
- Dijkstra, E.W. "Cooperating Sequential Processes", 1965.
