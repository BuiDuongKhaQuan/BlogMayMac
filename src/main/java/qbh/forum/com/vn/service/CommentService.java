package qbh.forum.com.vn.service;

import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.Account;
import qbh.forum.com.vn.model.Comment;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class CommentService {
    public List<Comment> getListCmtByPost(int postId) {
        List<Comment> list = JDBiConnector.me().withHandle(h ->
                h.createQuery("select * from `comment` where `status`=1 and postId=? and parentId IS NULL")
                        .bind(0, postId)
                        .mapToBean(Comment.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public List<Comment> getListReplyCmtById(int parentId) {
        List<Comment> list = JDBiConnector.me().withHandle(h ->
                h.createQuery("select * from `comment` where `status`=1 and parentId =?")
                        .bind(0, parentId)
                        .mapToBean(Comment.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public int insertCmt(int userId, String postId, String description){
        String id = taoIDComment();
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into comment(id,userId, postId,description,`status`) values (?,?,?,?,1)")
                        .bind(0,id)
                        .bind(1, userId)
                        .bind(2, postId)
                        .bind(3, description)
                        .execute()
        );
        return Integer.parseInt(id);
    }

    public int insertReply(int userId, String postId, String reply, int parentId){
        String id = taoIDComment();
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("insert into comment(id,userId, postId,description,`status`,parentId) values (?,?,?,?,1,?)")
                        .bind(0,id)
                        .bind(1, userId)
                        .bind(2, postId)
                        .bind(3, reply)
                        .bind(4, parentId)
                        .execute()
        );
        return Integer.parseInt(id);
    }

    public void RemoveCmt(int id){
        JDBiConnector.me().withHandle(handle -> {
                    handle.createUpdate("DELETE FROM comment WHERE id = ? or parentId =?")
                            .bind(0, id)
                            .bind(1, id)
                            .execute();
                    return true;
                }
        );
    }


    public Comment getCmtById(int cmtId){
        Comment cmt = JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("select * from comment where id = ?")
                    .bind(0,cmtId)
                    .mapToBean(Comment.class).first();
        });
        return cmt;
    }
    public static String taoIDComment() {
        String numbers = "0123456789";
        StringBuilder stringBuilder = new StringBuilder("");
        Random rd = new Random();

        for (int i = 0; i < 4; i++) {
            int index = rd.nextInt(numbers.length());
            char rdC = numbers.charAt(index);
            stringBuilder.append(rdC);
        }
        List<String> listId = JDBiConnector.me().withHandle(
                handle -> handle.createQuery("SELECT id FROM comment")
                        .mapTo(String.class)
                        .stream()
                        .collect(Collectors.toList()));
        if (listId.contains(stringBuilder.toString())) return taoIDComment();
        else return stringBuilder.toString();
    }
    public static void main(String[] args) {
        System.out.println(new CommentService().getListCmtByPost(1));
    }
}
