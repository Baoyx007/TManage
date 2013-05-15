/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service;

import edu.ahut.domain.Admin;
import edu.ahut.domain.Bulletin;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 14, 2013
 */
public interface BulletinService {

    public Bulletin newBulletin(String topic, String content, String Attachment, Admin admin);

    public void saveBulletin(Bulletin bulletin, Admin admin);

    public List<Bulletin> getAllBulletin();

    public Bulletin getBulletinById(String id);
}
