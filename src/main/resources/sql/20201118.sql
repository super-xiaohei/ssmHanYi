ALTER TABLE wcss_product MODIFY is_deleted TINYINT(1) DEFAULT 0;
ALTER TABLE `wcss_product_image` MODIFY is_deleted TINYINT(1) DEFAULT 0;
ALTER TABLE `wcss_sku` MODIFY is_deleted TINYINT(1) DEFAULT 0;