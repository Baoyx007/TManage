/**
 * 
 */
package edu.ahut.domain;

import java.util.Date;

/**
 * @author Haven
 * @date 2013-3-19
 * 
 */
public class Manager extends User {
    private Role role;

    public Manager() {
	super();

    }

    public Manager(String id, String name, Date birthday, Gender gender,
	    String password, String username) {
	super(id, name, birthday, gender, password, username);

    }

    /**
     * @return the role
     */
    public String getRole() {
	return role.toString();
    }

    /**
     * @param role
     *            the role to set
     */
    public void setRole(Role role) {
	this.role = role;
    }
}
