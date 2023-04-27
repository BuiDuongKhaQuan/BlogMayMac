package qbh.forum.com.vn.service;

import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.News;

import java.util.List;
import java.util.stream.Collectors;

public class NewsService {
    public static List<News> getData() {
        return JDBiConnector.me().withHandle(handle -> {
            return handle.createQuery("SELECT  * FROM new ")
                    .mapToBean(News.class).stream().collect(Collectors.toList());
        });
    }


    public static void main(String[] args) {
        System.out.println(getData());

    }
}
