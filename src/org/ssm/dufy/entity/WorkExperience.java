package org.ssm.dufy.entity;

public class WorkExperience {
    private Integer workExperienceId;

    private String company;

    private String job;

    private String description;

    private String startTime;

    private String endTime;

    private Integer resumeInfoId;

    public Integer getWorkExperienceId() {
        return workExperienceId;
    }

    public void setWorkExperienceId(Integer workExperienceId) {
        this.workExperienceId = workExperienceId;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job == null ? null : job.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public Integer getResumeInfoId() {
        return resumeInfoId;
    }

    public void setResumeInfoId(Integer resumeInfoId) {
        this.resumeInfoId = resumeInfoId;
    }
}