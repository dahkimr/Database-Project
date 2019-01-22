import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

import java.nio.file.Paths;
import java.nio.file.Files;
import java.io.IOException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class LibraryApp {

	private static final int FRAME_WIDTH = 400;
	private static final int FRAME_HEIGHT = 500;
	
	private static JFrame frame;
	private static JButton dropBtn; 
	private static JButton createBtn;
	private static JButton populateBtn;
	private static JButton queryBtn;

	private static Connection conn1;

	public static void main(String[] args) {
		runApp();
		disconnect();
	}	

	private static void disconnect() {

            	try {
                	if (conn1 != null && !conn1.isClosed()) {
                 		conn1.close();
                	}
                 } catch (SQLException ex) {
                	ex.printStackTrace();
            	}

	}

	private static void runApp() {

		frame = new JFrame("Library App");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setSize(FRAME_WIDTH,FRAME_HEIGHT);
		
		frame.setLayout(new GridLayout(4,1));
	
		dropBtn = new JButton("Drop Tables");
		createBtn = new JButton("Create Tables");
		populateBtn = new JButton("Populate Tables");
		queryBtn = new JButton("Query Tables");

		dropBtn.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				dropTables();
			}
		});
		createBtn.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				createTables();
			}
		});
		populateBtn.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				populateTables();
			}
		});
		queryBtn.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				queryTables();
			}
		});

		frame.add(dropBtn);
		frame.add(createBtn);
		frame.add(populateBtn);
		frame.add(queryBtn);
		

		frame.setVisible(true);
	}

	private static void dropTables() {

		File file = new File("droptables.txt");			 															
             	try {
            		Class.forName("oracle.jdbc.OracleDriver");																				
         	
             		String dbURL1 = "jdbc:oracle:thin:system/oracle@localhost:1521/orcl";
			
			conn1 = DriverManager.getConnection(dbURL1);
            		if (conn1 != null) {
                		System.out.println("Connected with connection #1");
            		}

			try {
        			Scanner sc = new Scanner(file);  
				System.out.println("Dropping tables...");

			
			while (sc.hasNextLine()) {
            			
				String dropTxt = sc.nextLine();
				try {

					Statement stmt = conn1.createStatement();
					stmt.execute(dropTxt);
				} catch (SQLException e) {
				System.out.println(e.getErrorCode());
				}	
        		}
			System.out.println("Tables were dropped!");
			JOptionPane.showMessageDialog(frame, "Tables were dropped.");
			sc.close(); 
			} catch (FileNotFoundException e) {
        			e.printStackTrace();
    			}
			
 
        	} catch (ClassNotFoundException ex) {
            		ex.printStackTrace();
        	} catch (SQLException ex) {
            		ex.printStackTrace();
        	}

	}

	private static void createTables() {															
         	
             	File file = new File("createtables.txt");			 															
             	try {
            		Class.forName("oracle.jdbc.OracleDriver");																				
         	
             		String dbURL1 = "jdbc:oracle:thin:system/oracle@localhost:1521/orcl";
			
			conn1 = DriverManager.getConnection(dbURL1);
            		if (conn1 != null) {
                		System.out.println("Connected with connection #1");
            		}

			try {
        			Scanner sc = new Scanner(file);  
				System.out.println("Creating tables...");
			
			while (sc.hasNextLine()) {
            			
				String createTxt = sc.nextLine();
				try {

					Statement stmt = conn1.createStatement();
					stmt.execute(createTxt);
				} catch (SQLException e) {
				System.out.println(e.getErrorCode());
				}	
        		}
			System.out.println("Tables were created!");
			JOptionPane.showMessageDialog(frame, "Tables were created.");
			sc.close(); 
			} catch (FileNotFoundException e) {
        			e.printStackTrace();
    			}
 
        	} catch (ClassNotFoundException ex) {
            		ex.printStackTrace();
        	} catch (SQLException ex) {
            		ex.printStackTrace();
        	} 

	}

	private static void populateTables() {															
         	
             	File file = new File("populatetables.txt");			 															
             	try {
            		Class.forName("oracle.jdbc.OracleDriver");																				
         	
             		String dbURL1 = "jdbc:oracle:thin:system/oracle@localhost:1521/orcl";
			
			conn1 = DriverManager.getConnection(dbURL1);
            		if (conn1 != null) {
                		System.out.println("Connected with connection #1");
            		}

			try {
        			Scanner sc = new Scanner(file);  
				System.out.println("Populating tables...");
			
			while (sc.hasNextLine()) {
            			
				String createTxt = sc.nextLine();
				try {

					Statement stmt = conn1.createStatement();
					stmt.execute(createTxt);
				} catch (SQLException e) {
				System.out.println(e.getErrorCode());
				}	
        		}
			System.out.println("Tables were populated!");
			JOptionPane.showMessageDialog(frame, "Tables were populated.");
			sc.close(); 
			} catch (FileNotFoundException e) {
        			e.printStackTrace();
    			}
 
        	} catch (ClassNotFoundException ex) {
            		ex.printStackTrace();
        	} catch (SQLException ex) {
            		ex.printStackTrace();
        	} 

	}

	private static void queryTables() {
		try {
            		Class.forName("oracle.jdbc.OracleDriver");																				
         	
             		String dbURL1 = "jdbc:oracle:thin:system/oracle@localhost:1521/orcl";
			
			conn1 = DriverManager.getConnection(dbURL1);
			if (conn1 != null) {
                		System.out.println("Connected with connection #1");
            		}

			String query = "SELECT Name FROM member";
							
			try (Statement stmt = conn1.createStatement()) {
			System.out.println("Name of library members:");
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				String name = rs.getString("Name");
				System.out.println(name);
			}
			} catch (SQLException e) {
				System.out.println(e.getErrorCode());
			}

			query = "SELECT Author, Title FROM book WHERE Author LIKE 'J%'";
							
			try (Statement stmt = conn1.createStatement()) {
			System.out.println("\nBooks with Authors whose names start with J:");
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				String author = rs.getString("Author");
				String title= rs.getString("Title");
				System.out.println(title + " by " + author);
			}
			} catch (SQLException e) {
				System.out.println(e.getErrorCode());
			}

			query = "SELECT Phone, Name FROM member m, bborrow b WHERE m.LibCard = b.LibCard AND Isbn = '978-0345339706'";
							
			try (Statement stmt = conn1.createStatement()) {
			System.out.println("\nContact Info of Member who've borrowed The Fellowship of the Ring:");
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				String name = rs.getString("Name");
				String phone = rs.getString("Phone");
				System.out.println("Name: " + name + " Phone: " + phone);
			}
			} catch (SQLException e) {
				System.out.println(e.getErrorCode());
			}

			JOptionPane.showMessageDialog(frame, "Queries were printed in terminal.");
 
        	} catch (ClassNotFoundException ex) {
            		ex.printStackTrace();
        	} catch (SQLException ex) {
            		ex.printStackTrace();
        	} 
	}
}
