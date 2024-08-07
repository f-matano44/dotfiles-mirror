/** atcoder template in Java @ CC0 */

import java.util.*;
import java.io.*;


public final class Main {
    // 入力と出力
    private static final Scanner sc = new Scanner(System.in);
    private static final PrintWriter pw = new PrintWriter(System.out);
    // グローバル変数ここから
    
    // グローバル変数ここまで

    /**
     * 問題の計算を行うメソッド
     * @return status 回答のステータス
     *      true            : 回答が Yes のとき (出力が文字列 "Yes" でない可能性に注意 ex:"YES")
     *      false           : 回答が No のとき  (出力が文字列 "No"  でない可能性に注意 ex:"NO")
     *      null (default)  : 回答が Yes/No 形式ではないとき
     */
    private final Boolean solve() {
        Boolean status = null;

        // ここに回答を記述

        return status;
    }


    /** テンプレート編集のとき以外は触る必要のない main 関数 */
    public static void main(String[] args) {
        // 計算して
        final Boolean status = new Main().solve();
        // 判定して
        if (status != null && status) {
            pw.println("Yes");
            // pw.println("YES");
        } else if (status != null && !status) {
            pw.println("No");
            // pw.println("NO");
        } else /* status == null */ {
            // Nothing to do.
        }
        // 出力する
        pw.flush();
    }
}