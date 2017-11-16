CREATE DATABASE IF NOT EXISTS cms
  DEFAULT CHARSET utf8
  COLLATE utf8_general_ci;
USE cms;
CREATE TABLE IF NOT EXISTS news (
  id           BIGINT PRIMARY KEY AUTO_INCREMENT,
  title        VARCHAR(50) NOT NULL,
  author       VARCHAR(20),
  summary      VARCHAR(200),
  created_time DATETIME,
  updated_time DATETIME
);

INSERT INTO news (title, author, summary, created_time, updated_time) VALUES (
  "男子酒驾被查竟牵出11年前轮奸女中学生案",
  "李小博",
  "11月3日凌晨2时许，西安交警新城大队在例行持续查处酒驾，这时，东二环东元桥上由南向北方向驶来一辆陕A牌照轿车，民警发现车辆行驶异常，拦停后车内只有一名男性驾驶员，但长时间拒",
  "2017-11-16 23:09:43",
  "2017-11-16 23:09:43"
);

INSERT INTO news (title, author, summary, created_time, updated_time) VALUES (
  "山东蓝翔技校获批更名蓝翔技师学院 主招高中毕业生",
  "澎湃新闻",
  "11月14日，山东省政府网站发布“关于同意将山东蓝翔高级技工学校改建为山东蓝翔技师学院的批复”的文件",
  "2017-11-16 08:10:58",
  "2017-11-16 08:10:58"
);

INSERT INTO news (title, author, summary, created_time, updated_time) VALUES (
  "江歌案网友人肉错对象 无辜大妈接到2000多骚扰电话",
  "北青网",
  "时隔一年后，“江歌遇害案”即将于下月开庭。近日，江歌的母亲江秋莲与刘鑫在今年8月份首度见面的视频曝光，再度引发社会关注。",
  "2017-11-15 09:23:12",
  "2017-11-15 09:23:12"
);