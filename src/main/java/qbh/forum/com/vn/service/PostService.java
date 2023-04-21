package qbh.forum.com.vn.service;

import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.model.Post;

import java.util.List;
import java.util.stream.Collectors;

public class PostService {
    public Post postDetail(int postId) {
        Post detail = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from posts where `status`=1 and id=?;")
                    .bind(0, postId)
                    .mapToBean(Post.class).first();
        });
        return detail;
    }

    public static List<Post> getAll() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from posts").mapToBean(Post.class)
                    .stream().collect(Collectors.toList());
        });
    }

    public static void post(String idA, String img, String content, String created_at) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into posts(idA,img,content,created_at,status) values (?,?,?,?,?)")
                        .bind(0, idA)
                        .bind(1, img)
                        .bind(2, content)
                        .bind(3, created_at)
                        .bind(4, "1")
                        .execute()
        );
    }

    public static void main(String[] args) {
        System.out.println(new PostService().postDetail(1));
    }
}
