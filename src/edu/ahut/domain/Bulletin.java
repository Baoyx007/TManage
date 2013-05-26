/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

import java.util.Date;

/**
 *
 * @author Haven
 * @date May 13, 2013
 */
public class Bulletin {

    private int id;
    private String topic;
    private Date time;
    private String content;
    private String attachment;
    private Admin admin;

    public Bulletin() {
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String Content) {
        this.content = Content;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String Attachment) {
        this.attachment = Attachment;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
}
