package com.javarushtask.usermanager.dao;

import com.javarushtask.usermanager.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Repository
public class UserDaoImpl implements UserDao
{
    private static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User successfully added. User details: " + user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
        logger.info("User successfully updated. User details: " + user);
    }

    @Override
    public void deleteUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        if (user != null)
            session.delete(user);
        logger.info("User successfully deleted. User details: " + user);
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));
        logger.info("User successfully loaded. User details: " + user);
        return user;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from User").list();
        for (User user : userList)
            logger.info("User list: " + user);
        return userList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listByPage(int begin, int num) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM User");
        query.setFirstResult(begin);
        query.setMaxResults(num);
        return query.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> listByName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT e FROM User e WHERE e.name = :name");
        query.setParameter("name", name);
        return query.list();
    }
}
