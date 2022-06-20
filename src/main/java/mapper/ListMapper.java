package mapper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import domain.LoginVO;
import domain.UseHistoryVO;

public class ListMapper {

	public Collection<UseHistoryVO> read(String uid, String status) {
		String url = "jdbc:mysql://localhost:3306/garam?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
		String user = "root";
		String password = "smart";

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		ArrayList<UseHistoryVO> list = new ArrayList<UseHistoryVO>();

		try {
			StringBuffer qry = new StringBuffer();
			qry.append(" SELECT * FROM g_usehistory ");
			qry.append(" WHERE uid = ? AND status = ? ");
			qry.append(" ORDER BY bpdate DESC ");

			String sql = qry.toString();

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, uid);
			stmt.setString(2, status);
			

			rs = stmt.executeQuery();
			
			UseHistoryVO vo = null;
			//전역변수 선언
			
			while (rs.next()) {
				vo = new UseHistoryVO();

				vo.setNum(rs.getInt("num"));
				vo.setUid(rs.getString("uid"));
				vo.setStatus(rs.getString("status"));
				vo.setStart(rs.getString("start"));
				vo.setEnd(rs.getString("end"));
				vo.setBpdate(rs.getTimestamp("bpdate")); //Timestamp로 하면 시분초까지 다 나오고 Date만 하면 년월일까지만 나옴
				//배열 속으로 다 넣음
				list.add(vo);
				
			}

		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return list;
	}

}
