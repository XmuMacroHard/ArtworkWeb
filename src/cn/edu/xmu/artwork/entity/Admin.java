package cn.edu.xmu.artwork.entity;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("admin")
public class Admin extends User {
	private static final long serialVersionUID = 1L;

	private String isValid;

	@Column(name = "isValid", nullable = true,length = 50)
	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}
}
