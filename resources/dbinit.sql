create table if not exists news(id int primary key auto_increment,title varchar(2000),content  varchar(20000000),mk_content varchar(20000000),content_type varchar(20),create_time timestamp);
create table if not exists tag(id int primary key auto_increment, name  varchar(200) );
create table if not exists t_news_tag(news_id int , tag_id int);
create table if not exists category(id int primary key auto_increment,name varchar(200));
create table if not exists t_news_category(news_id int ,category_id int);
create table if not exists comment(id int primary key auto_increment,news_id int,username varchar(40),content varchar(200000) ,create_time timestamp);
create table if not exists menu(id int primary key auto_increment , name varchar(200),url varchar(200), morder int ,mtype varchar(10));
create table if not exists orders(id int primary key auto_increment , name varchar(20),num int,address varchar(200),zip varchar(20),phone varchar(20),mobile varchar(20),fahuo varchar(10),con varchar(10),email varchar(30),qq varchar(15),memo varchar(200),state varchar(10));

drop view if exists v_tags;
create view v_tags as select tag.id as id,tag.name as name,count(news.id) as count from tag,t_news_tag,news where tag.id = tag_id and news.id = news_id group by tag.id;
drop view if exists v_cats;
create view v_cats as select category.id as id,category.name as name,count(news.id) as count from category,t_news_category ,news where category.id = category_id and news.id = news_id group by category.id;
drop view if exists v_date;
create view v_date as select concat(year(create_time),'-',month(create_time)) as month , count(id) as count from news group by month order by month desc ;

