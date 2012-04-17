create table if not exists news(id int primary key auto_increment,title varchar(200),content  varchar(20000),create_time date);
create table if not exists tag(id int primary key auto_increment, name  varchar(200) );
create table if not exists t_news_tag(news_id int , tag_id int);
create table if not exists category(id int primary key auto_increment,name varchar(200));
create table if not exists t_news_category(news_id int ,category_id int);

create view if not exists v_tags as select tag.id as id,tag.name as name,count(news.id) as count from tag,t_news_tag,news where tag.id = tag_id and news.id = news_id group by tag.id;
create view if not exists v_cats as select category.id as id,category.name as name,count(news.id) as count from category,t_news_category ,news where category.id = category_id and news.id = news_id group by category.id;
create view v_date as select concat(year(create_time),'-',month(create_time)) as month , count(id) as count from news group by month order by month desc ;
