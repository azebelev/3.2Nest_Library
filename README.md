--Authentication : 

implemented vie JWT , 
if user login is "admin" application will show admin page else library page will be depicted


--Config:

configs are stated in .env . We could choose database config and same pagination peculiarities


--Pagination:

On user page : to bottoms 'вперед' ,'назад' in case then number of pages less then 1 - the pagination 
will despaired . Also the bottoms will change visibility depending on first or last pages 

On admin page : pagination like on user page but with numeration of pages in addition . 
The number of active page will be active and it position will be at the middle of  pagination numbers row .
We could tune maximum length of pagination numbers row and books by page in .env


--Cron

Where is two tasks:  removing deleted books and dumping of reserve copy of database . Copies called 
with prefix of result of Date.now() so could be sorted 


--Migrations commands

npm run sendLastDump                             : choose latest dump and copy it to migration sql file
node_modules/.bin/db-migrate up loadDump         : load latest dumped sql from migration   
node_modules/.bin/db-migrate down                : cancel last migration
node_modules/.bin/db-migrate up library          : make clear database without values
  
