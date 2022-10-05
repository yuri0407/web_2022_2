package cs.dit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MViewService implements MemberService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		
		MemberDto dto = new MemberDto();
		MemberDao dao = new MemberDao();
		
		//6. Dao의 selectOne 메소드를 사용하여 하나의 레코드만을 가져와 화면 출력
		dto = dao.selectOne(id);
		
		
		//7. 해당 페이지 스코프에 "dto"라는 이름으로 검색한 레코드 한개를 저장
		request.setAttribute("dto", dto);
	}

}
