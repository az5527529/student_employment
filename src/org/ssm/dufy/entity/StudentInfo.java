package org.ssm.dufy.entity;

import java.io.Serializable;

public class StudentInfo implements Serializable{

	private String id;
	private String uname;
	private String clazz;
	private String userno;
	private String major;
	private String totalScore;
	private String avgDian;
	private String flag;
	
	private String subject;
	private String score;
	private String xuefen;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getClazz() {
		return clazz;
	}
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getAvgDian() {
		return avgDian;
	}
	public void setAvgDian(String avgDian) {
		this.avgDian = avgDian;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getXuefen() {
		return xuefen;
	}
	public void setXuefen(String xuefen) {
		this.xuefen = xuefen;
	}
	
	
	
}
