/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao;

import edu.ahut.domain.AnswerGroup;

/**
 *
 * @author Haven
 * @date Jun 2, 2013
 */
public interface AnswerGroupDao extends BasicDao<AnswerGroup> {

    public void clearDate();
}
