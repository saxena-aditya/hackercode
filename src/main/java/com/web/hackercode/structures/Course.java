package com.web.hackercode.structures;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Course {
	private String name;
	private String code;
	private int price;
	private String desc;
	private int totalDays;
	private String creator; 
	private String lesson;
	private String chapter;
	private String tags;
	private int mrp;
	private String subDesc;
	private MultipartFile img;
	private List<String> files;
	
	
	
	
	/**
	 * @param files the files to set
	 */
	public void setFiles(List<String> files) {
		this.files = files;
	}
	/**
	 * @return the img
	 */
	public MultipartFile getImg() {
		return img;
	}
	/**
	 * @param img the img to set
	 */
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	/**
	 * @return the subDesc
	 */
	public String getSubDesc() {
		return subDesc;
	}
	/**
	 * @param subDesc the subDesc to set
	 */
	public void setSubDesc(String subDesc) {
		this.subDesc = subDesc;
	}
	/**
	 * @return the tags
	 */
	public String getTags() {
		return tags;
	}
	/**
	 * @param tags the tags to set
	 */
	public void setTags(String tags) {
		this.tags = tags;
	}
	/**
	 * @return the mrp
	 */
	public int getMrp() {
		return mrp;
	}
	/**
	 * @param mrp the mrp to set
	 */
	public void setMrp(int mrp) {
		this.mrp = mrp;
	}
	/**
	 * @return the desc
	 */
	public String getDesc() {
		return desc;
	}
	/**
	 * @param desc the desc to set
	 */
	public void setDesc(String desc) {
		this.desc = desc;
	}
	/**
	 * @return the totalDays
	 */
	public int getTotalDays() {
		return totalDays;
	}
	/**
	 * @param totalDays the totalDays to set
	 */
	public void setTotalDays(int totalDays) {
		this.totalDays = totalDays;
	}
	/**
	 * @return the chapter
	 */
	public String getChapter() {
		return chapter;
	}
	/**
	 * @param chapter the chapter to set
	 */
	public void setChapter(String chapter) {
		this.chapter = chapter;
	}
	/**
	 * @return the lesson
	 */
	public String getLesson() {
		return lesson;
	}
	/**
	 * @param lesson the lesson to set
	 */
	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the price
	 */
	public int getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(int price) {
		this.price = price;
	}
	/**
	 * @return the creator
	 */
	public String getCreator() {
		return creator;
	}
	/**
	 * @param creator the creator to set
	 */
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	
	/**
	 * @return the files
	 */
	public List<String> getFiles() {
		return files;
	}
	public String toString() {
		return "course name: " + getName() + "\nchapter name: " + getChapter() + 
				"\nlesson name: " + getLesson() + "\nfile size: " + getFiles().size(); 
	}
	
}
