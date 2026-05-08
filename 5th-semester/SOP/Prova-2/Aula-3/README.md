# Atividade — Interação entre Tarefas / Parte II (Aula 03)

**Aluno:** Vinicius Guerra
**Disciplina:** Sistemas Operacionais — IFSC São José
**Professor:** Rogério Pereira Junior
**Data:** 2026-05-08

Resolução da Etapa 1 do Laboratório Parte II
([Aula_03___Laboratório___PARTE_II.pdf](../Aula_03___Laboratório___PARTE_II.pdf)),
reescrevendo em Java os exemplos C de mutex/semáforo do material
[SOP129005/03-interacao-tarefas](../SOP129005/03-interacao-tarefas).

## Estrutura

```
Aula-3/
├── codigos/
│   ├── q1-mutex-semaforo/
│   │   ├── MutexExemplo.java       # ReentrantLock  (equiv. m8-mutex.c)
│   │   ├── SemaforoExemplo.java    # Semaphore(1)   (equiv. m5-semaforo.c)
│   │   └── BancoConexoes.java      # Semaphore(3)   (equiv. m6-semaforo.c)
│   ├── q2-conta-bancaria/
│   │   ├── ContaProblema.java      # demonstra a race condition
│   │   ├── ContaMutex.java         # solução com ReentrantLock
│   │   ├── ContaSemaforo.java      # solução com Semaphore
│   │   └── ContaMonitor.java       # solução com synchronized + Thread.sleep(0)
│   ├── q3-pizzaria-buffer/
│   │   ├── MesaBuffer.java         # buffer Queue<String> com CAP=2
│   │   └── PizzariaBuffer.java     # ajustável por -DcozinheiroLento=true|false
│   ├── q4-limitacoes-semaforos/
│   │   └── LimitacoesSemaforo.md
│   └── Makefile
├── saidas/                         # logs das execuções
└── README.md
```

## Pré-requisitos

- JDK 11+ (testado em OpenJDK 21.0.10)
- `make`

## Como compilar e executar

```bash
cd codigos
make all                  # compila tudo em ./build

# Q1
make run-mutex            # MutexExemplo (100 threads * 100k incrementos)
make run-semaforo         # SemaforoExemplo
make run-banco            # BancoConexoes (3 vagas, 10 threads)

# Q2
make run-conta-problema   # mostra o race (saldo != 180)
make run-conta-mutex
make run-conta-semaforo
make run-conta-monitor    # Thread.sleep(0) dentro do synchronized

# Q3
java -DcozinheiroLento=false -cp build q3.PizzariaBuffer
java -DcozinheiroLento=true  -cp build q3.PizzariaBuffer
```

## Resumo das questões

### Q1 — Mutex e Semáforo em Java
Mapeamento direto dos protótipos POSIX:

| C (`pthread`/POSIX)           | Java (`java.util.concurrent`)        |
|------------------------------:|:-------------------------------------|
| `pthread_mutex_t lock;`       | `ReentrantLock lock = new ReentrantLock();` |
| `pthread_mutex_lock(&lock);`  | `lock.lock();`                       |
| `pthread_mutex_unlock(&lock);`| `lock.unlock();`                     |
| `sem_t s;` `sem_init(&s,0,N)` | `Semaphore s = new Semaphore(N);`    |
| `sem_wait(&s);`               | `s.acquire();`                       |
| `sem_post(&s);`               | `s.release();`                       |

Resultado: `MutexExemplo` e `SemaforoExemplo` chegam a `10 000 000`
(esperado), confirmando a correção. `BancoConexoes` mostra no máximo 3
threads conectadas simultaneamente.

### Q2 — Conta bancária
A versão sem proteção (`ContaProblema`) reproduz a race do `conta.c` —
`Thread.sleep(0, 100_000)` (100 µs) força a troca de contexto entre a
leitura e a escrita, o que faz o saldo final ficar em **130** em vez de
180. As três soluções (Mutex, Semáforo, Monitor) entregam **180** em todas
as 5 execuções registradas em `saidas/`. No `ContaMonitor` o
`Thread.sleep(0)` está dentro do `synchronized`: como o lock do monitor
não é liberado durante o sleep, o resultado segue correto.

### Q3 — Pizzaria com buffer
`MesaBuffer` substitui o "pizza única" da `Mesa.java` por uma fila
`LinkedList<String>` (`Queue`) com capacidade `CAP = 2`. Métodos usados
conforme pedido: `add`, `size`, `isEmpty`, `poll`. Sincronização via
`synchronized` + `wait()` / `notifyAll()`.

Cenários testados (via flag `-DcozinheiroLento`):

- **Cozinheiro rápido (200 ms vs 1500 ms)** — fila enche até 2 pizzas e o
  cozinheiro espera (`mesa cheia`).
- **Cozinheiro lento (1500 ms vs 200 ms)** — entregador quase sempre pega
  a pizza imediatamente e fica esperando (`mesa vazia`).

Logs em [saidas/q3-pizzaria-cozinheiro-rapido.log](saidas/q3-pizzaria-cozinheiro-rapido.log)
e [saidas/q3-pizzaria-cozinheiro-lento.log](saidas/q3-pizzaria-cozinheiro-lento.log).

### Q4 — Limitações dos semáforos
Texto completo em
[codigos/q4-limitacoes-semaforos/LimitacoesSemaforo.md](codigos/q4-limitacoes-semaforos/LimitacoesSemaforo.md).
Em síntese: ausência de associação entre semáforo e recurso, facilidade de
deadlock por ordem de aquisição, starvation sem fairness, inversão de
prioridade, não-reentrância e dificuldade de compor com condições
complexas — limitações que motivaram a criação dos monitores e dos locks
de mais alto nível.
