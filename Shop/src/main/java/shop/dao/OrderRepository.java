package shop.dao;

import java.sql.SQLException;

import shop.dto.Order;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문 등록
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		int result = 0;
		String sql = " INSERT INTO `order` ( ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone ) "
				   + " VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? ) " ;				
		
		int no = 1;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(no++, order.getShipName());
			psmt.setString(no++, order.getZipCode());
			psmt.setString(no++, order.getCountry());
			psmt.setString(no++, order.getAddress());
			psmt.setString(no++, order.getDate());
			psmt.setString(no++, order.getOrderPw());
			psmt.setString(no++, order.getUserId());
			psmt.setInt(no++, order.getTotalPrice());
			psmt.setString(no++, order.getPhone());
			
			result = psmt.executeUpdate();			// 주문 등록 요청
			
		} catch (SQLException e) {
			System.err.println("주문 등록 중, 에러 발생!");
			e.printStackTrace();
		}
		System.out.println("주문 데이터 " + result + "개가 등록되었습니다.");
		
		if( result > 0 ) {
			result = lastOrderNo();
		} else { 
			result = 0;
		}
		return result;
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo() {
		int orderNo = 0;
		String sql = " SELECT LAST_INSERT_ID() ";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if( rs.next() ) {
				orderNo = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("최근 order_no 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return orderNo;
	}
	
	
}





