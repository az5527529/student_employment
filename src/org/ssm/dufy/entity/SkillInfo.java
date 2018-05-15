package org.ssm.dufy.entity;

public class SkillInfo {
    private Integer skillInfoId;

    private String skillName;

    private Byte skillAbility;

    private Integer resumeInfoId;

    public Integer getSkillInfoId() {
        return skillInfoId;
    }

    public void setSkillInfoId(Integer skillInfoId) {
        this.skillInfoId = skillInfoId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName == null ? null : skillName.trim();
    }

    public Byte getSkillAbility() {
        return skillAbility;
    }

    public void setSkillAbility(Byte skillAbility) {
        this.skillAbility = skillAbility;
    }

    public Integer getResumeInfoId() {
        return resumeInfoId;
    }

    public void setResumeInfoId(Integer resumeInfoId) {
        this.resumeInfoId = resumeInfoId;
    }
}