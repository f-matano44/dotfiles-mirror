/**
 * atcoder template in Java @ MIT License
 * Copyright 2023 Fumiyoshi MATANO
 */

import java.util.*;
import java.io.*;

public class Main {
    public static void main(String[] args) {
        try (final var pw = new PrintWriter(System.out)) {
            byte check = -1;

            try (final var sc = new Scanner(System.in)) {
                // ここで処理を実行
            } catch (Exception e) {
                e.printStackTrace();
                System.exit(1);
            }

            if (check == 1) {
                pw.println("Yes");
            } else if (check == 0) {
                pw.println("No");
            } else /* check == -1 */ {
                // Nothing to do.
            }

            pw.flush();
        }
    }
}