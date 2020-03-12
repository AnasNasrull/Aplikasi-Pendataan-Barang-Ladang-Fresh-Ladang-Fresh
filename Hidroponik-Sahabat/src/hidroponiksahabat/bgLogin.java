package hidroponiksahabat;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JPanel;

public class bgLogin extends JPanel{
    private Image gambar1;
 
    public bgLogin() {
        gambar1 = new ImageIcon(getClass().getResource("/gambar/home.png")).getImage();
    }
 
    @Override
    protected void paintComponent(Graphics grphcs) {
        super.paintComponent(grphcs);
 
        Graphics2D gd = (Graphics2D) grphcs.create();
        gd.drawImage(gambar1, 0, 0, getWidth(), getHeight(), null);
        gd.dispose();
    }
}