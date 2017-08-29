import java.util.Vector;
import java.util.Iterator;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.BuildException;

public class Project extends Task 
{
    public void execute() 
    {
        for (Iterator iterator = nesteds.iterator(); iterator.hasNext();){
            Nested element = (Nested)iterator.next();
            System.out.println("The language is " + element.getLanguage());
        }
    }

    Vector nesteds = new Vector();

    public Nested createNested() 
    {
        Nested nested = new Nested();
        nesteds.add(nested);
        return nested;
    }

    public class Nested
    {
        public Nested() {}

        String language;

        public void setLanguage(String language) 
        {
            this.language= language;
        }

        public String getLanguage() 
        {
            return language;
        }
    }
}
