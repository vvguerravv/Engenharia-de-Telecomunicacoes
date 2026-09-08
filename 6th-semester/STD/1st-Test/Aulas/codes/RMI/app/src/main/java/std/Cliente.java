package std;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class Cliente {

    public static void main(String[] args) throws Exception {
// Obtendo referência para o registro (tem que conhecer IP e porta)
        Registry registro = LocateRegistry.getRegistry("localhost", 1099);
// Obtendo referência para o objeto instanciado pelo Servidor
        ContadorDistribuido stub = (ContadorDistribuido) registro.lookup("MeuContador");
// invocando métodos do objeto remoto
        System.out.println("valor: " + stub.obtemValor());
        stub.incrementa();
        System.out.println("valor: " + stub.obtemValor());
        System.out.println("Nome: " + stub.obtemNome());
    }
}
