/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

import java.util.Date;

/**
 *
 * @author Haven
 * @date May 19, 2013
 */
public class Mail {

    private String id;
    private User sendUser;
    private User recvUser;
    private String topic;
    private String content;
    private Date sendTime;
    private boolean checked;

    public Mail() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public User getSendUser() {
        return sendUser;
    }

    public void setSendUser(User sendUser) {
        this.sendUser = sendUser;
    }

    public User getRecvUser() {
        return recvUser;
    }

    public void setRecvUser(User recvUser) {
        this.recvUser = recvUser;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }
}
