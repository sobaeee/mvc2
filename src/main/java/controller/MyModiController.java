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
import service.MypageServiceImpl;

/**
 * Servlet implementation class MyModiController
 */
@WebServlet("/MyModi")
public class MyModiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyModiController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//정보 가져오는것
		HttpSession session = request.getSession();
		MypageDTO dto = new MypageDTO();
		dto.setUid((String)session.getAttribute("sessId"));
		//오브젝트가 스트링으로 내려오려면 캐스팅을 해줘야한다.
		MypageServiceImpl service = new MypageServiceImpl();
		
		LoginVO vo = service.read(dto);
		
		request.setAttribute("vo", vo);
		//화면에 자료를 띄워줌
		
		
		//페이지를 띄워주는 것 
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/mymodi.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		LoginVO vo = new LoginVO();
		
		vo.setUid(request.getParameter("uid"));
		vo.setUname(request.getParameter("uname"));
		vo.setSchoolname(request.getParameter("schoolname"));
		vo.setGradeclass(request.getParameter("gradeclass"));
		vo.setRoute(request.getParameter("route"));
		vo.setBoardingplace(request.getParameter("boardingplace"));
		
		MypageServiceImpl service = new MypageServiceImpl();
		service.update(vo);
		
		response.sendRedirect("Mypage");
	}

}
