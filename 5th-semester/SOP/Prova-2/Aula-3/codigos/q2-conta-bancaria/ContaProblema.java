package q2;

// Reproduz o conta.c original (sem protecao): exibe a race condition.
public class ContaProblema {

    private static int saldo = 100;

    private static void depositar(int valor) {
        int temp = saldo;                       // leitura
        try { Thread.sleep(0, 100_000); }       // 100 us  -- forca troca de contexto
        catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        temp += valor;                          // soma
        saldo = temp;                           // escrita
    }

    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new Thread(() -> depositar(50));
        Thread t2 = new Thread(() -> depositar(30));

        t1.start(); t2.start();
        t1.join();  t2.join();

        System.out.println("Saldo final esperado: 180");
        System.out.println("Saldo final obtido:   " + saldo);
    }
}
