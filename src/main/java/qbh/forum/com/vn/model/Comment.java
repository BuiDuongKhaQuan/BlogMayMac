package qbh.forum.com.vn.model;

import java.io.Serializable;

public class Comment implements Serializable {
    private int id;
    private int userId;
    private int postId;
    private String description;
    private String cmtDate;
    private boolean status;
    private int parentId;

    public Comment() {
    }

    public Comment(int id, int userId, int postId, String description, String cmtDate, boolean status, int parentId) {
        this.id = id;
        this.userId = userId;
        this.postId = postId;
        this.description = description;
        this.cmtDate = cmtDate;
        this.status = status;
        this.parentId = parentId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCmtDate() {
        return cmtDate;
    }

    public void setCmtDate(String cmtDate) {
        this.cmtDate = cmtDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
}
