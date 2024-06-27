update groups set start_at = '2019-11-20' where name like '%067%';
update groups set start_at = '2019-11-21' where name like '%068%';
update groups set start_at = '2019-11-23' where name like '%069%';
update groups set start_at = '2019-11-24' where name like '%070%';

insert into groups (start_at, name, timetable, hours_start_at, hours_finish_at, status, category, price, price_for_students) values ('2019-11-20', '0067', '["Понедельник", "Среда"]', '18:30:00', '21:00:00', 1, 0, 25000, 23000);
insert into groups (start_at, name, timetable, hours_start_at, hours_finish_at, status, category, price, price_for_students) values ('2019-11-20', '0068', '["Вторник","Четверг"]', '18:30:00', '21:00:00', 1, 0, 25000, 23000);
insert into groups (start_at, name, timetable, hours_start_at, hours_finish_at, status, category, price, price_for_students) values ('2019-11-20', '0069', '["Суббота"]', '10:30:00', '14:15:00', 1, 0, 25000, 23000);
insert into groups (start_at, name, timetable, hours_start_at, hours_finish_at, status, category, price, price_for_students) values ('2019-11-20', '0070', '["Воскресенье"]', '10:30:00', '14:15:00', 1, 0, 25000, 23000);
