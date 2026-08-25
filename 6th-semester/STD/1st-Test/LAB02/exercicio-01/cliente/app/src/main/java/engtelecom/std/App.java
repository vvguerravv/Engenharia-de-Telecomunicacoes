
package engtelecom.std;

import module java.base;

public class App {

    public static void main(String[] args) {

        String host = "localhost";
        int port = 1234;

        if (args.length == 2){
            host = args[0];
            port = Integer.parseInt(args[1]);
        }

        try (var socket = new Socket(host,port);

             var reader = new BufferedReader(
                     new InputStreamReader(socket.getInputStream(), StandardCharsets.UTF_8)
             );

             var writer = new BufferedWriter(
                     new OutputStreamWriter(socket.getOutputStream(), StandardCharsets.UTF_8)
            )) {

            IO.println("Connected in server...");

//          Communication Protocol
            
            writer.write("Hello, I'm the client!");
            writer.newLine();
            writer.flush();

            String answer = reader.readLine();

            System.out.printf("Server answer: %s\n", answer);

            IO.println("End client");


        } catch (Exception e) {
            System.err.println("Error: " + e);
        }




    }
}
