/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.service.impl;

import edu.ahut.dao.BulletinDao;
import edu.ahut.dao.impl.DaoFactory;
import edu.ahut.domain.Admin;
import edu.ahut.domain.Bulletin;
import edu.ahut.service.BulletinService;
import edu.ahut.utils.ServiceUtils;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Haven
 * @date May 14, 2013
 */
public class BulletinServiceImpl implements BulletinService {

    private BulletinDao bulletinDao = DaoFactory.getBulletinDao();

    @Override
    public Bulletin newBulletin(String topic, String content, String Attachment, Admin admin) {
        if (!ServiceUtils.checkStringParam(topic, content)) {
            throw new IllegalArgumentException("主题和内容不能为空！");
        }
        if (admin == null) {
            throw new IllegalArgumentException("尚未登陆！");
        }
        Bulletin bulletin = new Bulletin();
        bulletin.setContent(content);
        bulletin.setTopic(topic);
        bulletin.setAttachment(Attachment);
        bulletin.setTime(new Date());
        bulletin.setAdmin(admin);

        return bulletin;
    }

    @Override
    public void saveBulletin(Bulletin bulletin, Admin admin) {
        if (!ServiceUtils.checkStringParam(bulletin.getTopic(), bulletin.getContent())) {
            throw new IllegalArgumentException("主题和内容不能为空！");
        }
        if (bulletin.getTime() == null) {
            bulletin.setTime(new Date());
        }
        if (bulletin.getAdmin() == null) {
            bulletin.setAdmin(admin);
        }
        bulletinDao.saveBulletin(bulletin);
    }

    @Override
    public List<Bulletin> getAllBulletin() {
        List<Bulletin> allBulletin = bulletinDao.getAllBulletin();

//        //TODO 太浪费内存了，admin其实都是一个人
//        for (Bulletin b : allBulletin) {
//            b = bulletinDao.fillAdmin(b);
//        }
        return allBulletin;
    }

    @Override
    public Bulletin getBulletinById(int id) {
        return bulletinDao.getBulletinById(id);
    }
}
