package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			dataFactory = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle11g");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberDTO> list() {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select id, pw, name, to_char(birth, 'yyyy/mm/dd') birth, email from member3";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				list.add(new MemberDTO(id, pw, name, birth, email));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return list;
	}
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select name, to_char(birth, 'yyyy/mm/dd') birth, email from member3 where id =? and pw =?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				login = new MemberDTO(dto.getId(), dto.getPw(), name, birth, email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return login;
	}
	
	public void insert(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member3 (id, pw, name, birth, email) values(?, ?, ?, ?, ?)";
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	
	public MemberDTO read(String id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select pw, name, birth, email from member3 where id=?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				dto = new MemberDTO(id, pw, name, birth, email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}
	
	public MemberDTO updateui(String id) {
		MemberDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member3 where id = ?";
		ResultSet rs = null;
		try {
			conn = dataFactory.getConnection();
			System.out.println("DB Connected");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String name = rs.getString("name");
				String birth = rs.getString("birth");
				String email = rs.getString("email");
				
				dto = new MemberDTO(id, null, name, birth, email);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return dto;
	}
	
	
	
	public void update(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member3 set pw=? name=?, to_date(birth, 'yyyy/mm/dd') birth=?, email=? where id=?";
		
		try {
			
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public void delete(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from member3 where id=? and pw=?";
		try {
			
			conn = dataFactory.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
				
	}
	

}
