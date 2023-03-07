package com.athttt.utils;



import java.util.Collection;
import java.util.Map;

import com.athttt.constant.SystemConstant;

public class ValidateUtils {
    public static boolean isValid(Object obj) {
        boolean isTrue = null != obj && !com.athttt.constant.SystemConstant.EMPTY_STRING.equals(obj.toString());

        if (isTrue) {
            if (obj instanceof String) {
                return true;
            } else if (obj instanceof Integer) {
                return 0 <= Integer.parseInt(obj.toString());
            } else if (obj instanceof Long) {
                return 0 <= Long.parseLong(obj.toString());
            } else if (obj instanceof Collection) {
                return !((Collection<?>) obj).isEmpty();
            }
        }
        return false;
    }

    public static boolean isNotBlank(String str) {
        return null != str && !SystemConstant.EMPTY_STRING.equals(str.trim());
    }

    public static <T> boolean isNotEmpty(Collection<T> collection) {
        return null != collection && !collection.isEmpty();
    }
    public static boolean isEmptyMap (Map<String, Object> map) {
    	return map == null || map.keySet().size() == 0;
    }
}
