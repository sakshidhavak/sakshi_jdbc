package project_jdbc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
public class Q2_JDBCProject {

	public static void main(String[] args)throws SQLException {
		String drive = "com.mysql.cj.jdbc.Driver";
		try {
			Class.forName(drive);
			
		}catch(ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return;
		}
		
		Connection co = null;
		Statement st = null;
		try {
			co = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/jdbc_project?useSSL=false",
					"root","Pass@123"
					);
			
			st = co.createStatement();
			
			ResultSet rs = null;
			
			String query = "create table  Employee (emp_id int primary key not null, first_name varchar(255),"
					+ " last_name varchar(255), Salary int, dept_id int, email varchar(255), Phone_no varchar(255))";
			String query1 = "insert into Employee values(1, \"Jatin\", \"Thakur\", 30000,25, \"prateeksen@xyz.com\", \"123456789\")";
			
			String query2 = "insert into Employee values(2, \"Nishant\", \"dahiya\", 45000,30,\"nishant@xyz.com\", \"789456123\")";
			
			String query3 = "insert into Employee values(3, \"JIvan\", \"sahu\", 50000,25, \"jivan@xyz.com\", \"456123789\")";
			
			String query4 = "insert into Employee values(4, \"Shubham\", \"K\", 35000,26, \"shubh@xyz.com\", \"741258963\")";
			
			
			String query5 = "insert into Employee values(5, \"Manoj\", \"D\", 65000,26, \"Manoj@xyz.com\", \"22589633147\")";
			
			
			String query6 = "select * from Employee";
			
			String query7 = "Alter Table Employee Modify email varchar(30) not Null";
			
			String query8 = "insert into Employee values(6, \"Sakshi\", \"dhavak\", 25000,25, \"sakshi@xyz.com\", \"123697845\")";
			
			String query9 = "insert into Employee values(7, \"Niharika\", \"Devare\", 36000,30, \"niharika@xyz.com\", \"412563987\")";
			
			String query10 = "Delete from Employee where emp_id in(3,4)";
			String query11 = "Delete From Employee";
			st.execute(query);
			st.executeUpdate(query1);
			st.executeUpdate(query2);
			st.executeUpdate(query3);
			st.executeUpdate(query4);
			st.executeUpdate(query5);
			st.executeUpdate(query7);
			st.executeUpdate(query8);
			st.executeUpdate(query9);
			st.executeUpdate(query10);
			st.executeUpdate(query11);
			rs = st.executeQuery(query6);
			
			while (rs.next()) {
                // Retrieving data from each row
                int id = rs.getInt("emp_id");
                
                String fname = rs.getString("first_name");
                String sName = rs.getString("last_name");
                String Email = rs.getString("email");
                String PhoneNo = rs.getString("Phone_no");
                
                System.out.println("Employee ID: " + id);
                System.out.println("Employee First Name: " + fname);
                System.out.println("Employee Second Name: " + sName);
                System.out.println("Employee Email_id:" + Email);
                System.out.println("Employee Contact Details:" + PhoneNo);
			
			System.out.println("Table Created Successfully");
			
		}


	}catch(SQLException s) {
		System.out.println(s.getMessage());
		s.printStackTrace();
	}finally {
		st.close();
		co.close();
	}

}
}
