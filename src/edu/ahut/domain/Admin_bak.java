/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

/**
 *
 * @author Haven
 * @date May 25, 2013
 */
public class Admin_bak extends User {

    private boolean superAdmin;

    public Admin_bak() {
    }

    public boolean isSuperAdmin() {
        return superAdmin;
    }

    public void setSuperAdmin(boolean superAdmin) {
        this.superAdmin = superAdmin;
    }
}
