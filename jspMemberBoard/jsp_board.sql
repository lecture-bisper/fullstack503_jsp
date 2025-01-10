SELECT * FROM testfull503db.jspboard;

-- 게시물 전체 목록 보기 (내림차순 정렬)
SELECT board_idx, board_title, board_create_id, board_create_date,  board_count, board_like
FROM jspboard WHERE deleted_yn = 'N' ORDER BY board_idx DESC;

-- 게시물 목록 보기 (내림차순, 페이징 기법)
SELECT board_idx, board_title, board_create_id, board_create_date,  board_count, board_like
FROM jspboard WHERE deleted_yn = 'N' ORDER BY board_idx DESC
LIMIT 10 OFFSET 5;

-- 게시물 전체 수
SELECT count(*) AS cnt FROM jspboard;

-- 게시물 등록
INSERT INTO jspboard (board_title, board_content, board_create_id, board_create_date)
VALUES ('테스트 제목4', '테스트 내용 4', 'test4', now());

INSERT INTO jspboard (board_title, board_content, board_create_id, board_create_date)
VALUES 
('테스트 제목31', '테스트 내용 31', 'test1', now()),
('테스트 제목32', '테스트 내용 32', 'test1', now()),
('테스트 제목33', '테스트 내용 33', 'test1', now()),
('테스트 제목34', '테스트 내용 34', 'test1', now()),
('테스트 제목35', '테스트 내용 35', 'test1', now()),
('테스트 제목36', '테스트 내용 36', 'test1', now());

-- 게시물 상세 보기
SELECT board_idx, board_title, board_content, board_create_id, board_create_date, board_update_date, board_count, board_like
FROM jspboard WHERE board_idx = 9 AND deleted_yn = 'N';

-- 게시물 수정
UPDATE jspboard SET board_title = '수정된 제목 7', board_content = '수정된 내용 7', board_update_date = now() WHERE board_idx = 7 AND deleted_yn = 'N';

-- 게시물 삭제
UPDATE jspboard SET deleted_yn = 'Y' WHERE board_idx = 7;

-- 조회수 1증가
UPDATE jspboard SET board_count = board_count + 1 WHERE board_idx = 8;

-- 추천수 1증가
UPDATE jspboard SET board_like = board_like + 1 WHERE board_idx = 8;



