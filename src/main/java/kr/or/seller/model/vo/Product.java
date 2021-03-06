package kr.or.seller.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
	public int productNo;
	public String productName;
	public int productPrice;
	public int productScore;
}
