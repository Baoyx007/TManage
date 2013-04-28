/**
 * 
 */
package edu.ahut.domain;

/**
 * @author Haven
 * @date 2013-3-19
 * 
 */
public enum Gender {
    MALE(1), FEMALE(0);
    private int value;

    private Gender(int t) {
	value = t;
    }

    public int getValue() {
	return value;
    }
}
