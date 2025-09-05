package iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model;

public class Qualification {
    private String examination;
    private String board;
    private double percentage;
    private int yearOfPassing;

    // Constructors
    public Qualification() {}

    public Qualification(String examination, String board, double percentage, int yearOfPassing) {
        this.examination = examination;
        this.board = board;
        this.percentage = percentage;
        this.yearOfPassing = yearOfPassing;
    }

    // Getters and setters
    public String getExamination() {
        return examination;
    }

    public void setExamination(String examination) {
        this.examination = examination;
    }

    public String getBoard() {
        return board;
    }

    public void setBoard(String board) {
        this.board = board;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }

    public int getYearOfPassing() {
        return yearOfPassing;
    }

    public void setYearOfPassing(int yearOfPassing) {
        this.yearOfPassing = yearOfPassing;
    }
}

