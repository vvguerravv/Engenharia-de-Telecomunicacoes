# Atividade --- Condição de Disputa (Aula 03 / Parte II)

**Aluno:** Vinicius Guerra
**Disciplina:** Sistemas Operacionais --- IFSC São José
**Professor:** Rogério Pereira Junior

## Estrutura

```
atividade/
├── codigos/
│   ├── 0_problema.c       # Código original (race condition)
│   ├── 1_alternancia.c    # Solução: Alternância de Uso
│   ├── 2_peterson.c       # Solução: Algoritmo de Peterson
│   ├── 3_tsl.c            # Solução: TSL (Test-and-Set Lock)
│   └── Makefile
├── saidas/
│   ├── 0_problema.log     # Log de 10 execuções com race
│   ├── 1_alternancia.log  # Log de 10 execuções resolvidas
│   ├── 2_peterson.log     # Log de 10 execuções resolvidas
│   └── 3_tsl.log          # Log de 10 execuções resolvidas
├── documento.tex          # Fonte LaTeX
├── documento.pdf          # Documento final com capturas de tela
└── README.md
```

## Como compilar e executar

```bash
cd codigos
make
./0_problema       # mostra o problema
./1_alternancia    # solução 1
./2_peterson       # solução 2
./3_tsl            # solução 3
```

Para reproduzir as 10 execuções:

```bash
for i in $(seq 1 10); do ./3_tsl | tail -1; done
```

## Resultado

- **Problema original:** saldo final varia entre 130 e 150 (race exposta).
- **Três soluções:** saldo final = 180 em todas as 10 execuções.
