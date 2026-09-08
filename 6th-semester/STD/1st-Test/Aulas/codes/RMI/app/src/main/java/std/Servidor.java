package std;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;

public class Servidor {

    public static void main(String[] args) throws Exception {

        Contador c = new Contador(); // criando objeto

// 0, indica para JVM escolher uma porta aleatória
        ContadorDistribuido stub = (ContadorDistribuido) UnicastRemoteObject.exportObject(c, 0);

// Criando registry. Substitua o IP pelo endereço do seu computador
        System.setProperty("java.rmi.server.hostname", "0.0.0.0");

        Registry registro = LocateRegistry.createRegistry(1099);
// Registrando objeto com o nome MeuContador
        registro.rebind("MeuContador", stub);
        System.out.println("Servidor pronto!");
    }
}
