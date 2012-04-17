create table news if not exists (id int primary key auto_increment,title varchar(200),content  varchar(20000),create_time date);
create table news if not exists tag(id int primary key auto_increment, name  varchar(200) );
create table news if not exists t_news_tag(news_id int , tag_id int);
create table news if not exists category(id int primary key auto_increment,name varchar(200));
create table news if not exists t_news_category(news_id int ,category_id int);

create view if not exists v_tags as select id,name,count(id) as count from tag;
create view if not exists v_cats as select id,name,count(id) as count from category;
create view if not exists v_date as select id,name,count(id) as count from news;

#TODO fix here