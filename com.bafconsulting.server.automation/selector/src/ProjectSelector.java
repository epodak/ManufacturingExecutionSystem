import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.selectors.BaseExtendSelector;

public class ProjectSelector extends BaseExtendSelector 
{
    public boolean isSelected(File basedir, String filename, File file) throws BuildException 
    {
        if(file.length() < 1024 * 1024){
            return true;
        }
        else {
            return false; 
        }
    }
}
