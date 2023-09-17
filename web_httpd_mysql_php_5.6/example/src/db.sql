CREATE DATABASE IF NOT EXISTS web;

USE web;

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) NOT NULL,
  `data` varchar(20) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO `news` values (1,'ctfhub'), (2,'skill'), (114514,'sqli');

CREATE TABLE IF NOT EXISTS `flag` (
  `flag` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO `flag` values ('FLAG');