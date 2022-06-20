package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.LoginVO;
import domain.MypageDTO;
import service.MypageService;
import service.MypageServiceImpl;

/**
 * Servlet implementation class MypageController
 */
@WebServlet("/Mypage")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    @Override
	public void init() throws ServletException {
		System.out.println();
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public MypageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//정보 가져오는것
		HttpSession session = request.getSession();
		
		String sessId = (String)session.getAttribute("sessId");
		
		if(sessId == null || "".equals(sessId)) {
			response.sendRedirect("Login");
			return; //void는 그냥 리턴. return을 넣어서 조건에 맞으면 여기까지만 진행. 아래는 진행하지 마라.
		}
		
		MypageDTO dto = new MypageDTO();
		dto.setUid(sessId);
		//오브젝트가 스트링으로 내려오려면 캐스팅을 해줘야한다.
		MypageServiceImpl service = new MypageServiceImpl();
		
		LoginVO vo = service.read(dto);
		
		request.setAttribute("vo", vo);
		//화면에 자료를 띄워줌
		
		
		//페이지를 띄워주는 것 
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/mypage.jsp");
		dispatcher.forward(request, response);
	}


}
