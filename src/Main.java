
import server.ExamServer;

import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        try {
            ExamServer server = new ExamServer("localhost", 9889);
            server.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}