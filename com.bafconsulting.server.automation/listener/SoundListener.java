import java.io.File;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.BuildListener;
import org.apache.tools.ant.taskdefs.optional.sound.AntSoundPlayer;

public class SoundListener implements BuildListener
{
    AntSoundPlayer soundplayer = new AntSoundPlayer();

    public SoundListener()
    {
        soundplayer.addBuildSuccessfulSound(new File("file1.wav"), 1, new Long(500));

        soundplayer.addBuildFailedSound(new File("file2.wav"), 1, new Long(500));
    }

    public void buildStarted(BuildEvent event) {}

    public void buildFinished(BuildEvent event) 
    {
        soundplayer.buildFinished(event);
    }

    public void targetStarted(BuildEvent event) {}

    public void targetFinished(BuildEvent event) {}

    public void taskStarted(BuildEvent event) {}

    public void taskFinished(BuildEvent event) {}
    
    public void messageLogged(BuildEvent event) {}
}
