package q2;

// Solucao com Monitor (synchronized).
// Thread.sleep(0) dentro da secao critica para forcar troca de contexto:
// como o lock do monitor nao e liberado durante o sleep, o resultado continua
// correto (180), evidenciando a robustez do monitor.
public class ContaMonitor {

    private static class Conta {
        private int saldo = 100;

        public synchronized void depositar(int valor) {
            int temp = saldo;
            try { Thread.sleep(0); }            // dica de troca de contexto
            catch (InterruptedException e) { Thread.currentThread().interrupt(); }
            temp += valor;
            saldo = temp;
        }

        public synchronized int getSaldo() { return saldo; }
    }

    public static void main(String[] args) throws InterruptedException {
        Conta conta = new Conta();

        Thread t1 = new Thread(() -> conta.depositar(50));
        Thread t2 = new Thread(() -> conta.depositar(30));

        t1.start(); t2.start();
        t1.join();  t2.join();

        System.out.println("[Monitor/synchronized]");
        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido:   " + conta.getSaldo());
    }
}
