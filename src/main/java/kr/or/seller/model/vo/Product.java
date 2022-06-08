package kr.or.seller.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
	public int productNo;
	public String productType;
	public String productName;
	public int productReserve;
}
