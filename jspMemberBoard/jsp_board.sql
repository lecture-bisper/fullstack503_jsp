SELECT * FROM testfull503db.jspboard;

-- 게시물 전체 목록 보기 (내림차순 정렬)
SELECT board_idx, board_title, board_create_id, board_create_date,  board_count, board_like
FROM jspboard WHERE deleted_yn = 'N' ORDER BY board_idx DESC;

-- 게시물 등록
INSERT INTO jspboard (board_title, board_content, board_create_id, board_create_date)
VALUES ('테스트 제목8', '테스트 내용 8', 'test8', now());

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



