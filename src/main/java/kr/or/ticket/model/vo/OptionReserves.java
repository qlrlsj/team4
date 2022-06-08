package kr.or.ticket.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OptionReserves {
	private ArrayList<Integer> optNo;
	private ArrayList<Integer> optQuantity;
	
}
