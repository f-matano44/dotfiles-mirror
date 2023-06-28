/**
 * atcoder template in Java @ MIT License
 * Copyright 2023 Fumiyoshi MATANO
 */

import java.util.*;
import java.io.*;
import java.math.BigDecimal;
import java.math.BigInteger;

public class Main {
    public static void main(String[] args) {
        try (final var pw = new PrintWriter(System.out)) {
            byte check = -1;

            try (final var sc = new MyScanner(System.in)) {
                // solve ここから

                // solve ここまで
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


    private static final class MyScanner implements AutoCloseable {
        private Scanner sc;

        public MyScanner(InputStream in) {
            this.sc = new Scanner(in);
        }

        @Override
        public void close() {
            sc.close();
        }

        public String next() {
            return sc.next();
        }

        public int nextInt() {
            return Integer.parseInt(sc.next());
        }

        public long nextLong() {
            return Long.parseLong(sc.next());
        }

        public BigInteger nextBigInteger() {
            return new BigInteger(sc.next());
        }

        public double nextDouble() {
            return Double.parseDouble(sc.next());
        }

        public BigDecimal nextBigDecimal(){
            return new BigDecimal(sc.next());
        }
    }
}