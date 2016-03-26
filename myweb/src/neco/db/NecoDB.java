package neco.db;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class NecoDB {
	static DataSource ds;
	static{
		//프로그램이 시작하면서 부터 바로 만든다.	static을 범위로 지정이 가능하다.
		try{
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	public static Connection getConn()
	throws Exception{
		return ds.getConnection();
		
		
	}
	
	
	
}
