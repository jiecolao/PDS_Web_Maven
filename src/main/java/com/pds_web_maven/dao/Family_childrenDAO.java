package com.pds_web_maven.dao;

import com.pds_web_maven.entities.family_children;
import com.pds_web_maven.tools.HibernateUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Family_childrenDAO {
    private HibernateUtil util;
    private SessionFactory factory;
    private Session session;
    
    public void setSession() {
        util = new HibernateUtil();
        factory = util.createFactory(this.getClass());
        session = util.createSession();
    }
    
    public List<Map<String, String>> getData(){
        setSession();
        List<Map<String, String>> respondent = new ArrayList<>();
        try {
            session.beginTransaction();
            List<family_children> dbresult = session.createNamedQuery("family_children.findAll", family_children.class).getResultList();
            for (family_children f : dbresult){ 
                Map<String, String> data = new HashMap<>();
                data.put("fam_bg_id", f.convertFam_ch_id(String.valueOf(f.getFamChId())));
                data.put("p_id", f.convertPid(String.valueOf(f.getP_id())));
                data.put("child_fullname", f.convertChild_fn(f.getChildFullname()));
                data.put("child_dob", f.convertChild_dob(String.valueOf(f.getChildDob())));
                respondent.add(data);
            }
            session.getTransaction().commit();
        } finally {
            util.closeSession();
        }
        return respondent;
    }
    
    public List<Map<String, String>> getChildren(int p_id){
        setSession();
        List<Map<String, String>> respondent = new ArrayList<>();
        try {
            session.beginTransaction();
            List<family_children> dbresult = session.createNamedQuery("family_children.findByPID", family_children.class)
                                                  .setParameter("p_id", p_id)
                                                  .getResultList();
            for (family_children f : dbresult){ 
                Map<String, String> data = new HashMap<>();
                data.put("fam_bg_id", f.convertFam_ch_id(String.valueOf(f.getFamChId())));
                data.put("p_id", f.convertPid(String.valueOf(f.getP_id())));
                data.put("child_fullname", f.convertChild_fn(f.getChildFullname()));
                data.put("child_dob", f.convertChild_dob(String.valueOf(f.getChildDob())));
                respondent.add(data);
            }
            session.getTransaction().commit();
        } finally {
            util.closeSession();
        }
        return respondent;
    }
    
    public void addData(family_children User){
        setSession();
        try {
            session.beginTransaction();
            session.save(User);
            session.getTransaction().commit();
            System.out.println("Data Insertion Complete.");
        } finally {
            factory.close();
        }
    }

    public void updateChildren(Session session, family_children User){
        try {
            family_children data = session.get(family_children.class, User.getFamChId());
            if (User != null){
                data.setP_id(User.getP_id());
                data.setChildFullname(User.getChildFullname());
                data.setChildDob(User.getChildDob());
                System.out.println("Data Updated.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteData(family_children User){
        setSession();
        try {
            session.beginTransaction();
            family_children data = session.get(family_children.class, User.getFamChId());
            if (data != null){
                session.delete(data);
                session.flush();
                session.clear();
                System.out.println("User FOUND.");
            } else 
                System.out.println("User NOT FOUND");
            session.getTransaction().commit();
        } finally {
            factory.close();
        }
    }
    
    public void deleteChildrenCascade(Session session, int p_id){
        List<Map<String, String>> respondent = new ArrayList<>();
        List<family_children> dbresult = session.createNamedQuery("family_children.findByPID", family_children.class)
                                              .setParameter("p_id", p_id)
                                              .getResultList();
        for (family_children f : dbresult){ 
            Map<String, String> data = new HashMap<>();
            data.put("fam_bg_id", f.convertFam_ch_id(String.valueOf(f.getFamChId())));
            data.put("p_id", f.convertPid(String.valueOf(f.getP_id())));
            respondent.add(data);
        }
        for (Map<String, String> f : respondent){
            family_children data = session.get(family_children.class, f.get("fam_bg_id"));
            session.delete(data);
            System.out.println("Children FOUND.");
        }
        session.flush();
        session.clear();
    }
}
