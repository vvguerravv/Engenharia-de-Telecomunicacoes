package q2;

import java.util.concurrent.Semaphore;

// Solucao com Semaforo binario (1 vaga = exclusao mutua).
public class ContaSemaforo {

    private static int saldo = 100;
    private static final Semaphore s = new Semaphore(1);

    private static void depositar(int valor) {
        try {
            s.acquire();
            try {
                int temp = saldo;
                try { Thread.sleep(0, 100_000); }
                catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                temp += valor;
                saldo = temp;
            } finally {
                s.release();
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new Thread(() -> depositar(50));
        Thread t2 = new Thread(() -> depositar(30));

        t1.start(); t2.start();
        t1.join();  t2.join();

        System.out.println("[Semaphore]");
        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido:   " + saldo);
    }
}
