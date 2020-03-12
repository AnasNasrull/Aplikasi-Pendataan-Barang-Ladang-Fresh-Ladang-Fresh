package hidroponiksahabat;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class koneksi {
    private static Connection dbcon;
    public static Connection koneksiDB() throws SQLException {
        if(dbcon==null){
            try {
                String DB="jdbc:mysql://localhost:3306/ppl";
                String user="root";
                String pass="";
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                dbcon = (Connection) DriverManager.getConnection(DB,user,pass);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null,"gagal koneksi");
            }
        }
        return dbcon;
    }
}
