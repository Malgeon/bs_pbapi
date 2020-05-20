package io.korconut.bspb.dto;

public class TodoDto {
	
	private Long id;
	private String name;
	private String regDate;
	private int sequence;
	private String title;
	private String type;
	private String sId;
	
	public TodoDto() {
		
	}
	
	public TodoDto(Long id, String name, String regDate, int sequence, String title, String type) {
		super();
		this.id = id;
		this.name = name;
		this.sequence = sequence;
		this.regDate = regDate;
		this.title = title;
		this.type = type;
		this.sId = id.toString();
		
	}
	
	public TodoDto(String name, int sequence, String title, String type) {
		super();
		this.name = name;
		this.sequence = sequence;
		this.title = title;
		this.type = type;
		
	}
	
	public Long getId() {
		return id;
	}
	
	public String getsId() {
		return sId;
	}
	
	public void setId(Long id) {
		this.id = id;
		this.sId = id.toString();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "TodoDto [id=" + id + ", name=" + name + ", regDate=" + regDate + ", sequence=" + sequence + ", title="
				+ title + ", type=" + type + "]";
	}
}
