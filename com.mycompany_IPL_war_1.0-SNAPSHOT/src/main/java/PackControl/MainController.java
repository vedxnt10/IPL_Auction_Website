/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PackControl;

import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Yash
 */

@Controller
public class MainController {
    Connection con;
     public void Conn()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
//            String connectionUrl = "jdbc:mysql://iplecell.celvsi0nt2l1.us-east-2.rds.amazonaws.com:3306/ecellipl";
            String connectionUrl = "jdbc:mysql://localhost:3306/newipl";
            String dbUser = "root";
            String dbpass = "root@123";
            con = DriverManager.getConnection(connectionUrl, dbUser, dbpass);
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }
//    logindetails ld=new logindetails();
    int ini = 250;
    
    
    @RequestMapping("index")
    public String index(){
        Connections cont=new Connections();
       Conn();
        System.out.println("home page");
        return "index";
    }
    
    @RequestMapping("register")
    public String start(){
        System.out.println("register");
        return "register";
    }
    
   
    @RequestMapping(value="process_register",method=RequestMethod.POST)
    public String registering(
            Model m,
            @RequestParam("team_name")String tn,
            @RequestParam("lead_name")String tl,
            @RequestParam("pteam")String pteam,
            @RequestParam("phone")String phn,
            @RequestParam("email")String em,
            @RequestParam("pass")String pass,
            @RequestParam("trans")int trans
    ){
        System.out.println(tn+tl+pass);
        
        
        try {
            System.out.println("before UPDATING REGISTER");

            
            PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM TEAMS WHERE TEAM_NAME = ?");
            stmt1.setString(1, tn);
            String abc=null;
            ResultSet rs2 = stmt1.executeQuery();
            while (rs2.next()) {

                abc = rs2.getString("TEAM_NAME");
            }
            if(tn.equals(abc)){
                return "team_taken";
            }else{
                int p1 = 0;
                PreparedStatement stmt9=con.prepareStatement("select * from teams");  
                 ResultSet rs8 = stmt9.executeQuery();
                 while(rs8.next()){
                     p1 = rs8.getInt("ID");
                 }
                p1 +=1;
                
                
            PreparedStatement stmt2=con.prepareStatement("INSERT INTO TEAMS (ID,TEAM_NAME,TEAM_LEAD,PASSWORD,TOTAL_AMOUNT,PRIORITY_TEAM,PHONE,EMAIL) values(?,?,?,?,?,?,?,?)");  
            
            stmt2.setInt(1,p1);
            stmt2.setString(2, tn);
            stmt2.setString(3,tl);//1 specifies the first parameter in the query  
            stmt2.setString(4,pass);//1 specifies the first parameter in the query  
            stmt2.setInt(5,ini);//1 specifies the first parameter in the query  
            stmt2.setString(6,pteam);//1 specifies the first parameter in the query  
            stmt2.setString(7,phn);//1 specifies the first parameter in the query  
            stmt2.setString(8,em);//1 specifies the first parameter in the query  
            
            
            stmt2.executeUpdate();
                System.out.println("value updated");
            
            PreparedStatement stmt3 = con.prepareStatement("SELECT CURRENT_DATE() as dates");
            String dates=null;
            ResultSet rs3 = stmt3.executeQuery();
            while (rs3.next()) {
                dates = rs3.getString("dates");
            }
            
            PreparedStatement stmt4 = con.prepareStatement("SELECT CURRENT_Time() as times");
            ResultSet rs4 = stmt4.executeQuery();
            String times=null;
            while (rs4.next()) {
                times = rs4.getString("times");
            }
            
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM TEAMS where team_name=? and password=?");
            stmt.setString(1, tn);
            stmt.setString(2, pass);
            int x = 0;
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                x = rs.getInt("ID");
            }
            
            
            
            System.out.println("time date "+times+dates);
                System.out.println("Before updating history");
            PreparedStatement stmt5= con.prepareStatement("INSERT INTO HISTORY VALUES(?,?,?,?,?,?,?)");
            stmt5.setInt(1, x);
            stmt5.setString(2, tn);
            stmt5.setString(3, times);
            stmt5.setString(4, dates);
            stmt5.setInt(5, ini);
            stmt5.setString(6, pteam);
            stmt5.setInt(7, trans);
            stmt5.executeUpdate();
            
                System.out.println("After updating history");
            
             return "login";    
            
        }
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return "login";
    }
        
        
    @RequestMapping("gotologin")
    public String login2(){
        System.out.println("hiiii");
        return "login";
    }
    
    @RequestMapping(value="login", method=RequestMethod.POST)
    public String login(
            Model m,
            @RequestParam("team_name")String tn,
            @RequestParam("password")String pass
            
    ){
        try {
            
            System.out.println("hii2");
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM TEAMS WHERE TEAM_NAME=? AND PASSWORD=?");
            stmt.setString(1, tn);
            stmt.setString(2, pass);
            System.out.println("hiii3");
            String tnme=null;
            String teaml=null;
            int id=0;
            ResultSet rs = stmt.executeQuery();
            System.out.println("hii4");
            while (rs.next()) {

                tnme = rs.getString("Team_Name");
                teaml = rs.getString("Team_lead");
                id = rs.getInt("ID");
            }
            System.out.println("tnmae : "+tnme);
            
            if(tnme==null){
                return "error";
            }
            else{
               

                m.addAttribute("tname",tnme);
                m.addAttribute("tn",tn);
                m.addAttribute("tl",teaml);
                m.addAttribute("id",id);
                m.addAttribute("con",con);
                return "dashboard";
            }

        } catch (Exception e) {
        }
        return "error";
    }
    
    
    @RequestMapping(value="dashboard",method=RequestMethod.POST)
    public String dashboard(
            Model m,
            @RequestParam("id") int id,
            @RequestParam("tn") String tn
            
    ){

        m.addAttribute("tn",tn);
        m.addAttribute("id",id);
        m.addAttribute("con",con);
        return "dashboard";
       
    }
//    int kk = 0;
    @RequestMapping(value="addbid",method=RequestMethod.POST)
    public String addbid(
            Model m,
            @RequestParam("id") int id,
            @RequestParam("tn") String tn
    ){

//        kk = 1;
        m.addAttribute("tname",tn);
        m.addAttribute("tn",tn);
        m.addAttribute("id",id);
//            System.out.println(demo+ld.team_lead+ld.team_name);
            m.addAttribute("con",con);
        return "addbid";
        
    }
    @RequestMapping(value="leaderboard" , method=RequestMethod.POST)
    public String leader(
            Model m,
            @RequestParam("id") int id,
            @RequestParam("tn") String tn
    ){

        m.addAttribute("tname",tn);
        m.addAttribute("tn",tn);
        m.addAttribute("id",id);
        m.addAttribute("con",con);
        return "leaderboard";
        
    }
      
    
    
    
    @RequestMapping(value="bidadded", method=RequestMethod.POST)
    public String bidadded(
            Model m,
            @RequestParam("amount")int amt,
            @RequestParam("pteam")String pteam,
            @RequestParam("id") int id,
            @RequestParam("tn") String tn,
            @RequestParam("trans") String trans
            
    ){
        m.addAttribute("tname",tn);
        m.addAttribute("tn",tn);
        m.addAttribute("id",id);
        try {
           
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM TEAMS WHERE ID=?");
            stmt.setInt(1, id);
            System.out.println(id+" "+amt+" "+ pteam);
            int dbamt=0;
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                dbamt = rs.getInt("total_amount");
            }
            System.out.println("dbamot: "+dbamt);
            int newamt=dbamt+amt;
            
            System.out.println("newamot: "+newamt);
            
            PreparedStatement stmt2 = con.prepareStatement("UPDATE TEAMS SET TOTAL_AMOUNT=?, priority_team=? where id=?");
            stmt2.setInt(1, newamt);
            stmt2.setString(2, pteam);
            stmt2.setInt(3, id);
            stmt2.executeUpdate();
            
            System.out.println(dbamt);
            
            PreparedStatement stmt3 = con.prepareStatement("SELECT CURRENT_DATE() as dates");
            String dates=null;
            ResultSet rs3 = stmt3.executeQuery();
            while (rs3.next()) {
                dates = rs3.getString("dates");
            }
            
            PreparedStatement stmt4 = con.prepareStatement("SELECT CURRENT_Time() as times");
            ResultSet rs4 = stmt4.executeQuery();
            String times=null;
            while (rs4.next()) {
                times = rs4.getString("times");
            }
            
            System.out.println("time date "+times+dates);
            PreparedStatement stmt5= con.prepareStatement("INSERT INTO HISTORY VALUES(?,?,?,?,?,?,?);");
            stmt5.setInt(1, id);
            stmt5.setString(2,tn);
            stmt5.setString(3, times);
            stmt5.setString(4, dates);
            stmt5.setInt(5, amt);
            stmt5.setString(6, pteam);
            stmt5.setString(7, trans);
            stmt5.executeUpdate();
//            kk = 0;
            
        } catch (Exception e) {
        }
        m.addAttribute("con",con);
        return "autosubmit";
//    }else{
//            m.addAttribute("con",con);
//           return "dashboard"; 
//        }
        
   
        
    }
    
    @RequestMapping(value="logout", method=RequestMethod.POST)
    public String logout(
            Model m,
            @RequestParam("id") int id,
            @RequestParam("tn") String tn
    ){
        id=0;
        tn=null;
        return "index";
    }
}
