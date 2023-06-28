import java.util.*;
import java.io.*;
import java.math.BigDecimal;
import java.math.BigInteger;


/**
 * atcoder template in Java @ MIT License
 * Copyright 2023 Fumiyoshi MATANO
 * 一度全体を眺めて, 全体の構造を把握してから使うことを強く推奨します.
 */
public final class Main {
    /**
     * 問題の計算を行うメソッド
     *
     * @param pw PrintWriter
     * @param sc MyScanner
     * @return status 回答のステータス
     *      1 (true)        : 回答が Yes のとき (出力が文字列 "Yes" でない可能性に注意 ex:"YES")
     *      0 (false)       : 回答が No のとき  (出力が文字列 "No"  でない可能性に注意 ex:"NO")
     *      other (default) : 回答が Yes/No 形式ではないとき
     */
    private static final byte solve(
        final PrintWriter pw, final MyScanner sc
    ) {
        byte status = -1;

        // ここに回答を記述
        
        return status;
    }


    /**
     * テンプレート編集のとき以外は触る必要のない main 関数
     * @param args おそらく使わないであろうコマンドライン引数
     */
    public static void main(String[] args) {
        try ( // 入力元と出力先を設定
            final var pw = new PrintWriter(System.out);
            final var sc = new MyScanner(System.in);
        ) {
            // 計算して
            final byte status = solve(pw, sc);
            // 判定して
            if (status == 1) {
                pw.println("Yes");
                // pw.println("YES");
            } else if (status == 0) {
                pw.println("No");
                // pw.println("NO");
            } else /* check == -1 */ {
                // Nothing to do.
            }
            pw.flush(); // 出力
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }


    /**
     * なんちゃって自作 Scanner: メソッドは足りなければ増やす……かもしれない
     * 基本的な使い方は java.util.Scanner と同じ
     * 参考資料: https://qiita.com/p_shiki37/items/a0f6aac33bf60f5f65e4
     */
    private static final class MyScanner implements AutoCloseable {
        private final java.util.Scanner sc;

        public MyScanner(final InputStream in) {
            this.sc = new Scanner(in);
        }

        @Override
        public final void close() {
            sc.close();
        }

        public final String next() {
            return sc.next();
        }

        public final String nextLine() {
            return sc.nextLine();
        }

        public final int nextInt() {
            return Integer.parseInt(sc.next());
        }

        public final long nextLong() {
            return Long.parseLong(sc.next());
        }

        public final BigInteger nextBigInteger() {
            return new BigInteger(sc.next());
        }

        public final double nextDouble() {
            return Double.parseDouble(sc.next());
        }

        public final BigDecimal nextBigDecimal(){
            return new BigDecimal(sc.next());
        }
    }
}