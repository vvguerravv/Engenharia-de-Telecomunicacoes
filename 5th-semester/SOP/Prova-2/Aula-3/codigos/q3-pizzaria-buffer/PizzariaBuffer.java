package q3;

// Cenarios para teste (mude as constantes abaixo):
//  - COZINHEIRO_LENTO=true  -> entregador frequentemente espera (estoque vazio)
//  - COZINHEIRO_LENTO=false -> cozinheiro estoca ate CAP=2 e espera o entregador
//
// Observacoes:
//  - Os tempos de cozinhar/entregar sao alterados via Thread.sleep(ms).
//  - Em sleeps muito pequenos (~0 ms) e possivel ver as filas crescendo/encolhendo
//    rapidamente conforme as preferencias de escalonamento da JVM.
public class PizzariaBuffer {

    // Pode ser ajustado via:  -DcozinheiroLento=true|false
    private static final boolean COZINHEIRO_LENTO =
        Boolean.parseBoolean(System.getProperty("cozinheiroLento", "false"));

    public static void main(String[] args) {
        MesaBuffer mesa = new MesaBuffer();

        String[] cardapio = {
            "Calabresa", "Mussarela", "Portuguesa",
            "Quatro-Queijos", "Frango-Catupiry", "Margherita"
        };

        long tCozinhar = COZINHEIRO_LENTO ? 1500 : 200;
        long tEntregar = COZINHEIRO_LENTO ?  200 : 1500;

        Thread cozinheiro = new Thread(() -> {
            try {
                for (String p : cardapio) {
                    mesa.colocarPizza(p);
                    Thread.sleep(tCozinhar);
                }
            } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        }, "Cozinheiro");

        Thread entregador = new Thread(() -> {
            try {
                for (int i = 0; i < cardapio.length; i++) {
                    mesa.retirarPizza();
                    Thread.sleep(tEntregar);
                }
            } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
        }, "Entregador");

        cozinheiro.start();
        entregador.start();

        try {
            cozinheiro.join();
            entregador.join();
        } catch (InterruptedException e) { Thread.currentThread().interrupt(); }

        System.out.println("\nFim do expediente. (cozinheiro_lento=" + COZINHEIRO_LENTO + ")");
    }
}
