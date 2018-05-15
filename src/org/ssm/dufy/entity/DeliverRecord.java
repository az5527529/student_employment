package org.ssm.dufy.entity;

public class DeliverRecord {
    private Integer deliverRecordId;

    private Integer jobInfoId;

    private Integer resumeInfoId;

    private String deliverTime;

    public Integer getDeliverRecordId() {
        return deliverRecordId;
    }

    public void setDeliverRecordId(Integer deliverRecordId) {
        this.deliverRecordId = deliverRecordId;
    }

    public Integer getJobInfoId() {
        return jobInfoId;
    }

    public void setJobInfoId(Integer jobInfoId) {
        this.jobInfoId = jobInfoId;
    }

    public Integer getResumeInfoId() {
        return resumeInfoId;
    }

    public void setResumeInfoId(Integer resumeInfoId) {
        this.resumeInfoId = resumeInfoId;
    }

    public String getDeliverTime() {
        return deliverTime;
    }

    public void setDeliverTime(String deliverTime) {
        this.deliverTime = deliverTime == null ? null : deliverTime.trim();
    }
}