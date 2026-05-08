package q1;

import java.util.concurrent.Semaphore;

// Equivalente em Java do m6-semaforo.c
// Semaforo contador: limita N acessos simultaneos a um recurso.
public class BancoConexoes {

    private static final int MAX_CONEXOES   = 3;
    private static final int TOTAL_THREADS  = 10;

    // Permite 3 acessos simultaneos. fairness=true => ordem FIFO.
    private static final Semaphore bancoDados = new Semaphore(MAX_CONEXOES, true);

    public static void main(String[] args) throws InterruptedException {
        System.out.println("Iniciando simulacao. Limite de conexoes: " + MAX_CONEXOES + "\n");

        Thread[] threads = new Thread[TOTAL_THREADS];
        for (int i = 0; i < TOTAL_THREADS; i++) {
            final long id = i;
            threads[i] = new Thread(() -> {
                System.out.println("[Thread " + id + "] Tentando conectar ao banco...");
                try {
                    bancoDados.acquire();
                    try {
                        System.out.println("  >>> [Thread " + id + "] CONECTADA. (Usando 1 de " + MAX_CONEXOES + " vagas)");
                        Thread.sleep(2000);
                        System.out.println("  <<< [Thread " + id + "] Desconectando e liberando vaga...");
                    } finally {
                        bancoDados.release();
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
            threads[i].start();
        }

        for (Thread t : threads) t.join();
        System.out.println("\nSimulacao finalizada.");
    }
}
