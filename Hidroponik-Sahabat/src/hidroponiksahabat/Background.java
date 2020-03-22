/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hidroponiksahabat;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import javax.swing.ImageIcon;
import javax.swing.JPanel;

public class Background extends JPanel {
    private Image gambar2;
 
    public Background() {
        gambar2 = new ImageIcon(getClass().getResource("/gambar/background.png")).getImage();
    }
 
    protected void paintComponent(Graphics grphcs1) {
        super.paintComponent(grphcs1);
 
        Graphics2D gd = (Graphics2D) grphcs1.create();
        gd.drawImage(gambar2, 0, 0, getWidth(), getHeight(), null);
        gd.dispose();
    }
}
