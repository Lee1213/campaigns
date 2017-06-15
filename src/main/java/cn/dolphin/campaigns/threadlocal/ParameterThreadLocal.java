
package cn.dolphin.campaigns.threadlocal;

/**
 * Lilinzhi
 */
public class ParameterThreadLocal {
    private static ThreadLocal<String> name = new ThreadLocal<String>();

    public static String getName() {
        return name.get();
    }

    public static void setName(String value) {
        name.set(value);
    }


    public static void clear() {
        name.set(null);
    }

}
