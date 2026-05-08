package q2;

import java.util.concurrent.locks.ReentrantLock;

// Solucao com Mutex (ReentrantLock).
public class ContaMutex {

    private static int saldo = 100;
    private static final ReentrantLock lock = new ReentrantLock();

    private static void depositar(int valor) {
        lock.lock();
        try {
            int temp = saldo;
            try { Thread.sleep(0, 100_000); }
            catch (InterruptedException e) { Thread.currentThread().interrupt(); }
            temp += valor;
            saldo = temp;
        } finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new Thread(() -> depositar(50));
        Thread t2 = new Thread(() -> depositar(30));

        t1.start(); t2.start();
        t1.join();  t2.join();

        System.out.println("[Mutex/ReentrantLock]");
        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido:   " + saldo);
    }
}
