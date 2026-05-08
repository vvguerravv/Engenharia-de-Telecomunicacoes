package q3;

import java.util.LinkedList;
import java.util.Queue;

// Mesa agora e um buffer com capacidade CAP (estoque de ate 2 pizzas).
// Produtor (Cozinheiro): bloqueia se a fila estiver cheia.
// Consumidor (Entregador): bloqueia se a fila estiver vazia.
class MesaBuffer {

    public static final int CAP = 2;

    private final Queue<String> fila = new LinkedList<>();

    public synchronized void colocarPizza(String pizza) throws InterruptedException {
        while (fila.size() == CAP) {                       // fila cheia -> espera
            System.out.println("  [!] Cozinheiro esperando: mesa cheia (" + fila.size() + "/" + CAP + ")");
            wait();
        }
        fila.add(pizza);
        System.out.println("Cozinheiro colocou: " + pizza + "  (estoque=" + fila.size() + "/" + CAP + ")");
        notifyAll();                                       // acorda todos os esperando
    }

    public synchronized String retirarPizza() throws InterruptedException {
        while (fila.isEmpty()) {                           // fila vazia -> espera
            System.out.println("  [!] Entregador esperando: mesa vazia");
            wait();
        }
        String p = fila.poll();
        System.out.println("Entregador levou:   " + p + "  (estoque=" + fila.size() + "/" + CAP + ")");
        notifyAll();
        return p;
    }
}
