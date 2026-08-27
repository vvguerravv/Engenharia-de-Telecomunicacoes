package engtelecom.std;

import module java.base;


public record AssistClient(Socket clientSocket) implements Runnable {

    @Override
    public void run() {
        try {
            var clientAddress = clientSocket.getInetAddress().getHostAddress();
            var clientPort = clientSocket.getPort();

            System.out.printf("Client connected: %s:%d%n", clientAddress, clientPort);


//          Here we are realizing the establishment of the IO flow
            var reader = new BufferedReader(
                    new InputStreamReader(clientSocket.getInputStream(), StandardCharsets.UTF_8)
            );

            var writer = new BufferedWriter(
                    new OutputStreamWriter(clientSocket.getOutputStream(), StandardCharsets.UTF_8)
            );

//          Communication Protocol
            String message = "";

            writer.write("====== WELCOME TO SERVER ======");
            writer.newLine();
            writer.flush();

            while(!message.toLowerCase().equals("sair")){
                message = reader.readLine();

                if(message == null) break;

                System.out.printf("[%s:%d] -> %s\n", clientAddress, clientPort, message);

                writer.write(message.toUpperCase());
                writer.newLine();
                writer.flush();
            }

            writer.write("====== GOODBYE ======");
            writer.newLine();
            writer.flush();

            IO.println("End communication with client "+ clientAddress + ":"+ clientPort);
            reader.close();
            writer.close();
        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }

}
