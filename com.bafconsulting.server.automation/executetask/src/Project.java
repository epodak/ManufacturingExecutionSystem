import java.io.IOException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.Execute;
import org.apache.tools.ant.types.Commandline;

public class Project extends Task 
{
    public void execute() 
    {
        Commandline commandline = new Commandline();
        commandline.setExecutable("C:\\Program Files\\Windows NT\\Accessories\\wordpad.exe");
        commandline.createArgument().setValue("C:\\ant\\ch11\\executetask\\build.xml");

        Execute runner = new Execute();
        runner.setCommandline(commandline.getCommandline());

        try {
            runner.execute();
        }
        catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
}

