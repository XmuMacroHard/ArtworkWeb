package com.macrohard.entity;

public class Editor extends User 
{
	private String rank;
	private String description;
	
	public Editor()
	{
		
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}