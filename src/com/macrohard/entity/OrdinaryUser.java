package com.macrohard.entity;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;


@Entity
@PrimaryKeyJoinColumn(name="ordinaryUserId")
public class OrdinaryUser extends User 
{
	public OrdinaryUser(){}
}
