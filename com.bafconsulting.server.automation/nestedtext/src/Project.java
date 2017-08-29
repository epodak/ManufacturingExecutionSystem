import org.apache.tools.ant.Task;

public class Project extends Task 
{
    String text;

    public void addText(String text) 
    {
        this.text = text;
    }

    public void execute() 
    {
        System.out.println(text);
    }
}