import data.ProjectType;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.BuildException;

public class ProjectTask extends Task
{
    ProjectType multiFile = null;

    public void execute() throws BuildException
    {
        String[] files = multiFile.getFiles(getProject());

        for(int loopIndex = 0; loopIndex < files.length; loopIndex++)
        {
            System.out.println(files[loopIndex]);
        }
    }

    public ProjectType createMultiFile()
    {
        multiFile = new ProjectType();
        return multiFile;
    }
}
