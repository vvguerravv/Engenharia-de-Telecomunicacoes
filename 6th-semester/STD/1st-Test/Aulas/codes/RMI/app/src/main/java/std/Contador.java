package std;

import java.rmi.RemoteException;

public class Contador implements ContadorDistribuido{

    public int value = 0;
    public String name = "Guerra";

    @Override
    public void incrementa() throws RemoteException {
        this.value++;
    }

    @Override
    public int obtemValor() throws RemoteException {
        return this.value;
    }

    @Override
    public String obtemNome() throws RemoteException {
        return this.name;
    }
}