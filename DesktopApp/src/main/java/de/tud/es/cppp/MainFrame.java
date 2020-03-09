package de.tud.es.cppp;


import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.view.mxGraph;
import javafx.geometry.Rectangle2D;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


import javax.swing.*;
import java.awt.*;

public class MainFrame extends JFrame {

    private final int XSIZE = 800,YSIZE = 800;

    Object parent;

    private static MainFrame instance;
    public static synchronized MainFrame getInstance(){
        if (MainFrame.instance == null){
            MainFrame.instance = new MainFrame();
        }
        return MainFrame.instance;
    }

    public void setContent(JComponent c){
        this.getContentPane().add(c);
        this.setSize(c.getPreferredSize());
        this.pack();
    }

    private Logger logger;
    private MainFrame(){
        super("Hello, World!");

        logger = LogManager.getLogger(MainFrame.class);




        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setMinimumSize(new Dimension(10,10));
        this.getContentPane().setLayout(new BorderLayout());

        this.setTitle("Desktop App");

        this.setVisible(true);
    }

    public void update() {

    }



}


