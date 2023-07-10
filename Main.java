/**
 * atcoder template in Java @ MIT License
 * Copyright 2023 Fumiyoshi MATANO
 * 一度全体を眺めて, 全体の構造を把握してから使うことを強く推奨します.
 */

import java.util.*;
import java.io.*;


public final class Main {
    // グローバル変数
    private final Scanner sc;       // 入力はここから拾う
    private final PrintWriter pw;   // 出力はここに流す

    /**
     * 問題の計算を行うメソッド
     * @return status 回答のステータス
     *      1 (true)        : 回答が Yes のとき (出力が文字列 "Yes" でない可能性に注意 ex:"YES")
     *      0 (false)       : 回答が No のとき  (出力が文字列 "No"  でない可能性に注意 ex:"NO")
     *      null (default)  : 回答が Yes/No 形式ではないとき
     */
    private final Boolean solve() {
        Boolean status = null;

        // ここに回答を記述
        
        return status;
    }


    /**
     * テンプレート編集のとき以外は触る必要のない main 関数
     * @param args おそらく使わないであろうコマンドライン引数
     */
    public static void main(String[] args) {
        try ( // 入力元と出力先を設定
            final var sc = new Scanner(System.in);
            final var pw = new PrintWriter(System.out);
        ) {
            // 計算して
            final Boolean status = new Main(sc, pw).solve();
            // 判定して
            if(status != null) {
                if (status) {
                    pw.println("Yes");
                    // pw.println("YES");
                } else {
                    pw.println("No");
                    // pw.println("NO");
                }
            } else /* status == null */ {
                // Nothing to do.
            }
            pw.flush(); // 出力する
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }


    /** Main クラスのコンストラクタ. 入出力のやり取りくらい. */
    public Main(final Scanner sc, final PrintWriter pw) {
        this.sc = sc;
        this.pw = pw;
    }
}