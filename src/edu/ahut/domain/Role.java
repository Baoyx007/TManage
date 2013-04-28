/**
 * 
 */
package edu.ahut.domain;

/**
 * @author Haven
 * @date 2013-3-19
 * 
 */
public enum Role {
    SUPER(0), NORMAL(1);

    private int value;

    private Role(int t) {
	value = t;
    }

    public int getValue() {
	return value;
    }
}
