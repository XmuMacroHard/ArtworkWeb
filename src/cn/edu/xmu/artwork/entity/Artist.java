package cn.edu.xmu.artwork.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name="artistId")
@NamedQueries({
	@NamedQuery(
		name = "Artist.getArtistList",
		query = "from Artist"
	),		
	@NamedQuery(
			name = "Artist.getArtist",
			query = "from Artist where id = :Id"
		)
})
public class Artist extends User 
{
	//need to be add
	//icon
	
	private String realName;
	private String identification;
	private String introduction;
	private String fileurl;
	
	public Artist(){}
	
	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdentification() {
		return identification;
	}
	
	public void setIdentification(String identification) {
		this.identification = identification;
	}
	
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	
	public String getFileurl() {
		return fileurl;
	}

	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	
	
	
}
