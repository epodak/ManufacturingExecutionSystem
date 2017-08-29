import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.DefaultLogger;
import org.apache.tools.ant.util.StringUtils;

public class ProjectLogger extends DefaultLogger
{
    public void taskStarted(BuildEvent event)
    {
        String text = "Running task " + event.getTask().getTaskName() + StringUtils.LINE_SEP; 
        printMessage(text, out, event.getPriority());
        log(text);
    }
}
