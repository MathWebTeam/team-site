CREATE DATABASE IF NOT EXISTS cms
  DEFAULT CHARSET utf8
  COLLATE utf8_general_ci;
USE cms;
CREATE TABLE IF NOT EXISTS content(
id           BIGINT PRIMARY KEY AUTO_INCREMENT,                        #自主增长
  category_id    BIGINT NOT NULL  COMMENT '外键',                #外键，内容所属分类id
  title          VARCHAR(100)    COMMENT '内容标题',                
  subtitle       VARCHAR(100)    COMMENT '内容附标题' , 
  summary        VARCHAR(300)    COMMENT '内容摘要',
  url            VARCHAR(500)    COMMENT '内容链接',
  picture1       VARCHAR(500)    COMMENT '内容图片1URL',
  picture2       VARCHAR(500)    COMMENT '内容图片2URL',
  detail         text            COMMENT '内容详情',
  created_time DATETIME NOT NULL COMMENT  '创建时间',
  updated_time DATETIME NOT NULL COMMENT  '修改时间'
);
INSERT INTO content (category_id, title ,subtitle, summary,url,picture1 ,picture2, created_time, updated_time) VALUES (
"1",
"2",
"3",
"4",
"5",
"l14.114.114.114.com",
"images/picture.jpg",
"images/picture.jpg",
"2017-11-16 23:09:43",
"2017-11-16 23:09:43"
);

CREATE TABLE IF NOT EXISTS content_category (
id           BIGINT PRIMARY KEY AUTO_INCREMENT,                        #自主增长
  parent_id    BIGINT NOT NULL   COMMENT '外键',                #外键，父级内容分类id。取值0表示无父分类（根分类）
  name      VARCHAR(20)  NOT NULL COMMENT '分类名称',                #分类名称
  status    enum('0','1') NOT NULL  COMMENT  '0：正常' COMMENT '1:删除' ,  #分类状态。0：正常；1：删除
  order_number  int              COMMENT  '排序' ,                      #排序序号。值越小排序越靠前
  created_time DATETIME NOT NULL COMMENT  '创建时间',
  updated_time DATETIME NOT NULL COMMENT  '修改时间'
);

INSERT INTO content (parent_id,name ,status, order_number,created_time,updated_time) VALUES (
  "22",
  "zhouxiaojin",
  "0",
  "333",
  "2017-11-16 23:09:43",
  "2017-11-16 23:09:43"
);
 