import org.apache.tools.ant.Task;
import org.apache.tools.ant.BuildException;

public class Project extends Task 
{
    private String language;

    public void execute() throws BuildException 
    {
        System.out.println("The language is " + language);
    }

    public void setLanguage(String language) 
    {
        this.language = language;
    }
}