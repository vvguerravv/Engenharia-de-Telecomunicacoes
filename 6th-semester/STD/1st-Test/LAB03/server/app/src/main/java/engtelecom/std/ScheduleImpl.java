package engtelecom.std;

import engtelecom.std.agenda.AgendaGrpc;
import engtelecom.std.agenda.Pessoa;
import engtelecom.std.agenda.Resposta;
import io.grpc.stub.StreamObserver;

import java.util.HashMap;

public class ScheduleImpl extends AgendaGrpc.AgendaImplBase {

    private HashMap<Integer,Pessoa> schedule = new HashMap<>();

    @Override
    public void adicionar(Pessoa request, StreamObserver<Resposta> responseObserver) {

        String message = "Add successfully";

        if (!this.schedule.containsKey(request.getId())) {
            this.schedule.put(request.getId(),request);
        } else {
            message = String.format("%d já existe",request.getId());
        }

        Resposta answer = Resposta.newBuilder().setResultado(message).build();

        responseObserver.onNext(answer);
        responseObserver.onCompleted();
    }

    @Override
    public void buscar(Pessoa request, StreamObserver<Pessoa> responseObserver) {

        Pessoa p = this.schedule.get(request.getId());

        responseObserver.onNext(p);
        responseObserver.onCompleted();

    }
}
