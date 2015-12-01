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
	private Boolean location;
	private Float expense;
	private Set<InforPics> inforPicses = new HashSet<InforPics>(0);

	// Constructors

	/** default constructor */
	public Information() {
	}

	/** full constructor */
	public Information(User user, String title, String content,
			Timestamp startTime, Timestamp endTime, Boolean location,
			Float expense, Set<InforPics> inforPicses) {
		this.user = user;
		this.title = title;
		this.content = content;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		this.expense = expense;
		this.inforPicses = inforPicses;
	}
	
	/*business logic methods*/
	
	/*
	 * set the id of the editor
	 * */
	public void setEditorId(long editorId)
	{
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
	
	/*getter and setter*/

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

	public Boolean getLocation() {
		return this.location;
	}

	public void setLocation(Boolean location) {
		this.location = location;
	}

	public Float getExpense() {
		return this.expense;
	}

	public void setExpense(Float expense) {
		this.expense = expense;
	}

	public Set<InforPics> getInforPicses() {
		return this.inforPicses;
	}

	public void setInforPicses(Set<InforPics> inforPicses) {
		this.inforPicses = inforPicses;
	}

}