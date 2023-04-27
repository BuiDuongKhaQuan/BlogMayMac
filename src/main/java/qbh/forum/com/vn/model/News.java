package qbh.forum.com.vn.model;

import java.io.Serializable;

public class News implements Serializable {
    int idnew;
    String title;
    String category;
    String time;
    String content;
    String link;
    String image;

    public News() {
    }

    public News(int idnew, String title, String category, String time, String content, String link, String image) {
        this.idnew = idnew;
        this.title = title;
        this.category = category;
        this.time = time;
        this.content = content;
        this.link = link;
        this.image = image;
    }

    public int getIdnew() {
        return idnew;
    }

    public void setIdnew(int idnew) {
        this.idnew = idnew;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "News{" +
                "idnew=" + idnew +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", time='" + time + '\'' +
                ", content='" + content + '\'' +
                ", link='" + link + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
