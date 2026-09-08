package std;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface ContadorDistribuido extends  Remote{

    public void incrementa() throws RemoteException;
    public int obtemValor() throws RemoteException;
    public String obtemNome() throws RemoteException;
}