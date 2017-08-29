import org.apache.tools.ant.Task;

public class Project extends Task 
{
    public void execute() 
    {
        String name = getProject().getProperty("ant.project.name");

        System.out.println("Welcome to project " + name 
            + " at " + getLocation());
    }
}