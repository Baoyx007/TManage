/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.ahut.domain;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Set;

/**
 *
 * @author Haven
 * @date May 30, 2013
 */
public class SubjectQueue {

    private int id;
    //Queue Method	Equivalent Deque Method
    //add(e)	addLast(e)
    //offer(e)	offerLast(e)
    //remove()	removeFirst()
    //poll()	pollFirst()
    //element()	getFirst()
    //peek()  peekFirst()
    private Queue<Subject> uncheckedSubjects = new LinkedList<Subject>();
    private Set<Subject> checkedSubjects = new HashSet<Subject>();

    public SubjectQueue() {
    }

    public SubjectQueue(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    private void setId(int id) {
        this.id = id;
    }

    public Queue<Subject> getUncheckedSubjects() {
        return uncheckedSubjects;
    }

    public void setUncheckedSubjects(Queue<Subject> uncheckedSubjects) {
        this.uncheckedSubjects = uncheckedSubjects;
    }

    public Set<Subject> getCheckedSubjects() {
        return checkedSubjects;
    }

    public void setCheckedSubjects(Set<Subject> checkedSubjects) {
        this.checkedSubjects = checkedSubjects;
    }
    
    public void passSubject(Subject subject){
        
    }
}
