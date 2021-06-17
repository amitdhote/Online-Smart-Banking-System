/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DbConfig {

    public static Connection connect() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");        
        final String URL = "jdbc:mysql://localhost/mybank";
        final String USER = "root";
        final String PWD = "anand";
        Connection con = DriverManager.getConnection(URL, USER, PWD);
        return con;
    }

    public static String generateAccountnumber() throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select max(id) from account");
        rs.next();
        return String.valueOf(100000 + rs.getInt(1));
    }

    public static String generatePicID() throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select max(id)+1 from customer");
        rs.next();
        String pic = "Pic" + rs.getString(1);
        con.close();
        return pic;
    }

    public static String generateSignID() throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select max(id)+1 from customer");
        rs.next();
        String sign = "Sign" + rs.getString(1);
        con.close();
        return sign;
    }

    public static boolean checkAccount(String accno) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select * from account where accno='" + accno + "'");
        if (rs.next()) {
            con.close();
            return true;
        } else {
            con.close();
            return false;
        }
    }

    public static String findAccountByCustID(String cid) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select * from account where cid='" + cid + "'");
        if (rs.next()) {
            String accno = rs.getString("accno");
            con.close();
            return accno;
        } else {
            return null;
        }
    }

    public static long findAccountBalance(String accno) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select * from account where accno='" + accno + "'");
        if (rs.next()) {
            long amt = rs.getLong("bal");
            con.close();
            return amt;
        } else {
            return 0;
        }
    }

    public static boolean checkUserIDAvailable(String userid) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select * from users where userid='" + userid + "'");
        if (rs.next()) {
            con.close();
            return false;
        } else {
            con.close();
            return true;
        }
    }

    public static boolean checkMobile(String mobile) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select * from customer where phone='" + mobile + "'");
        if (rs.next()) {
            con.close();
            return true;
        } else {
            con.close();
            return false;
        }

    }

    public static boolean checkAdhar(String adhar) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select * from customer where adhar='" + adhar + "'");
        if (rs.next()) {
            con.close();
            return true;
        } else {
            con.close();
            return false;
        }

    }

    public static int countaccounts() throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select count(*) from account where active='Y'");
        rs.next();
        int cnt = rs.getInt(1);
        con.close();
        return cnt;
    }

    public static int todaytrans(String type) throws Exception {
        Connection con = connect();
        String sql = "";
        if (type.equals("dr")) {
            sql = "select sum(dramount) from trans where tdate=current_date()";
        } else {
            sql = "select sum(cramount) from trans where tdate=current_date()";
        }
        ResultSet rs = con.createStatement().executeQuery(sql);
        rs.next();
        int res = rs.getInt(1);
        con.close();
        return res;
    }

    public static String formatDate(String date) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String target = new SimpleDateFormat("dd-MMM-yyyy").format(sdf.parse(date));
        return target;
    }
    
    public static String today() throws Exception {        
        String target = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        return target;
    }
}
