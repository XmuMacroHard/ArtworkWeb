package cn.edu.xmu.artwork.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@DiscriminatorValue("artist")
@NamedQueries({
	@NamedQuery(
		name = "Artist.getArtistList",
		query = "from Artist"
	),
	@NamedQuery(
			name = "Artist.getById",
			query = "from Artist where id = :Id"
	),
	@NamedQuery(
			name = "Artist.getArtistBySort",
			query = "from Artist where identification like :Search"
	),
	@NamedQuery(
			name = "Artist.getArtistByName",
			query = "from Artist where realName like :Search"
	),
	@NamedQuery(
			name = "Artist.submit",
			query = "update User set type='artist',isapprove='pending',"
					+ "identification=?,realName=?,introduction=?,fileurl=?,portrait=? where id=?"
	),
	@NamedQuery(
			name = "Artist.getRecommendedArtists",
			query = "from Artist where isBanned = :isBanned and isapprove = :isApproved"
	)
})
public class Artist extends User 
{

	private static final long serialVersionUID = 1L;
	private String realName;
	private String identification;
	private String introduction;
	private String fileurl;
	private String isapprove;
	private String portrait;									//头像路径
	
	public Artist(){}
	
	@Column(name = "realName", length = 20)
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	@Column(name = "identification", nullable = true,length = 50)
	public String getIdentification() {
		return identification;
	}
	
	public void setIdentification(String identification) {
		this.identification = identification;
	}
	
	@Column(name = "introduction", nullable = true,length = 1000)
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	@Column(name = "Fileurl", nullable = true,length = 40)
	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	
	@Column(name = "Portrait",nullable = true, length = 40)
	public String getPortrait() {
		return portrait;
	}

	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}

	@Column(name = "isapprove",nullable = true, length = 11)
	public String getIsapprove() {
		return isapprove;
	}
	
	public void setIsapprove(String isapprove) {
		this.isapprove = isapprove;
	}
}
