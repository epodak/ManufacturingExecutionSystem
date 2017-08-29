import java.io.File;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.MatchingTask;

public class Project extends MatchingTask 
{
    private File directory;
    
    public void setDir (File directory) 
    {
        this.directory = directory;
    }
    
    public void execute() throws BuildException 
    {
        DirectoryScanner directoryscanner = getDirectoryScanner(directory);
        String[] files = directoryscanner.getIncludedFiles();

        for (int loopIndex = 0; loopIndex < files.length; loopIndex++) {
            System.out.println(files[loopIndex]);
        }
        //dir = null;
    }
}
