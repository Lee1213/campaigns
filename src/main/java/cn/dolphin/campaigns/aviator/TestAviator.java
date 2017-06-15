package cn.dolphin.campaigns.aviator;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Created by LiLinZhi on 17/5/15.
 */
public class TestAviator {

    public static void main(String[] args) {
//        Long result = (Long) AviatorEvaluator.execute("1+2+3");

//        String name = "Lee";
//        Map<String, Object> env = new LinkedHashMap();
//        env.put("name", name);
//        double result = (Double) AviatorEvaluator.execute(" 0.3 * 100", env);
//        System.out.println(result);

//        String name = "lee";
//        String name2 = "li";
//        String result = (String) AviatorEvaluator.exec(" 'hello ' + name + ': ' + n", name, name2);

//        System.out.println(AviatorEvaluator.execute("string.contains('test', string.substring('hello', 1, 2))"));


//        System.out.println(new Date().getTime());
//        System.out.println(System.currentTimeMillis());
//
//
//        String[] arr = new String[2];
//        arr[0] = null;
//        arr[1] = null;
//        System.out.println(arr.length);

        List<String> list = null;
        for (String s : list) {
            System.out.println(s);
        }

        StringBuilder appVersions = new StringBuilder(" ");
        appVersions.append("");
        appVersions.replace(appVersions.length() - 1, appVersions.length(), "");

        System.out.println(appVersions.length());

    }

    private static void luckyDraw() {
        int count = 0;
        for (int i = 0; i < 30000; i++) {
            int random = new Random().nextInt(100) + 1;
            if (random > 10) {
                count++;
            }
        }

        System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));

        Date date = new Date();
        Timestamp ts = (Timestamp) date;
        System.out.println(ts);
    }

}
