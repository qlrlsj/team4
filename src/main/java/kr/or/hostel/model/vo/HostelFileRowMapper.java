package kr.or.hostel.model.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class HostelFileRowMapper implements RowMapper{
	
	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException{
		HostelFile file = new HostelFile();
		file.setFileNo(rs.getInt("file_no"));
		file.setHostelCode(rs.getInt("hostel_code"));
		file.setFilename(rs.getString("filename"));
		file.setFilepath(rs.getString("filepath"));
		file.setFileIntro(rs.getString("file_Intro"));
		return file;
		
	}
}
