package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

import dto.MemberDto;


public class MemberDao {

   private static MemberDao dao = new MemberDao();
   
   private MemberDao() {
      DBConnection.initConnection();
   }
   
   public static MemberDao getInstance() {
      return dao;
   }
   
   // νμ μΆκ°
   public boolean addMember(MemberDto dto) {
      
      
      String sql = " INSERT INTO MEMBER(MEMBERID, PWD, EMAIL, NAME, PHONENUM, GENDER, "
            + " TRAINERID, PROFILEIMG, AGE, HEIGHT, GWEIGHT, MEMLEVEL, "
            + " MEMTYPE, GYMNAME, TRAINERCONTENT, WEIGHT, COUNT ) "
            + " VALUES(?, ?, ?, ?, ?, ?, "
            + "         ?, ?, ?, ?, ?, ?, "
            + "         ?, ?, ?, ?, ?) ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      int count = 0; 
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/3 S addMember");   
         
         psmt = conn.prepareStatement(sql);
         System.out.println("2/3 S addMember");
         
         psmt.setString(1, dto.getMemberID());  
         psmt.setString(2, dto.getPwd());
         psmt.setString(3, dto.getEmail());
         psmt.setString(4, dto.getName()); 
         psmt.setString(5, dto.getPhoneNum()); 
         psmt.setString(6, dto.getGender()); 
         
         
         
         psmt.setString(7, dto.getTrainerID());
         psmt.setString(8, dto.getProfileImg());
         psmt.setInt(9, dto.getAge());
         psmt.setDouble(10, dto.getHeight());
         psmt.setDouble(11, dto.getgWeight());
         psmt.setDouble(12, dto.getMemLevel());
         
         psmt.setDouble(13, dto.getMemType());
         psmt.setString(14, dto.getGymName());
         psmt.setString(15, dto.getTrainerContent());
         psmt.setDouble(16, dto.getWeight());
         psmt.setInt(17, dto.getCount());
         
         count = psmt.executeUpdate();
         System.out.println("3/3 S addMember");
      } catch (SQLException e) {
         e.printStackTrace();
         System.out.println("addMember fail");
      } finally {
         DBClose.close(conn, psmt, null);
      }
      
      return count>0?true:false;
      
   }
   
   
   // λ‘κ·ΈμΈνμΈ
   public MemberDto login(String id, String pwd) {
      
      String sql = " SELECT MEMBERID, EMAIL, NAME, MEMTYPE"
            + " FROM MEMBER "
            + " WHERE MEMBERID=? AND PWD=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      MemberDto mem = null;
      
      try {
         conn = DBConnection.getConnection();
         psmt = conn.prepareStatement(sql);
         System.out.println("1/3 S login");
         
         psmt.setString(1, id);
         psmt.setString(2, pwd);
         
         System.out.println("2/3 S login");
         
         rs = psmt.executeQuery();
         
         if(rs.next()) {
            String memberID = rs.getString(1);
            String email = rs.getString(2);
            String name = rs.getString(3);
            int memType = rs.getInt(4);
//         // DTOμμ±μμΆκ°      
            mem = new MemberDto(memberID, email, name, memType);   
         }
         System.out.println("3/3 login suc");
         
      } catch (Exception e) {
         System.out.println("login fail");
         e.printStackTrace();
      } finally {
         DBClose.close(conn, psmt, rs);         
      }
            
      return mem;
   }
      
   // idμ€λ³΅μ²΄ν¬
   public boolean getId(String id) {
      
      String sql = " SELECT MEMBERID "
            + " FROM MEMBER "
            + " WHERE MEMBERID=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      boolean findid = false;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/3 S getId");
         
         psmt = conn.prepareStatement(sql);
         System.out.println("2/3 S getId");
         
         psmt.setString(1, id.trim());
         
         rs = psmt.executeQuery();
         System.out.println("3/3 S getId");
         
         if(rs.next()) {   // μ‘΄μ¬
            findid = true;
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
         System.out.println("getId fail");
      } finally {
         DBClose.close(conn, psmt, rs);
      }
      return findid;
   }
   //μ΄λμ λ€λ³΄κ±°λ, λ‘κ·ΈμΈ ν  λ μ¬λΌκ°λ€?
   
   
   
   
}