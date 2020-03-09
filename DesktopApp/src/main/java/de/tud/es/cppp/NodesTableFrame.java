package de.tud.es.cppp;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.util.Enumeration;
import java.util.HashMap;

public class NodesTableFrame extends JFrame {
    private final JTable table;
    DefaultTableModel tableModel;
    private final String[] columnNames = {"", "NodeID", "sta MAC", "AP MAC"};
    private Logger logger = LogManager.getLogger(NodesTableFrame.class);
    public NodesTableFrame() {
        super("Connected Nodes");

        logger.info("Creating NodesTableFrame");

        this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        this.setMinimumSize(new Dimension(800, 600));
        this.getContentPane().setLayout(new BorderLayout());

        tableModel = new DefaultTableModel(columnNames,0);

        this.table = new JTable(tableModel);

        // Set Table Editor with Textfield
        JTextField textField = new JTextField();
        textField.setEditable(false);
        table.setDefaultEditor(Object.class, new DefaultCellEditor(textField));

        table.getTableHeader().setReorderingAllowed(false);
        table.setColumnSelectionAllowed(false);
        table.setRowSelectionAllowed(false);

        table.setDefaultRenderer(Object.class, new DefaultTableCellRenderer(){
            @Override
            public Component getTableCellRendererComponent(JTable table,
                                                           Object value, boolean isSelected, boolean hasFocus, int row, int col) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, col);
                String entryType = (String) table.getModel().getValueAt(row, 0);
                if(entryType.contains("Node")){
                    setBackground(Color.gray);
                }else if(entryType.contains("Uplink")){
                    setBackground(Color.lightGray);
                }else if(entryType.contains("Station")){
                    setBackground(Color.white);
                }
                setForeground(table.getForeground());
                return this;
            }
        }
        );


        // Set width for all Columns
        Enumeration<TableColumn> cols = table.getColumnModel().getColumns();
        while (cols.hasMoreElements()){
            TableColumn col = cols.nextElement();
            col.setMinWidth(50);
            col.setPreferredWidth(100);
            col.setMaxWidth(150);
        }
        final JScrollPane scrollPane = new JScrollPane(this.table);
        this.getContentPane().add(scrollPane);
        this.pack();
        this.setVisible(true);
    }


    private class AddRowJob implements Runnable{
        String name, id, staMac, apMac;
        public AddRowJob(String name, String id, String staMac, String apMac) {
            this.name = name;
            this.id = id;
            this.staMac = staMac;
            this.apMac = apMac;
        }
        @Override
        public void run() {
            //logger.info("Adding node " + id + " as "  + name);
            tableModel.addRow(new String[]{name, id, staMac, apMac});
        }
    }
    private class ClearTableJob implements Runnable{

        @Override
        public void run() {
            tableModel.setRowCount(0);
        }
    }
    private void addNodeAs(NetworkNode node, String s){
        //logger.info("Invoke Later: " + node.getId() + " as "  + s);
        //logger.info(node.printNeighbors());
        SwingUtilities.invokeLater(new AddRowJob(s, node.getId(), node.getStaMac(), node.getApMac()));
    }
    public void update(HashMap<String, NetworkNode> nodesById){
        logger.info("Update Table");
        logger.info("Removed old content");
        SwingUtilities.invokeLater(new ClearTableJob());

        for (NetworkNode node : nodesById.values()) {

            // Add Node itself
            logger.info("Add Node");
            addNodeAs(node, "Node");
            // Add Uplink Node
            logger.info("Add Uplink Node");
            addNodeAs(node.getUplinkNode(), "  Uplink");
            //Add Children
            logger.info("Add STA Nodes");
            int staNo = 1;
            for (NetworkNode station : node.getStaNodes()) {
                addNodeAs(station, "    Station #" + staNo++);
            }
        }
        logger.info("lines added");

    }
}
