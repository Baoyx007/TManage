/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.dao;

import edu.ahut.domain.Bulletin;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 14, 2013
 */
public interface BulletinDao {

    public void saveBulletin(Bulletin bulletin);

    public List<Bulletin> getAllBulletin();

    public Bulletin fillAdmin(Bulletin bulletin);

    public Bulletin getBulletinById(String id);
}
