/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.exceptions;

/**
 *
 * @author Haven
 * @date Jun 8, 2013
 */
public class NotConfigedException extends Exception {

    /**
     * Creates a new instance of
     * <code>NotConfigedException</code> without detail message.
     */
    public NotConfigedException() {
    }

    /**
     * Constructs an instance of
     * <code>NotConfigedException</code> with the specified detail message.
     *
     * @param msg the detail message.
     */
    public NotConfigedException(String msg) {
        super(msg);
    }
}
