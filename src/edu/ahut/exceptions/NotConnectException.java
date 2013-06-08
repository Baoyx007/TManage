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
public class NotConnectException extends Exception {

    /**
     * Creates a new instance of
     * <code>NotConnectException</code> without detail message.
     */
    public NotConnectException() {
    }

    /**
     * Constructs an instance of
     * <code>NotConnectException</code> with the specified detail message.
     *
     * @param msg the detail message.
     */
    public NotConnectException(String msg) {
        super(msg);
    }
}
