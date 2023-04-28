package qbh.forum.com.vn.service;


import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.Account;

import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    public static Account getAccountById(int aid) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account where id =?")
                        .bind(0, aid)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );

    }
    public static Account getAccountByUser(String user) {
        List<Account> accountList = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE user = ? ")
                        .bind(0, user)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accountList.size()==0) return null;
        return accountList.get(0);

    }

}
