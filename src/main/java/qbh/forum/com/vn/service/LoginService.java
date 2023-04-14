package qbh.forum.com.vn.service;


import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.Account;

import java.util.List;
import java.util.stream.Collectors;

public class LoginService {

    public static void signUp(String user, String pass, String email, String name) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("INSERT INTO account(user,name,pass,email,status,role,id_fb)" +
                                "VALUES (?,?,?,?,1,0,null)")
                        .bind(0, user).bind(1, name).bind(2, pass).bind(3, email)
                        .execute()
        );
    }

    public static Account login(String user, String pass) {
        List<Account> accountList = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE user = ? and pass = ?")
                        .bind(0, user)
                        .bind(1, pass)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accountList.size() == 0) return null;
        return accountList.get(0);
    }

}
