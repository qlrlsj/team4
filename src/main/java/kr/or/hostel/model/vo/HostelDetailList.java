package kr.or.hostel.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HostelDetailList {
 private Hostel hostel;
 private ArrayList<HostelOption> optionList;
 private ArrayList<HostelFile> fileList;
}
