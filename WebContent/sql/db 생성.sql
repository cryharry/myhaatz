-데이터베이스 생성:프로젝트 전체 저장공간
create database jspbeginner;

-사용자생성:데이터베이스 관리자할 사용자
grant select,insert,update,delete,create,alter,drop
on jspbeginner.* to 'jspid'@'localhost'
identified by 'jsppass';

grant select,insert,update,delete,create,alter,drop
on jspbeginner.* to 'jspid'@'%'
identified by 'jsppass';