package qbh.forum.com.vn.model;

import java.io.Serializable;

public class Account implements Serializable {
    private int id;
    private String user;
    private String pass;
    private String name;
    private String email;
    private String id_fb;

    private int role, status;

    public Account() {
    }

    public Account(int id, String user, String pass, String name, String email, String id_fb, int role, int status) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.name = name;
        this.email = email;
        this.id_fb = id_fb;
        this.role = role;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId_fb() {
        return id_fb;
    }

    public void setId_fb(String id_fb) {
        this.id_fb = id_fb;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
