package com.macrohard.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Information entity. @author MyEclipse Persistence Tools
 */

public class Information implements java.io.Serializable {

	// Fields

	private Long id;
	private User user;
	private String title;
	private String content;
	private Timestamp startTime;
	private Timestamp endTime;
	private Float expense;
	private String status;
	private Set datePoses = new HashSet(0);
	private Set inforPicses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Information() {
	}

	/** full constructor */
	public Information(User user, String title, String content,
			Timestamp startTime, Timestamp endTime, Float expense,
			String status, Set datePoses, Set inforPicses) {
		this.user = user;
		this.title = title;
		this.content = content;
		this.startTime = startTime;
		this.endTime = endTime;
		this.expense = expense;
		this.status = status;
		this.datePoses = datePoses;
		this.inforPicses = inforPicses;
	}
	
	/*business logic methods*/
	
	/*
	 * set the id of the editor
	 * */
	public void setEditorId(long editorId)
	{
		user = new User();		
		user.setId(editorId);
	}

	// Property accessors
	
	
	/*
	 * add a picture to the set of pictures
	 * */
	public void addPicture(String url)
	{
		InforPics pic = new InforPics();
		pic.setInformation(this);
		pic.setUrl(url);
		inforPicses.add(pic);
	}
	
	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public Float getExpense() {
		return this.expense;
	}

	public void setExpense(Float expense) {
		this.expense = expense;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set getDatePoses() {
		return this.datePoses;
	}

	public void setDatePoses(Set datePoses) {
		this.datePoses = datePoses;
	}

	public Set getInforPicses() {
		return this.inforPicses;
	}

	public void setInforPicses(Set inforPicses) {
		this.inforPicses = inforPicses;
	}

}