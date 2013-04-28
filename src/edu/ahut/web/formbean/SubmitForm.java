/**
 * 
 */
package edu.ahut.web.formbean;

import org.apache.commons.fileupload.FileItem;

/**
 * @author Haven
 * @date 2013-4-5
 * 
 */
public class SubmitForm {
    private String comment;
    private FileItem thesis;

    /**
     * @return the comment
     */
    public String getComment() {
	return comment;
    }

    public SubmitForm() {
	super();

    }

    /**
     * @param comment
     *            the comment to set
     */
    public void setComment(String comment) {
	this.comment = comment;
    }

    /**
     * @return the thesis
     */
    public FileItem getThesis() {
	return thesis;
    }

    /**
     * @param thesis
     *            the thesis to set
     */
    public void setThesis(FileItem thesis) {
	this.thesis = thesis;
    }
}
