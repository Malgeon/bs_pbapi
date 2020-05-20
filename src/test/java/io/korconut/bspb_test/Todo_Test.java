package io.korconut.bspb_test;

import java.util.List;
import java.util.Scanner;

import io.korconut.bspb.dao.TodoDao;
import io.korconut.bspb.dto.TodoDto;


public class Todo_Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Todo_Test test = new Todo_Test();
		
		try (Scanner scanner = new Scanner(System.in)) {
			while (true) {
				System.out.print("입력 : ");
				String buffer = scanner.nextLine();
				
				System.out.println(buffer);
				if(buffer.equals("add")) {
					System.out.println("에드");
					test.add();
				}
				if(buffer.equals("del")) {
					test.delete();
				}
				if(buffer.equals("get")) {
					test.get();
				}
				if(buffer.equals("exit")) {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void add() {
		
		long Id = 1;
		String name = "코코볼";
		String regDate = "2020.04.28";
		int sequence = 1;
		String title = "열심히 공부하자";
		String type = "TODO";
		
		TodoDto todo = new TodoDto(Id, name, regDate, sequence, title, type);
		
		TodoDao dao = new TodoDao();
		int insertCount = dao.addAllTodo(todo);
		
		System.out.println(insertCount);
		
	}
	
	public void delete() {
		TodoDao dao = new TodoDao();
		int deleteCount = dao.deleteTodo(1);
		
		System.out.println(deleteCount);
	}
	
	public void get() {
		TodoDao dao = new TodoDao();
		List<TodoDto> list = dao.getTodos();
		
		for(TodoDto role : list) {
			System.out.println(role);
		}
	}
}
