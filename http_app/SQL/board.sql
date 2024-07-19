-- DDL
CREATE TABLE `board` (
  `no` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `writer` varchar(100) NOT NULL,
  `content` text,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `views` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`no`)
) COMMENT='게시판';



-- 샘플 데이터
INSERT INTO `board` (title, writer, content) VALUES
('제목 1', '작성자 1', '내용 1'),
('제목 2', '작성자 2', '내용 2'),
('제목 3', '작성자 3', '내용 3'),
('제목 4', '작성자 4', '내용 4'),
('제목 5', '작성자 5', '내용 5'),
('제목 6', '작성자 6', '내용 6'),
('제목 7', '작성자 7', '내용 7'),
('제목 8', '작성자 8', '내용 8'),
('제목 9', '작성자 9', '내용 9'),
('제목 10', '작성자 10', '내용 10'),
('제목 11', '작성자 11', '내용 11'),
('제목 12', '작성자 12', '내용 12'),
('제목 13', '작성자 13', '내용 13'),
('제목 14', '작성자 14', '내용 14'),
('제목 15', '작성자 15', '내용 15'),
('제목 16', '작성자 16', '내용 16'),
('제목 17', '작성자 17', '내용 17'),
('제목 18', '작성자 18', '내용 18'),
('제목 19', '작성자 19', '내용 19'),
('제목 20', '작성자 20', '내용 20'),
('제목 21', '작성자 21', '내용 21'),
('제목 22', '작성자 22', '내용 22'),
('제목 23', '작성자 23', '내용 23'),
('제목 24', '작성자 24', '내용 24'),
('제목 25', '작성자 25', '내용 25'),
('제목 26', '작성자 26', '내용 26'),
('제목 27', '작성자 27', '내용 27'),
('제목 28', '작성자 28', '내용 28'),
('제목 29', '작성자 29', '내용 29'),
('제목 30', '작성자 30', '내용 30'),
('제목 31', '작성자 31', '내용 31'),
('제목 32', '작성자 32', '내용 32'),
('제목 33', '작성자 33', '내용 33'),
('제목 34', '작성자 34', '내용 34'),
('제목 35', '작성자 35', '내용 35'),
('제목 36', '작성자 36', '내용 36'),
('제목 37', '작성자 37', '내용 37'),
('제목 38', '작성자 38', '내용 38'),
('제목 39', '작성자 39', '내용 39'),
('제목 40', '작성자 40', '내용 40'),
('제목 41', '작성자 41', '내용 41'),
('제목 42', '작성자 42', '내용 42'),
('제목 43', '작성자 43', '내용 43'),
('제목 44', '작성자 44', '내용 44'),
('제목 45', '작성자 45', '내용 45'),
('제목 46', '작성자 46', '내용 46'),
('제목 47', '작성자 47', '내용 47'),
('제목 48', '작성자 48', '내용 48'),
('제목 49', '작성자 49', '내용 49'),
('제목 50', '작성자 50', '내용 50');
