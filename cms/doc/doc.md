# CMS文档

[TOC]

## 1. 数据库

### content_category（内容分类表）

| 名称           | 类型          | 是否必须 | 说明                         |
| :----------- | :---------- | :--- | -------------------------- |
| id           | bigint      | Y    | 主键，自增                      |
| parent_id    | bigint      | Y    | 外键，父级内容分类id。取值0表示无父分类（根分类） |
| name         | varchar(20) | Y    | 分类名称                       |
| status       | tinyint     | Y    | 分类状态。0：正常；1：删除             |
| order_number | int         | Y    | 排序序号。值越小排序越靠前              |
| created_time | datetime    | Y    | 创建时间                       |
| updated_time | datetime    | Y    | 修改时间                       |

### content（内容表）

| 名称           | 类型           | 是否必须 | 说明          |
| ------------ | ------------ | ---- | ----------- |
| id           | bigint       | Y    | 主键，自增       |
| category_id  | bigint       | Y    | 外键，内容所属分类id |
| title        | varchar(100) | N    | 内容标题        |
| subtitle     | varchar(100) | N    | 内容副标题       |
| summary      | varchar(300) | N    | 内容摘要        |
| url          | varchar(500) | N    | 内容链接        |
| picture1     | varchar(500) | N    | 内容图片1URL    |
| picture2     | varchar(500) | N    | 内容图片2URL    |
| detail       | text         | N    | 内容详情        |
| created_time | datetime     | Y    | 创建时间        |
| updated_time | datetime     | Y    | 修改时间        |


## 2. API

