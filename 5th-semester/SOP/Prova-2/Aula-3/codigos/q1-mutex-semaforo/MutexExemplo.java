package q1;

import java.util.concurrent.locks.ReentrantLock;

// Equivalente em Java do m8-mutex.c
// pthread_mutex_t  ->  ReentrantLock
// pthread_mutex_lock()   ->  lock.lock()
// pthread_mutex_unlock() ->  lock.unlock()
public class MutexExemplo {

    private static final int NUM_THREADS = 100;
    private static final int NUM_STEPS   = 100_000;

    private static int sum = 0;
    private static final ReentrantLock lock = new ReentrantLock();

    public static void main(String[] args) throws InterruptedException {
        Thread[] threads = new Thread[NUM_THREADS];
        long expected = (long) NUM_THREADS * NUM_STEPS;

        for (int i = 0; i < NUM_THREADS; i++) {
            final long myId = i;
            threads[i] = new Thread(() -> {
                for (int k = 0; k < NUM_STEPS; k++) {
                    lock.lock();
                    try {
                        sum += 1;
                        if (sum % 1_000_000 == 0) {
                            System.out.println("Thread " + myId + " incrementou. Sum: " + sum);
                        }
                    } finally {
                        lock.unlock();
                    }
                }
            });
            threads[i].start();
        }

        for (Thread t : threads) t.join();

        System.out.println("\n--- Resultado: ReentrantLock (Mutex) ---");
        System.out.println("Valor esperado: " + expected);
        System.out.println("Valor obtido:   " + sum);
        System.out.println("Diferenca:      " + (expected - sum));
    }
}
