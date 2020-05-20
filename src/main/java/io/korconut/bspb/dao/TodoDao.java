package io.korconut.bspb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import io.korconut.bspb.dto.TodoDto;



public class TodoDao {
	
	private static String dburl = "mysql";
	private static String dbuser = "test";
	private static String dbpasswd = "test";
	
	
	public List<TodoDto> getTodos() {
	
		List<TodoDto> list = new ArrayList<>();
			
		try {
			Class.forName( "com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT id, name, regdate, sequence, title, type FROM todo ORDER BY id";
		
		//새로운 문법 conn 과 ps는 여기서 바로 close된다.
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			try (ResultSet rs = ps.executeQuery()) {
				
				while (rs.next()) {
					long id = rs.getInt("id");
					String name = rs.getString("name");
					String regDate = rs.getString("regDate");
					int sequence = rs.getInt("sequence");
					String title = rs.getString("title");
					String type = rs.getString("type");
					
					TodoDto todo = new TodoDto(id, name, regDate, sequence, title, type);
					list.add(todo);
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		return list;
	}
	
	public List<TodoDto> getTodosByType(String type) {
		
		List<TodoDto> list = new ArrayList<>();
			
		try {
			Class.forName( "com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT id, name, regdate, sequence, title, type FROM todo WHERE type = ? ORDER BY id";
		
		//새로운 문법 conn 과 ps는 여기서 바로 close된다.
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, type);
			try (ResultSet rs = ps.executeQuery()) {
				
				while (rs.next()) {
					long id = rs.getInt("id");
					String name = rs.getString("name");
					String regDate = rs.getString("regDate");
					int sequence = rs.getInt("sequence");
					String title = rs.getString("title");
					
					TodoDto todo = new TodoDto(id, name, regDate, sequence, title, type);
					list.add(todo);
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		return list;
	}

	
	public TodoDto getTodo(Integer Id) {
		
		TodoDto todo = null;
		
		try {
			Class.forName( "com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT id, name, regDate, sequence, title, type  FROM role WHERE id = ?";
		
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			ps.setInt(1, Id);
			try (ResultSet rs = ps.executeQuery()) {
				
				if(rs.next()) {
					long id = rs.getInt("id");
					String name = rs.getString("name");
					String regDate = rs.getString("regDate");
					int sequence = rs.getInt("sequence");
					String title = rs.getString("title");
					String type = rs.getString("type");
					
					todo = new TodoDto(id, name, regDate, sequence, title, type);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return todo;
	}

	public int addAllTodo(TodoDto todo) {
		
		int insertCount = 0;
		
		try {
			Class.forName( "com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		
		String sql = "INSERT INTO todo (id, name, regdate, sequence, title, type) VALUES ( ?, ?, ?, ?, ?, ? )";
		
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setLong(1, todo.getId());
			ps.setString(2, todo.getName());
			ps.setString(3, todo.getRegDate());
			ps.setInt(4, todo.getSequence());
			ps.setString(5, todo.getTitle());
			ps.setString(6, todo.getType());
			
			insertCount = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} 	
		return insertCount;
	}
	
public int addTodo(TodoDto todo) {
		
		int insertCount = 0;
		
		try {
			Class.forName( "com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		
		String sql = "INSERT INTO todo (name, sequence, title, type) VALUES ( ?, ?, ?, ? )";
		
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, todo.getName());
			ps.setInt(2, todo.getSequence());
			ps.setString(3, todo.getTitle());
			ps.setString(4, todo.getType());
			
			insertCount = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} 	
		return insertCount;
	}
	
	
	
	public int deleteTodo(int Id) {
		
		int deleteCount = 0;
				
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		
		String sql = "DELETE FROM todo WHERE id = ?";
		
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql);) {
			ps.setLong(1,  Id);
			deleteCount = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} 	
		return deleteCount;
	}
	
	
	public int updateTodo(TodoDto todo) {
		int updateCount = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		}
		
		String sql = "UPDATE todo SET type = ? WHERE id = ? ";
		
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql);) {
				
			ps.setString(1,  todo.getType());
			ps.setLong(2, todo.getId());
			
			updateCount = ps.executeUpdate();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		} 
		
		return updateCount;
	}
	
	
public int getTodo_id() {
		
		try {
			Class.forName( "com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT last_insert_id()";
		
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
			
			try (ResultSet rs = ps.executeQuery()) {
				
				if(rs.next()) {
					int id = rs.getInt("last_insert_id()");
					return id;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return -1;
	}
}
