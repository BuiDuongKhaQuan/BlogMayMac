package qbh.forum.com.vn.service;


import qbh.forum.com.vn.db.JDBiConnector;
import qbh.forum.com.vn.model.Account;

import java.util.List;
import java.util.stream.Collectors;

public class AccountService {


    public static void editProfileAcountById(String email,
                                             String phone, String fullName, String address, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set email = ?,phone =?,fullName=?,address =? where idA = ?")
                        .bind(0, email)
                        .bind(1, phone)
                        .bind(2, fullName)
                        .bind(3, address)
                        .bind(4, id)
                        .execute()
        );
    }
    public static void lockUpAcountById(String status, String id) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set status =? where idA = ?")
                        .bind(0, status)
                        .bind(1, id)
                        .execute()
        );
    }

    public static List<Account> getAllAccount() {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account")
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static Account getAccountById(int aid) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account where id =?")
                        .bind(0, aid)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList()).get(0)
        );

    }


    public static Account getAccountByUserAndEmail(String user, String email) {
        List<Account> accountList = JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account where user =? and email = ?")
                        .bind(0, user)
                        .bind(1, email)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (accountList.size() == 0) return null;
        return accountList.get(0);
    }

    public static List<Account> getAllAccountByIdA(String idA) {
        return JDBiConnector.me().withHandle(h ->
                h.createQuery("SELECT * FROM account WHERE idA = ?")
                        .bind(0, idA)
                        .mapToBean(Account.class)
                        .stream()
                        .collect(Collectors.toList())
        );

    }

    public static void updateImgAcountById(String img, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set img = ? where idA= ?")
                        .bind(0, img)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updateImgAcountByIdAll(String fullName, String email, String phone, String address, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set fullName=?, email=?,phone=?,address=? where idA= ?")
                        .bind(0, fullName)
                        .bind(1, email)
                        .bind(2, phone)
                        .bind(3, address)
                        .bind(4, idA)
                        .execute()
        );
    }
    public static void updateacountMana(String acountMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set accountManage=? where idA= ?")
                        .bind(0, acountMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updateproductMana( String productMana,String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set productManage=? where idA= ?")
                        .bind(0, productMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updateorderMana(String orderMana,String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set orderManage=? where idA= ?")
                        .bind(0, orderMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updateblogMana(String blogMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set blogManage=? where idA= ?")
                        .bind(0, blogMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updatehomeMana( String homeMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set homeManage=? where idA= ?")
                        .bind(0, homeMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void updategenaralMana( String genaralMana, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set generalManage=? where idA= ?")
                        .bind(0, genaralMana)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void editAcountOrderManageById(String orderManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set orderManage = ? where idA= ?")
                        .bind(0, orderManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountInfoCompanyManageById(String infoCompanyManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set infoCompanyManage = ? where idA= ?")
                        .bind(0, infoCompanyManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountProductManageById(String productManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set productManage = ? where idA= ?")
                        .bind(0, productManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountAccountManageById(String accountManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set accountManage = ? where idA= ?")
                        .bind(0, accountManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountBlogManageById(String blogManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set blogManage = ? where idA= ?")
                        .bind(0, blogManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountContactManageById(String contactManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set contactManage = ? where idA= ?")
                        .bind(0, contactManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountSubscibeManageById(String subscibeManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set subscibeManage = ? where idA= ?")
                        .bind(0, subscibeManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void editAcountFaqsManageById(String faqsManage, String idA) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set faqsManage = ? where idA= ?")
                        .bind(0, faqsManage)
                        .bind(1, idA)
                        .execute()
        );
    }

    public static void resetPasswordAccountById(String idA, String pass) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set pass = ? where idA= ?")
                        .bind(0, pass)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void changePasswordAccountById(String idA, String pass) {
        JDBiConnector.me().withHandle(h ->
                h.createUpdate("update account set pass = ? where idA= ?")
                        .bind(0, pass)
                        .bind(1, idA)
                        .execute()
        );
    }
    public static void deleteAccountById(String idA) {

        JDBiConnector.me().withHandle(h ->
                h.createUpdate("delete from account where idA = ?")
                        .bind(0, idA)
                        .execute()
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

    public static void main(String[] args) {
        getAccountByUser("quan");
    }
}
