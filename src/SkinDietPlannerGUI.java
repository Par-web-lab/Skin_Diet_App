import javax.swing.*;
import java.awt.*;
import java.util.*;
import java.util.List;
import javax.swing.Timer;

public class SkinDietPlannerGUI extends JFrame {

    private JList<SkinProblem> problemList;
    private JButton generateButton;
    private JPanel outputPanel;
    private JScrollPane outputScrollPane;

    private SkinProblemDAO problemDAO = new SkinProblemDAO();
    private DietItemDAO dietItemDAO = new DietItemDAO();
    private DietPlanner dietPlanner = new DietPlanner();

    private Timer flashTimer;
    private boolean flashOn = false;

    public SkinDietPlannerGUI() {
        setTitle("🌿 Skin Diet Plan Generator");
        setSize(1000, 700);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        initComponents();
        layoutComponents();
        setupFlashTimer();
        attachListeners();
    }

    private void initComponents() {
        List<SkinProblem> problems = problemDAO.getAllSkinProblems();

        problemList = new JList<>(new Vector<>(problems));
        problemList.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
        problemList.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        problemList.setFixedCellHeight(24);
        problemList.setBackground(new Color(230, 240, 255));
        problemList.setCellRenderer(new DefaultListCellRenderer() {
            @Override
            public Component getListCellRendererComponent(JList<?> list, Object value, int index,
                                                          boolean isSelected, boolean cellHasFocus) {
                Component c = super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
                if (isSelected) {
                    c.setBackground(new Color(173, 216, 230));
                    c.setForeground(Color.BLACK);
                }
                return c;
            }
        });

        generateButton = new JButton("Generate 7-Day Plan");
        generateButton.setBackground(new Color(70, 130, 180));
        generateButton.setForeground(Color.WHITE);
        generateButton.setFocusPainted(false);
        generateButton.setFont(new Font("Segoe UI", Font.BOLD, 16));
        generateButton.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(25, 25, 112), 2),
                BorderFactory.createEmptyBorder(5, 15, 5, 15)
        ));

        outputPanel = new JPanel();
        outputPanel.setLayout(new GridLayout(0, 2, 15, 15)); // 2 columns
        outputPanel.setBackground(new Color(240, 250, 255));

        outputScrollPane = new JScrollPane(outputPanel);
        outputScrollPane.setBorder(BorderFactory.createTitledBorder(
                BorderFactory.createLineBorder(new Color(70, 130, 180), 2),
                "7-Day Personalized Diet Plan",
                javax.swing.border.TitledBorder.LEFT,
                javax.swing.border.TitledBorder.TOP,
                new Font("Segoe UI", Font.BOLD, 16),
                new Color(70, 130, 180)
        ));
    }

    private void layoutComponents() {
        JPanel mainPanel = new GradientPanel();
        mainPanel.setLayout(new BorderLayout(10, 10));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Header
        JPanel bannerPanel = new JPanel(new BorderLayout());
        bannerPanel.setBackground(new Color(70, 130, 180));
        JLabel titleLabel = new JLabel("🌿 Skin Diet Planner");
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 24));
        titleLabel.setForeground(Color.WHITE);
        titleLabel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        bannerPanel.add(titleLabel, BorderLayout.CENTER);

        // Selection + Button panel
        JPanel topPanel = new JPanel(new BorderLayout(10, 10));
        topPanel.setOpaque(false);

        JLabel label = new JLabel("Select Skin Problem(s):");
        label.setFont(new Font("Segoe UI", Font.BOLD, 16));
        label.setBorder(BorderFactory.createEmptyBorder(10, 10, 5, 10));

        JScrollPane listScrollPane = new JScrollPane(problemList);
        listScrollPane.setPreferredSize(new Dimension(300, 250));
        listScrollPane.setBorder(BorderFactory.createLineBorder(new Color(70, 130, 180), 2));

        topPanel.add(label, BorderLayout.NORTH);
        topPanel.add(listScrollPane, BorderLayout.CENTER);
        topPanel.add(generateButton, BorderLayout.SOUTH);

        mainPanel.add(bannerPanel, BorderLayout.NORTH);
        mainPanel.add(topPanel, BorderLayout.WEST);
        mainPanel.add(outputScrollPane, BorderLayout.CENTER);

        setContentPane(mainPanel);
    }

    private void setupFlashTimer() {
        flashTimer = new Timer(500, e -> {
            if (flashOn) {
                generateButton.setBackground(new Color(70, 130, 180));
            } else {
                generateButton.setBackground(new Color(255, 69, 0));
            }
            flashOn = !flashOn;
        });
        flashTimer.setRepeats(true);
    }

    private void attachListeners() {
        generateButton.addActionListener(e -> {
            flashTimer.start();
            generateButton.setEnabled(false);

            SwingUtilities.invokeLater(() -> {
                generatePlan();
                flashTimer.stop();
                generateButton.setBackground(new Color(70, 130, 180));
                generateButton.setEnabled(true);
            });
        });
    }

    private void generatePlan() {
        outputPanel.removeAll();

        List<SkinProblem> selectedProblems = problemList.getSelectedValuesList();
        if (selectedProblems.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please select at least one skin problem.", "No Selection", JOptionPane.WARNING_MESSAGE);
            outputPanel.revalidate();
            outputPanel.repaint();
            return;
        }

        List<Integer> problemIds = new ArrayList<>();
        for (SkinProblem sp : selectedProblems) {
            problemIds.add(sp.getId());
        }

        List<DietItem> dietItems = dietItemDAO.getDietItemsForProblems(problemIds);
        if (dietItems.isEmpty()) {
            outputPanel.add(createDayBox("No diet items found.", Collections.emptyList()));
        } else {
            Map<String, List<DietItem>> plan = dietPlanner.generate7DayPlan(dietItems, 5, 1);
            for (Map.Entry<String, List<DietItem>> entry : plan.entrySet()) {
                JPanel dayBox = createDayBox(entry.getKey(), entry.getValue());
                outputPanel.add(dayBox);
            }
        }

        outputPanel.revalidate();
        outputPanel.repaint();
    }

    private JPanel createDayBox(String day, List<DietItem> items) {
        JPanel box = new JPanel();
        box.setLayout(new BorderLayout());
        box.setPreferredSize(new Dimension(200, 200));
        box.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(70, 130, 180), 2),
                BorderFactory.createEmptyBorder(10, 10, 10, 10)
        ));
        box.setBackground(Color.WHITE);

        JLabel dayLabel = new JLabel(day);
        dayLabel.setFont(new Font("Segoe UI", Font.BOLD, 16));
        dayLabel.setForeground(new Color(25, 25, 112));

        JTextArea itemArea = new JTextArea();
        itemArea.setEditable(false);
        itemArea.setFont(new Font("Consolas", Font.PLAIN, 13));
        itemArea.setBackground(Color.WHITE);
        itemArea.setForeground(Color.DARK_GRAY);

        StringBuilder sb = new StringBuilder();
        for (DietItem item : items) {
            sb.append("- ").append(item.getItemName()).append(" (").append(item.getType()).append(")\n");
        }
        itemArea.setText(sb.toString());

        box.add(dayLabel, BorderLayout.NORTH);
        box.add(new JScrollPane(itemArea), BorderLayout.CENTER);

        return box;
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new SkinDietPlannerGUI().setVisible(true);
        });
    }

    // Gradient background panel
    static class GradientPanel extends JPanel {
        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2d = (Graphics2D) g;
            GradientPaint gp = new GradientPaint(
                    0, 0, new Color(230, 240, 255),
                    getWidth(), getHeight(), new Color(200, 220, 255)
            );
            g2d.setPaint(gp);
            g2d.fillRect(0, 0, getWidth(), getHeight());
        }
    }
}
