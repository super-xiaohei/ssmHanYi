ALTER TABLE `wcss_whitelist_setting` MODIFY is_enabled BOOL NOT NULL DEFAULT 1;

ALTER TABLE `wcss_whitelist_setting` MODIFY is_deleted BOOL NOT NULL DEFAULT 0;

ALTER TABLE `wcss_batch_setting` MODIFY is_deleted INT NOT NULL;
ALTER TABLE `wcss_batch_setting` MODIFY active INT NOT NULL;