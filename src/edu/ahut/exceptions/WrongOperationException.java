/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.exceptions;

/**
 *
 * @author Haven
 */
public class WrongOperationException extends Exception {

    /**
     * Creates a new instance of
     * <code>WrongOperationException</code> without detail message.
     */
    public WrongOperationException() {
    }

    /**
     * Constructs an instance of
     * <code>WrongOperationException</code> with the specified detail message.
     *
     * @param msg the detail message.
     */
    public WrongOperationException(String msg) {
        super(msg);
    }
}
