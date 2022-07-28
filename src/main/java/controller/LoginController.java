package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.LoginDTO;
import domain.LoginVO;
import service.LoginServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
//홈페이지 상단에 주소창. 중복되면 서버는 실행되지 않는다.
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//페이지를 띄워주는 것 
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// 한글 깨짐 방지

		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String saveId = request.getParameter("saveId");
		//saveId = checkbox의 name

		LoginDTO dto = new LoginDTO();
		dto.setUid(uid);
		dto.setUpw(upw);

		LoginServiceImpl service = new LoginServiceImpl();
		LoginVO vo = service.read(dto);

		if (vo != null) {
			// true이면 세션생성 및 마이페이지로 이동
			HttpSession session = request.getSession();
			
			session.setAttribute("sessId", vo.getUid());
			session.setAttribute("sessName", vo.getUname());
			session.setAttribute("sessSchName", vo.getSchoolname());
			
			
			if("save".equals(saveId)) {
				//쿠키 만들기
				Cookie cookie = new Cookie("chkId", uid);
				Cookie cookie2 = new Cookie("chkPw", upw);
				cookie.setMaxAge(60*60*24); //1일
				cookie2.setMaxAge(60*60*24); //1일
				cookie.setPath("/");
				cookie2.setPath("/");
//				Java script 는 response가 필요없다.				
//				response.addCookie(cookie);
//				response.addCookie(cookie2);
			}else {
				//체크 해제하고 누르면 쿠키 기록이 남지 않는다.
				Cookie cookie = new Cookie("chkId", uid);
				Cookie cookie2 = new Cookie("chkPw", upw);
				cookie.setMaxAge(0); //0초
				cookie2.setMaxAge(0); //0초
				cookie.setPath("/");
				cookie2.setPath("/");
				
//				response.addCookie(cookie);
//				response.addCookie(cookie2);
			}
			
			
			response.sendRedirect("Mypage");
			
		} else {
			// false이면 로그인 페이지로 이동
			response.sendRedirect("Login");
		}
	}

}
