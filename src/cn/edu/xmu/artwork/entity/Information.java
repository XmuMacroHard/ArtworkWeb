package cn.edu.xmu.artwork.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Information entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "information", catalog = "artworkdb")

@NamedQueries({
	@NamedQuery(
		name = "Information.getInfoShownOnHomePage",
		query = "select i from Information i inner join i.datePoses d where d.date = :today and d.location = :location and i.status = :status"
	),
	@NamedQuery(
			name = "Information.getInfoById",
			query = "from Information i where i.id = :infoId"
		),
	@NamedQuery(
		name = "Information.getInfoByColum",
		query = "select i from Information i inner join i.datePoses d where d.colum = :colum"
	),
	@NamedQuery(
			name = "Information.getDefaultInfos",
			query = "from Information i where i.status = :default"
		),
		@NamedQuery(
				name = "Information.updateInfoStatus",
				query = "update Information info set info.status = :status where info.id = :id"
			),
	@NamedQuery(
			name = "Information.getInfoByEditorId",
			query = "from Information i where editorid = :editorid"
		)		
			
	
})
public class Information implements java.io.Serializable {

	// Fields

	private Long id;
	private User user;
	private String title;
	private String content;
	private Timestamp startTime;
	private Timestamp endTime;
	private Float expense;
	private String status;								// -1:待审核  0:审核不通过 1:审核通过	2:默认资讯	
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
	public void addPicture(List<String> urls)
	{
		InforPics pic = new InforPics();
		for(String aUrl : urls)
		{
			pic.setInformation(this);
			pic.setUrl(aUrl);		
			inforPicses.add(pic);
		}
	}
	
	public void addDatePos(DatePos datePos)
	{
		datePos.setInformation(this);
		datePoses.add(datePos);
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

	@OneToMany( fetch = FetchType.LAZY, mappedBy = "information")
	public Set<DatePos> getDatePoses() {
		return this.datePoses;
	}

	public void setDatePoses(Set<DatePos> datePoses) {
		this.datePoses = datePoses;
	}

	@OneToMany( fetch = FetchType.LAZY, mappedBy = "information")
	public Set<InforPics> getInforPicses() {
		return this.inforPicses;
	}

	public void setInforPicses(Set<InforPics> inforPicses) {
		this.inforPicses = inforPicses;
	}

}