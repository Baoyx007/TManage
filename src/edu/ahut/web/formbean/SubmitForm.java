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
    private FileItem file;

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
     * @return the file
     */
    public FileItem getFile() {
	return file;
    }

    /**
     * @param file
     *            the file to set
     */
    public void setFile(FileItem file) {
	this.file = file;
    }
}
