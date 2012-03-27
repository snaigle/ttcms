create table news(id int primary key auto_increment,title varchar(200),content  varchar(20000),create_time date);
create table tag(id int primary key auto_increment, name  varchar(200) );
create table t_news_tag(news_id int , tag_id int);
create table category(id int primary key auto_increment,name varchar(200));
create table t_news_category(news_id int ,category_id int);