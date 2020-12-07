

import java.util.Date;

class Search {
  File[] dirs; 
  Search() {
    this.dirs = new File[5]; 

    String path = sketchPath();

    println("Listing all filenames in a directory: ");
    String[] filenames = listFileNames(path);
    printArray(filenames);

    println("\nListing info about all files in a directory: ");
    File[] files = listFiles(path);

    for (int i = 0; i < files.length; i++) {
      File f = files[i];
      if (f.isDirectory()) {
        this.dirs[0] = f; 
        println("Name: " + f.getName());

        println("-----------------------");
      }
    }

    println("\nListing info about all files in a directory and all subdirectories: ");
    ArrayList<File> allFiles = listFilesRecursive(path);
  }


  public File getDataFolder() {
    String infoPath = sketchPath() + "/" + this.dirs[0].getName() + "/" + "index.html"; 
    println("Buscando...");
    println("En: " + infoPath);
    File file = new File(infoPath); 
    return file;
  }

  // This function returns all the files in a directory as an array of Strings  
  public String[] listFileNames(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      String names[] = file.list();
      return names;
    } else {
      // If it's not a directory
      return null;
    }
  }


  
  public File[] listFiles(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      File[] files = file.listFiles();
      return files;
    } else {
      // If it's not a directory
      return null;
    }
  }

  // Function to get a list of all files in a directory and all subdirectories
  public  ArrayList<File> listFilesRecursive(String dir) {
    ArrayList<File> fileList = new ArrayList<File>(); 
    recurseDir(fileList, dir);
    return fileList;
  }

  // Recursive function to traverse subdirectories
  public void recurseDir(ArrayList<File> a, String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      // If you want to include directories in the list
      a.add(file);  
      File[] subfiles = file.listFiles();
      for (int i = 0; i < subfiles.length; i++) {
        // Call this function on all files in this directory
        recurseDir(a, subfiles[i].getAbsolutePath());
      }
    } else {
      a.add(file);
    }
  }
}
