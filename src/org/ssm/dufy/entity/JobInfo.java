package org.ssm.dufy.entity;

public class JobInfo {
    private Integer jobInfoId;

    private String jobName;

    private Integer hireNum;

    private String requirement;

    private Byte status;

    private String createdTime;

    private Integer userId;

    public Integer getJobInfoId() {
        return jobInfoId;
    }

    public void setJobInfoId(Integer jobInfoId) {
        this.jobInfoId = jobInfoId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName == null ? null : jobName.trim();
    }

    public Integer getHireNum() {
        return hireNum;
    }

    public void setHireNum(Integer hireNum) {
        this.hireNum = hireNum;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement == null ? null : requirement.trim();
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime == null ? null : createdTime.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}