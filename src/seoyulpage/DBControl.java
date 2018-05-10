package seoyulpage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public interface DBControl {
	public int getTop(int n);
	public void insertSQL(String detail);
	public void permitSQL(int number);
	public void rejectSQL(int number);
	public void deletSQL(int number);
	public String[] selectSQL(int number);
	public void selectTopSQL();
	public void allSelctSQL();
}
