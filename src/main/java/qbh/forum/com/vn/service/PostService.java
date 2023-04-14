package qbh.forum.com.vn.service;

import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.model.Post;

import java.util.List;
import java.util.stream.Collectors;

public class PostService {
    public Post postDetail(int postId){
        Post detail = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from product where productId = ?")
                    .bind(0, postId)
                    .mapToBean(Post.class).first();
        });
        return detail;
    }
}
