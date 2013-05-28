/**
 *
 */
package edu.ahut.dao.impl;

/**
 * @author Haven
 * @date 2013-4-5
 *
 */
public class ThesisDaoImpl {

//    /*
//     * (non-Javadoc)
//     * 
//     * @see edu.ahut.dao.ThesisDao#addThesis(edu.ahut.domain.Thesis)
//     */
//    @Override
//    public void addThesis(Thesis thesis) {
//        String sql = "INSERT INTO thesis(id,real_file_name,uuid_file_name,uuid_file_path,stu_comment,subject_id) VALUES(?,?,?,?,?,?)";
//
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            runner.update(sql, thesis.getId(), thesis.getRealFileName(), thesis
//                    .getUuidFileName(),thesis.getUuidFilePath(), thesis.getStudentComment(),
//                    thesis.getSubject().getId());
//        } catch (SQLException e) {
//
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    /*
//     * (non-Javadoc)
//     * 
//     * @see edu.ahut.dao.ThesisDao#addForeignKey(edu.ahut.domain.Thesis,
//     * java.lang.String)
//     */
//    @Override
//    public void addForeignKey(Thesis thesis, String key) {
//    }
//
//    /*
//     * (non-Javadoc)
//     * 
//     * @see edu.ahut.dao.ThesisDao#getThesis(java.lang.String)
//     */
//    @Override
//    public List<Thesis> getThesesBySbId(String sbId) {
//        String sql = "select id,real_file_name as realFileName,uuid_file_name as uuidFileName,"
//                + "uuid_file_path as uuidFilePath,submit_date as submitDate,stu_comment as studentComment,"
//                + "tea_comment as teacherComment,subject_id as subjectId from thesis where subject_id=? order by submit_date desc";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanListHandler<Thesis>(Thesis.class),
//                    sbId);
//        } catch (SQLException e) {
//            throw new DaoException(e);
//        }
//    }
//
//    /*
//     * (non-Javadoc)
//     * 
//     * @see edu.ahut.dao.ThesisDao#getThesis(java.lang.String)
//     */
//    @Override
//    public Thesis getThesis(String id) {
//        // TODO subject没法映射
//        return null;
//    }
}
