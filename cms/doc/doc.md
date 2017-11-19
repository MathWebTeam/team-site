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

### 2.1 说明

#### 请求

- 典型的请求方法有四种：
  - GET：用于获取数据
  - POST：用于创建数据
  - PUT：用于修改数据
  - DELETE：用户删除数据
- 在请求url中，用`{path}`作为路径变量，`[&name=value]`表示请求参数可选。
- 典型的请求参数有两种携带方式：
  - URL中，如：`127.0.0.1:8080/news?size=2`
  - 请求体中，以json格式提交，`Content-Type: application/json`


#### 响应

- 数据返回格式统一使用json，使用UTF-8编码

- 通过HTTP Status Code来表明请求是否成功。典型的状态码如下：

  | 状态码  | 含义                    | 说明                    |
  | ---- | --------------------- | --------------------- |
  | 200  | OK                    | 请求成功。用于GET请求响应        |
  | 201  | Created               | 创建成功。用于POST请求响应       |
  | 204  | No Content            | 请求成功。用于PUT或DELETE请求响应 |
  | 400  | BAD REQUEST           | 请求的地址不存在或者包含不支持的参数    |
  | 401  | UNAUTHORIZED          | 未登录                   |
  | 403  | FORBIDDEN             | 没有权限                  |
  | 404  | NOT FOUND             | 请求的资源不存在              |
  | 500  | INTERNAL SERVER ERROR | 其他错误                  |

- 请求失败时（状态码为4xx, 5xx），响应体中会携带失败原因信息。

- 典型的返回值类型有两种：

  - 单个对象，如：

    ```json
    {
        "id": 1,
        "created_time": 1510844983000,
        "updated_time": 1510844983000,
        "title": "男子酒驾被查竟牵出11年前轮奸女中学生案",
        "author": "李小博",
        "summary": "11月3日凌晨2时许，西安交警新城大队在例行持续查处酒驾，这时，东二环东元桥上由南向北方向驶来一辆陕A牌照轿车，民警发现车辆行驶异常，拦停后车内只有一名男性驾驶员，但长时间拒"
    }
    ```

  - 对象列表，如：

    ```json
    {
        "page": 1,
        "size": 10,
        "total": 3,
        "content": [
            {
                "id": 1,
                "created_time": 1510844983000,
                "updated_time": 1510844983000,
                "title": "男子酒驾被查竟牵出11年前轮奸女中学生案",
                "author": "李小博",
                "summary": "11月3日凌晨2时许，西安交警新城大队在例行持续查处酒驾，这时，东二环东元桥上由南向北方向驶来一辆陕A牌照轿车，民警发现车辆行驶异常，拦停后车内只有一名男性驾驶员，但长时间拒"
            },
            {
                "id": 2,
                "created_time": 1510791058000,
                "updated_time": 1510791058000,
                "title": "山东蓝翔技校获批更名蓝翔技师学院 主招高中毕业生",
                "author": "澎湃新闻",
                "summary": "11月14日，山东省政府网站发布“关于同意将山东蓝翔高级技工学校改建为山东蓝翔技师学院的批复”的文件"
            },
            {
                "id": 3,
                "created_time": 1510708992000,
                "updated_time": 1510708992000,
                "title": "江歌案网友人肉错对象 无辜大妈接到2000多骚扰电话",
                "author": "北青网",
                "summary": "时隔一年后，“江歌遇害案”即将于下月开庭。近日，江歌的母亲江秋莲与刘鑫在今年8月份首度见面的视频曝光，再度引发社会关注。"
            }
        ]
    }
    ```

### 2.2 接口

#### 根据id查询内容

**请求：**

```http
GET /contents/{id}
```

**响应：**

```json
{content object}
```

#### 根据分类id获取内容列表

**请求:**

```http
GET /contents?category_id={categoryId}[&page={page}][&size={size}]
```

**响应：**

```json
[
  "page": 1,
  "size": 2,
  "total": 3,
  "content": [
    {content object}, {content object}...
  ]
]
```

**注意：**该接口返回的`content ` obejct 中不包含 `detail` 字段。