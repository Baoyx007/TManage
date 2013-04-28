/**
 * 
 */
package edu.ahut.exceptions;

/**
 * @author Haven
 * @date 2013-3-19
 * 
 */
public class DaoException extends RuntimeException {

    /**
     * 
     */
    private static final long serialVersionUID = 2545452232963083750L;

    public DaoException() {
	super();

    }

    public DaoException(String message, Throwable cause) {
	super(message, cause);

    }

    public DaoException(String message) {
	super(message);

    }

    public DaoException(Throwable cause) {
	super(cause);

    }

}
