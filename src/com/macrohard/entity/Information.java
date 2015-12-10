package com.macrohard.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Information entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "information", catalog = "artworkdb")
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
	private Set<DatePos> datePoses = new HashSet<DatePos>(0);
	private Set<InforPics> inforPicses = new HashSet<InforPics>(0);

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
	
	// Constructors

	/** default constructor */
	public Information() {
	}

	/** full constructor */
	public Information(User user, String title, String content,
			Timestamp startTime, Timestamp endTime, Float expense,
			String status, Set<DatePos> datePoses, Set<InforPics> inforPicses) {
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

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "editorid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "title", length = 20)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 1000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "startTime", length = 19)
	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	@Column(name = "endTime", length = 19)
	public Timestamp getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	@Column(name = "expense", precision = 10)
	public Float getExpense() {
		return this.expense;
	}

	public void setExpense(Float expense) {
		this.expense = expense;
	}

	@Column(name = "status", length = 11)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "information")
	public Set<DatePos> getDatePoses() {
		return this.datePoses;
	}

	public void setDatePoses(Set<DatePos> datePoses) {
		this.datePoses = datePoses;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "information")
	public Set<InforPics> getInforPicses() {
		return this.inforPicses;
	}

	public void setInforPicses(Set<InforPics> inforPicses) {
		this.inforPicses = inforPicses;
	}

}