import com.googlecode.aviator.AviatorEvaluator;

/**
 * Created by LiLinZhi on 17/5/15.
 */
public class TestAviator {

    public static void main(String[] args) {
//        Long result = (Long) AviatorEvaluator.execute("1+2+3");

//        String name = "Lee";
//        Map<String, Object> env = new HashMap<String, Object>();
//        env.put("name", name);
//        String result = (String) AviatorEvaluator.execute(" 'hello :' +  name", env);

//        String name = "lee";
//        String name2 = "li";
//        String result = (String) AviatorEvaluator.exec(" 'hello ' + name + ': ' + n", name, name2);


        System.out.println(1);
        System.out.println(AviatorEvaluator.execute("string.contains('test', string.substring('hello', 1, 2))"));

    }

}
