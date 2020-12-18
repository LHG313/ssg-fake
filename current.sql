/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.14-MariaDB : Database - textBoard
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`textBoard` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `textBoard`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(200) NOT NULL,
  `body` text NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `boardId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`) values 
(1,'2020-12-17 20:55:32','2020-12-17 20:55:32','java 문자열에서 부분 추출하기','# 자바 문자열 분리해서 추출하기\r\n```java\r\n    // charAt(문장 중에 인덱스 위치에 해당문자 추출)\r\n    \r\n    //인덱스 범위 0~6\r\n    String aaa = \\\"가나다라마바사\\\";\r\n    \r\n    // 인덱스3을 출력하면 \\\"라\\\"가 출력됩니다.\r\n    char data = aaa.charAt(3);    \r\n\r\n    System.out.println(data);\r\n    //출력값 : 라\r\n\r\n    //subString (원하는 범위만큼 문자열 추출)\r\n\r\n    // 인덱스 범위 0~6\r\n    String aaa = \"가나다라마바사\";\r\n    \r\n    //2~5에 해당되는 문자열 부분 추출   \r\n    String data = aaa.substring(2,5);    \r\n    \r\n    System.out.println(data);\r\n    //출력값: 다라마\r\n\r\n    //split(주어진 문자로 분리하여 배열에 저장)\r\n\r\n    // 띄어쓰기를 포함한 문장\r\n    String aaa = \"가나 다라마 바 사\";\r\n\r\n    //split으로 띄어쓰기를 구분하여 배열에 저장\r\n    String[] data = aaa.split(\" \");\r\n\r\n    //구분된 배열을 배열의 길이만큼 출력\r\n    for (int i = 0; i < data.length; i++) {\r\n    System.out.println(data[i]);\r\n    }\r\n    \r\n    //출력값: 가나\r\n             다라 \r\n             바\r\n             사   \r\n    \r\n\r\n\r\n    //split 2탄\r\n\r\n        //구분은 &와 ,(쉼표)와 -로 구분\r\n        String aaa = \"안녕&하세요,반갑-습니다\";\r\n		\r\n        \r\n        // &와 ,(쉼표)와 -로 구분해보면\r\n        String[] data = aaa.split(\"&|,|-\");\r\n\r\n		for (int i = 0; i < data.length; i++) {\r\n			System.out.println(data[i]);\r\n		}\r\n\r\n        //출력값: 안녕\r\n                 하세요\r\n                 반갑\r\n                 습니다\r\n\r\n\r\n```\r\n ',1,3),
(2,'2020-12-17 20:55:14','2020-12-17 20:55:14','java 문자열에서 숫자만 추출','# java 문자열에서 숫자만 추출\r\n\r\n```java\r\n\r\n//정규표현식으로 Integer 추출\r\n\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n\r\n    //replaceAll()에 인자로 정규표현식과 변환할 문자열을 전달\r\n    String intStr = str.replaceAll(\"[^0-9]\", \"\");\r\n    //\"[^0-9]\"는 0~9의 숫자가 아닌 문자열을 의미 (숫자가 아닌 문자들을 공백(\"\"))\r\n\r\n    System.out.println(intStr);\r\n    \r\n    // 출력값: 12342233\r\n\r\n\r\n    //replaceAll2탄\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n\r\n    //\"^\\\\d\"는 \"[^0-9]\"의 축약형으로 의미가 동일(\"[^0-9]\" 대신 \"^\\\\d\"사용)\r\n    String intStr = str.replaceAll(\"[^\\\\d]\", \"\");\r\n    \r\n    System.out.println(intStr);\r\n    \r\n    // 출력값: 12342233\r\n    \r\n\r\n    //for문으로 숫자 추출\r\n\r\n    String str = \"aaa1234, ^&*2233pp\";\r\n    \r\n    String intStr = \"\";\r\n    \r\n    for (int i = 0; i < str.length(); i++) {\r\n        char ch = str.charAt(i);\r\n\r\n    //  48은 ASCII에서 숫자 0을 의미하고, 57은 ASCII에서 숫자 9를 의미(0~9까지 숫자만 추출)\r\n    if (48 <= ch && ch <= 57) {\r\n        intStr += ch;\r\n    }\r\n    }\r\n    System.out.println(intStr); \r\n\r\n    // 출력값: 12342233\r\n\r\n\r\n```',1,3);

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `name` char(20) NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `board` */

insert  into `board`(`id`,`regDate`,`updateDate`,`name`,`code`) values 
(3,'2020-12-17 20:03:15','2020-12-17 20:03:15','JAVA','java'),
(4,'2020-12-17 20:04:19','2020-12-17 20:04:19','JAVA','java');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `loginId` char(30) NOT NULL,
  `loginPw` varchar(50) NOT NULL,
  `name` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`name`) values 
(1,'2020-12-17 20:04:19','2020-12-17 20:04:19','master','master','이회구');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
