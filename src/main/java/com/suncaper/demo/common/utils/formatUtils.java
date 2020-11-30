package com.suncaper.demo.common.utils;

/**
 * @author zyq
 * @date 2020/11/25 - 14:33
 */
public class formatUtils {
    public static String difficultyTransferUtils(String difficultyValue){
        switch (difficultyValue){
            case "不困难": return "BKN";
            case "一般困难": return "YBKN";
            case "特殊困难": return "TSKN";
            default: return "WZKN";
        }
    }
}
