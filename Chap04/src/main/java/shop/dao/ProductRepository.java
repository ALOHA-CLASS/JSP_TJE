package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	public List<Product> list() {
		
		ArrayList<Product> productList = new ArrayList<Product>();
		
		String sql = " SELECT * FROM product ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while( rs.next() ) {
				Product product = new Product();
				
				product.setProductId( rs.getString("product_id") );
				product.setName( rs.getString("name") );
				product.setUnitPrice( rs.getInt("unit_price") );
				product.setDescription( rs.getString("description") );
				product.setManufacturer( rs.getString("manufacturer") );
				product.setCategory( rs.getString("category") );
				product.setUnitsInStock( rs.getLong("units_in_stock") );
				product.setCondition( rs.getString("condition") );
				
				productList.add(product);
			}
			
		} catch (SQLException e) {
			System.err.println("상품 목록 조회 시, 에러 발생");
			e.printStackTrace();
		}
		return productList; 
	}

}
