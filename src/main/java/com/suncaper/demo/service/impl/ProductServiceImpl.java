package com.suncaper.demo.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.suncaper.demo.common.Constant;
import com.suncaper.demo.common.JsonResult;
import com.suncaper.demo.common.SecurityUtils;
import com.suncaper.demo.entity.*;
import com.suncaper.demo.entity.dto.ProductDto;
import com.suncaper.demo.mapper.ProductMapper;
import com.suncaper.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.*;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.spi.LocaleNameProvider;
import java.util.stream.Collectors;

/**
 * @author zyq
 * @date 2020/11/18 - 18:15
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private SkuService skuService;
    @Autowired
    private ImageService imageService;
    @Autowired
    private BatchService batchService;
    @Autowired
    private DictionaryService dictionaryService;
    @Autowired
    private StudentService studentService;
    @Override
    public void insert(ProductDto productDto, List<Image> images) {
        productMapper.MyInsertSelective(productDto);
        List<String> skuNames = productDto.getSkuName();
        List<Sku> skuList = skuNames.stream().map(x -> {
            Sku sku = new Sku();
            sku.setProductId(productDto.getId());
            sku.setName(x);
            return sku;
        }).collect(Collectors.toList());
        skuService.ManyInsert(skuList);
        //插入图片
        images.stream().forEach(x->{
            x.setProductId(productDto.getId());
        });
        imageService.insertImage(images);
    }

    @Override
    public PageInfo<Product> list(ProductDto productDto) {
        //PageHelper.startPage(1,10);
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andIsDeletedEqualTo(Constant.IS_DELETE_0);
        productExample.setOrderByClause("id desc");
       /* System.out.println("-------------------------------------------------------------");
        System.out.println(productDto.getPageNum());
        System.out.println(productDto.getPageSize());
        System.out.println("-------------------------------------------------------------");*/
        PageHelper.startPage(productDto.getPageNum(),productDto.getPageSize());
        List<Product> products = productMapper.selectByExample(productExample);
        products.stream().forEach(x->{
            x.setImages(imageService.listByProductId(x.getId()));
            x.setSkus(skuService.listByProductId(x.getId()));
        });
        PageInfo<Product> productPageInfo = new PageInfo<>(products);
        return productPageInfo;
    }

    @Override
    public JsonResult deleteById(Long id) {
        //获取该批次的寒衣的开始选衣时间
        Product product = productMapper.selectByPrimaryKey(id);
        Batch batch = batchService.selectByPrimaryKey(product.getBatchId());
        Date registerStartDate = batch.getRegisterStartDate();
        //进行一下时间的转换，才能比较
        Instant i = registerStartDate.toInstant();
        ZonedDateTime zonedDateTime = i.atZone(ZoneId.systemDefault());
        LocalDate localDateTime1 = zonedDateTime.toLocalDate();
        LocalDate now = LocalDate.now();
        if(now.isBefore(localDateTime1)){
            Product pro = new Product();
            pro.setId(id);
            pro.setIsDeleted(Constant.IS_DELETE_1);
            productMapper.updateByPrimaryKeySelective(pro);
            return JsonResult.ok(true);
        }else {
            return  JsonResult.ok(false);
        }

    }

    @Override
    public JsonResult selectById(Long id) {
        Product product = productMapper.selectByPrimaryKey(id);
        product.setSkus(skuService.listByProductId(product.getId()));
        product.setImages(imageService.listByProductId(product.getId()));
        product.setBatch(batchService.selectByPrimaryKey(product.getBatchId()));
        product.setSexValue(dictionaryService.getNameByValueAndType(Constant.GENDER_TYPE,product.getGender()));
        return JsonResult.ok(product);
    }

    @Override
    public void update(ProductDto productDto, List<Image> images) {
        //关联表要先删除，再添加
        //删除原来的数据
        SkuExample skuExample = new SkuExample();
        skuExample.createCriteria().andProductIdEqualTo(productDto.getId());
        skuService.deleteByExample(skuExample);
        ImageExample imageExample = new ImageExample();
        imageExample.createCriteria().andProductIdEqualTo(productDto.getId());
        imageService.deleteByExample(imageExample);
        //更新新的数据
        productMapper.updateByPrimaryKeySelective(productDto);
        //更新关联表
        //款式
        List<String> skuNames = productDto.getSkuName();
        List<Sku> skuList = skuNames.stream().map(x -> {
            Sku sku = new Sku();
            sku.setProductId(productDto.getId());
            sku.setName(x);
            return sku;
        }).collect(Collectors.toList());
        skuService.ManyInsert(skuList);
        //图片
        //插入新图片
        images.stream().forEach(x->{
            x.setProductId(productDto.getId());
        });
        imageService.insertImage(images);
        //插入老照片
        List<String> oldImg = productDto.getOldImg();
        List<Image> oldImgs = oldImg.stream().map(x -> {
            Image image = new Image();
            image.setProductId(productDto.getId());
            image.setPath(x);
            image.setName("暂时先不用，后面记得加上");
            return image;
        }).collect(Collectors.toList());
        imageService.insertImage(oldImgs);
    }

    @Override
    public List<Product> listBySn(ProductDto productDto) {
       /* System.out.println("-------------------------------------------------------------");
        System.out.println(productDto.getPageNum());
        System.out.println(productDto.getPageSize());*/
       //根据当前用户能查所看到的衣服
        //最新批次和符合自己性别的
        //最新批次
        Batch curBatch = batchService.getCurBatch();
        User curUser = SecurityUtils.getCurUser();
        Student student = studentService.selectByUser(curUser);
        String sex = Constant.GENDER_MAN.equals(student.getGender())?"M":"F"; //判断性别
        List<String> genders = Arrays.asList(sex, "MF");//男生可以看男款和男女款。女生可以看女款和男女款
        ProductExample productExample = new ProductExample();
        productExample.createCriteria().andBatchIdEqualTo(curBatch.getId()).andGenderIn(genders);
        List<Product> productList = productMapper.selectByExample(productExample);
        productList.stream().forEach(x->{
            x.setImages(imageService.listByProductId(x.getId()));
            x.setSkus(skuService.listByProductId(x.getId()));
        });
        return productList;
    }




}
