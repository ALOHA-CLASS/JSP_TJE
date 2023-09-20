package shop.dao;

import java.sql.SQLException;

import shop.dto.Product;
import shop.dto.User;

public class UserRepository extends JDBConnection {
	
	/**
	 * 회원 등록
	 * @param user
	 * @return
	 */
	public int insert(User user) {
		int result = 0;
		// [NEW] - file 컬럼 추가
		String sql = " INSERT INTO user (id, password, name, gender, birth, mail, phone, address ) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, user.getId());
			psmt.setString(no++, user.getPassword());
			psmt.setString(no++, user.getName());
			psmt.setString(no++, user.getGender());
			psmt.setString(no++, user.getBirth());
			psmt.setString(no++, user.getMail());
			psmt.setString(no++, user.getPhone());
			psmt.setString(no++, user.getAddress());
			
			result = psmt.executeUpdate();			// 회원 등록 요청
			
		} catch (SQLException e) {
			System.err.println("회원 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("회원 데이터 " + result + "개가 등록되었습니다.");
		return result;
	}
	
	
	/**
	 * 로그인을 위한 사용자 조회
	 * @param id
	 * @param pw
	 * @return
	 */
	public User login(String id, String pw) {
		
		String sql = " SELECT * "
				   + " FROM user "
				   + " WHERE id = ? "
				   + "   AND password = ? ";
		
		User user = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) {
				user = new User();
				user.setId( rs.getString("id") );
				user.setPassword( rs.getString("password") );
				user.setName( rs.getString("name") );
				user.setGender( rs.getString("gender") );
				user.setBirth( rs.getString("birth") );
				user.setMail( rs.getString("mail") );
				user.setPhone( rs.getString("phone") );
				user.setAddress( rs.getString("address") );
				user.setRegistDay( rs.getString("regist_day") );
			}
			
		} catch (SQLException e) {
			System.err.println("사용자 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return user;
	}
	
	
	
	
	/**
	 * 로그인을 위한 사용자 조회
	 * @param id
	 * @param pw
	 * @return
	 */
	public User getUserById(String id) {
		
		String sql = " SELECT * "
				   + " FROM user "
				   + " WHERE id = ? ";
		
		User user = null;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if( rs.next() ) {
				user = new User();
				user.setId( rs.getString("id") );
				user.setPassword( rs.getString("password") );
				user.setName( rs.getString("name") );
				user.setGender( rs.getString("gender") );
				user.setBirth( rs.getString("birth") );
				user.setMail( rs.getString("mail") );
				user.setPhone( rs.getString("phone") );
				user.setAddress( rs.getString("address") );
				user.setRegistDay( rs.getString("regist_day") );
			}
			
		} catch (SQLException e) {
			System.err.println("사용자 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return user;
	}
	
	
	/**
	 * 회원 수정
	 * @param user
	 * @return
	 */
	public int update(User user) {
		int result = 0;
						
		String sql = " UPDATE user SET "
				+ " password= ? , name= ? , gender= ? , birth= ? , mail= ? , phone= ? , address= ? "
				+ " WHERE id = ? ";
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, user.getPassword());
			psmt.setString(no++, user.getName());
			psmt.setString(no++, user.getGender());
			psmt.setString(no++, user.getBirth());
			psmt.setString(no++, user.getMail());
			psmt.setString(no++, user.getPhone());
			psmt.setString(no++, user.getAddress());
			psmt.setString(no++, user.getId());
			result = psmt.executeUpdate();			// 회원 수정 요청
			
		} catch (SQLException e) {
			System.err.println("회원정보 수정 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("회원정보 " + result + "명의 데이터가 수정되었습니다.");
		return result;
		

	}


	/**
	 * 회원 삭제 해줘
	 * @param id
	 * @return
	 */
	public int delete(String id) {
		int result = 0;
		
		String sql = " DELETE FROM user"
				   + " WHERE id = ? ";
		
		int no = 1;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, id);
			
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("삭제완료 중 ,에러");
			e.printStackTrace();
		}
		
		return result;
	}

}

















