SELECT * FROM testfull503db.jspmember;

-- 회원제 게시판 로그인 관련 회원 테이블

-- 회원 가입
INSERT INTO jspmember (user_id, user_pw, user_name, user_email, user_phone, user_addr)
VALUES ('test2', '1234', '테스터2', 'tester02@bitc.ac.kr', '01012345678', '부산');

-- 지정한 id를 사용하고 있는 회원 존재 여부 (추가기능)
SELECT count(*) AS cnt FROM jspmember
WHERE user_id = 'test1';

-- id/pw를 사용하고 있는 회원 존재 여부 (로그인 가능 여부)
SELECT count(*) AS cnt FROM jspmember
WHERE user_id = 'test1' AND user_pw = '1234' AND deleted_yn = 'N';

-- id를 기반으로 한 회원 정보 조회
SELECT user_id, user_name, user_email, user_phone, user_addr FROM jspmember
WHERE user_id = 'test1' AND deleted_yn = 'N';

-- 회원 탈퇴
-- 완전 삭제
DELETE FROM jspmember WHERE user_id = 'test2';
-- 보기에만 삭제 처리
UPDATE jspmember SET deleted_yn = 'Y' WHERE user_id = 'test1';




