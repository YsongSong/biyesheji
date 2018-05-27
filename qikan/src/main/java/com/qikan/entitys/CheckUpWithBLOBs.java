package com.qikan.entitys;

public class CheckUpWithBLOBs extends CheckUp {
    private String expertmessage;

    public String getExpertmessage() {
        return expertmessage;
    }

    public void setExpertmessage(String expertmessage) {
        this.expertmessage = expertmessage == null ? null : expertmessage.trim();
    }


    @Override
    public String toString() {
        return "CheckUpWithBLOBs{" +
                "expertmessage='" + expertmessage + '\'' +
                '}';
    }

}