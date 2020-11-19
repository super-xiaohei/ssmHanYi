package com.suncaper.demo.service;

import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.entity.Dictionary;

import java.util.List;

/**
 * @author zyq
 * @date 2020/11/17 - 15:59
 */
public interface DictionaryService {

    String getNameByValueAndType(String type,String value);

    List<Dictionary> getDictionary(Dictionary dictionary);

}
