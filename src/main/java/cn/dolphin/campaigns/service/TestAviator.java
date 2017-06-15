package cn.dolphin.campaigns.service;

import com.googlecode.aviator.AviatorEvaluator;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by LiLinZhi on 17/5/15.
 */
public class TestAviator {

    public static void main(String[] args) {
        Long result = (Long) AviatorEvaluator.execute("1+2+3");

        String name = "Lee";
        Map<String, Object> env = new HashMap<String, Object>();
        env.put("name", name);
        String result1 = (String) AviatorEvaluator.execute(" 'hello :' +  name", env);

        String name1 = "lee";
        String name2 = "li";
        String result2 = (String) AviatorEvaluator.exec(" 'hello ' + name + ': ' + n", name, name2);


        double random = new Random().nextDouble() * 100;

        System.out.println(random);

    }

}
