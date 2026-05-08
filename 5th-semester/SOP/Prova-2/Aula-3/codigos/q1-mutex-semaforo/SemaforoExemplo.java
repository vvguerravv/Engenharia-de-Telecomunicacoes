package q1;

import java.util.concurrent.Semaphore;

// Equivalente em Java do m5-semaforo.c
// sem_t          ->  Semaphore
// sem_init(&s,0,1)  ->  new Semaphore(1)   (1 vaga = exclusao mutua)
// sem_wait()        ->  s.acquire()
// sem_post()        ->  s.release()
public class SemaforoExemplo {

    private static final int NUM_THREADS = 100;
    private static final int NUM_STEPS   = 100_000;

    private static int sum = 0;
    private static final Semaphore s = new Semaphore(1);

    public static void main(String[] args) throws InterruptedException {
        Thread[] threads = new Thread[NUM_THREADS];
        long expected = (long) NUM_THREADS * NUM_STEPS;

        for (int i = 0; i < NUM_THREADS; i++) {
            threads[i] = new Thread(() -> {
                for (int k = 0; k < NUM_STEPS; k++) {
                    try {
                        s.acquire();
                        try {
                            sum += 1;
                            if (sum % 1_000_000 == 0) {
                                System.out.println("Sum: " + sum);
                            }
                        } finally {
                            s.release();
                        }
                    } catch (InterruptedException e) {
                        Thread.currentThread().interrupt();
                        return;
                    }
                }
            });
            threads[i].start();
        }

        for (Thread t : threads) t.join();

        System.out.println("\n--- Resultado: Semaphore (1 vaga) ---");
        System.out.println("Valor esperado: " + expected);
        System.out.println("Valor obtido:   " + sum);
        System.out.println("Diferenca:      " + (expected - sum));
    }
}
