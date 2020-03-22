package hidroponiksahabat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Tanggal {
    private SimpleDateFormat tanggal = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    private Date tgl = new Date();
    
    public String getTanggal(){
        tgl = new Date();
        return tanggal.format(tgl);
    }
}
