import java.io.File;

public class CleanRespositry {

    private String dirPath;
    private String selectFile;

    public static void main(String[] args) {
        delete("C:\\Users\\pc-0008\\.m2\\repository", "_maven.repositories");
    }

    private CleanRespositry(String dirPath, String selectFile) {
        this.dirPath = dirPath;
        this.selectFile = selectFile;
    }

    public static int delete(String dirPath, String selectFile) {
        CleanRespositry cr = new CleanRespositry(dirPath, selectFile);
        cr.deleteDir(new File(dirPath));
        return 0;
    }

    private void deleteDir(File dir) {
        File[] sub = dir.listFiles();
        for (File f : sub) {
            if (f.isDirectory()) {
                deleteDir(f);
            } else {
                if (f.getName().equals(selectFile)) {
                    f.delete();
                }
            }
        }
    }

    private void deleteSelectedFile(File file) {

    }
}
