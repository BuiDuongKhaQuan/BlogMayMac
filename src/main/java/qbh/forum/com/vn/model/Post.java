package qbh.forum.com.vn.model;

import java.io.Serializable;

public class Post implements Serializable {
    private int id;
    private String img;
    private String content;
    private int idA;
    private String created_at;
    private int status;

    public Post() {
    }

    public Post(int id, String img, String content, int idA, String created_at, int status) {
        this.id = id;
        this.img = img;
        this.content = content;
        this.idA = idA;
        this.created_at = created_at;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getIdA() {
        return idA;
    }

    public void setIdA(int idA) {
        this.idA = idA;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Post{" +
                "id=" + id +
                ", img='" + img + '\'' +
                ", content='" + content + '\'' +
                ", idA=" + idA +
                ", created_at='" + created_at + '\'' +
                ", status=" + status +
                '}';
    }
}
