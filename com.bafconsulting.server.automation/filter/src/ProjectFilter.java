import java.io.Reader;
import java.io.IOException;
import org.apache.tools.ant.filters.ChainableReader;
import org.apache.tools.ant.filters.BaseParamFilterReader;

public final class ProjectFilter extends BaseParamFilterReader implements ChainableReader
{
    String data = null;

    public ProjectFilter()
    {
        super();
    }
    
    public ProjectFilter(final Reader reader)
    {
        super(reader);
    }

    public final Reader chain(final Reader reader)
    {
        ProjectFilter filter = new ProjectFilter(reader);
        filter.setInitialized(true);
        return filter;
    }

    public final int read() throws IOException
    {
        int leadChar = -1;

        if(data != null)
        {
            leadChar = data.charAt(0);
            data = data.substring(1);
            if(data.length() == 0)
            {
                data = null;
            }
        }
        else {
            data = readLine();

            if(data == null)
            {
                leadChar = -1;
            }
            else {
                data = "// " + data;
                return read();
            }
        }
        return leadChar;
    }
}
