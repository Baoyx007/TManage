/**
 *
 */
package edu.ahut.dao.impl;

/**
 * @author Haven
 * @date 2013-4-2
 *
 */
public class SubjectDaoImpl  {

//    /*
//     * (non-Javadoc)
//     * 
//     * @see edu.ahut.dao.SubjectDao#addSubject(edu.ahut.domain.Subject)
//     */
//    @Override
//    public void addSubject(Subject subject) {
//        String sql = "insert into subject(id,title,description,teacher_id) values(?,?,?,?)";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            runner.update(
//                    sql,
//                    new Object[]{subject.getId(), subject.getTitle(),
//                subject.getDescription(), subject.getTeacher().getId()});
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
//     * @see edu.ahut.dao.SubjectDao#getAllSubject()
//     */
//    @Override
//    public List<Subject> getAllSubject() {
//        String sql = "select id,title,description from subject";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql,
//                    new BeanListHandler<Subject>(Subject.class));
//
//        } catch (SQLException e) {
//            throw new DaoException(e);
//        }
//    }
//
//    /*
//     * (non-Javadoc)
//     * 
//     * @see edu.ahut.dao.SubjectDao#chooseSubject(java.lang.String,
//     * java.lang.String)
//     */
//    @Override
//    public void selectSubject(String subjectId, String studentId) {
//        String sql = "update subject set student_id=? where id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            runner.update(sql, studentId, subjectId);
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
//     * @see edu.ahut.dao.SubjectDao#findSubjectBySid(java.lang.String)
//     */
//    @Override
//    public Subject findSubjectBySid(String sid) {
//        String sql = "select id,title,description from subject where student_id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanHandler<Subject>(Subject.class),
//                    sid);
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
//     * @see edu.ahut.dao.SubjectDao#getSubjectByid(java.lang.String)
//     */
//    @Override
//    public Subject getSubjectByid(String id) {
//        String sql = "select id,title,description from subject where id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new BeanHandler<Subject>(Subject.class),
//                    id);
//        } catch (SQLException e) {
//
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
//
//    @Override
//    public String getTidBySid(String sid) {
//        String sql = "select teacher_id from subject where student_id=?";
//        QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//        try {
//            return runner.query(sql, new ScalarHandler<String>(), sid);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DaoException(e);
//        }
//    }
}
