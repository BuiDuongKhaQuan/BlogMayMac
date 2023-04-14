package qbh.forum.com.vn.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class JDBiConnector {
    static Jdbi jdbi;


    public static Jdbi me() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }

    private static void makeConnect() {
        try {
            MysqlDataSource source = new MysqlDataSource();
            source.setURL("jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.name());
            source.setUser(DBProperties.user());
            source.setPassword(DBProperties.pass());
            source.setAutoReconnect(true);
            source.setUseCompression(true);
            jdbi = jdbi.create(source);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
