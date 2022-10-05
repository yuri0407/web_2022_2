package cs.dit;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MListService implements MemberService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDao dao = new MemberDao();
		int p = 1;
		int numOfRecords = 10;
		
		String page_ = request.getParameter("p");
		
		if(page_ != null)
			p = Integer.parseInt(page_);
		
		ArrayList<MemberDto> dtos = dao.list(p, numOfRecords);
		
		int count = dao.recordCount();
		
		int startNum = p - ((p-1)%5);
		int lastNum = (int)(Math.ceil((float)count/(float)numOfRecords));
		
		request.setAttribute("dtos", dtos);
		request.setAttribute("p", p);
		request.setAttribute("lastNum", lastNum);
		request.setAttribute("startNum", startNum);

	}

}
