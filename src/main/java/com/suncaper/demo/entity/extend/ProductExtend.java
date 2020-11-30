package com.suncaper.demo.entity.extend;

import com.suncaper.demo.entity.Batch;
import com.suncaper.demo.entity.Image;
import com.suncaper.demo.entity.Sku;
import lombok.Data;
import lombok.experimental.Accessors;

import java.sql.SQLTransactionRollbackException;
import java.util.List;

/**
 * @author zyq
 * @date 2020/11/19 - 17:16
 */
@Data
@Accessors(chain = true)
public class ProductExtend {
    private List<Image> images;

    private List<Sku> skus;

    private Batch batch;
    private String sexValue;

}
