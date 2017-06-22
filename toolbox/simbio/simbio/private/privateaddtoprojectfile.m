function privateaddtoprojectfile(filename, projOutputStream)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    import java.io.*;
    import java.util.zip.*;
    import com.mathworks.mlwidgets.io.InterruptibleStreamCopier;
    % 14 17
    % 15 17
    interruptibleStreamCopier = com.mathworks.mlwidgets.io.InterruptibleStreamCopier.getInterruptibleStreamCopier;
    % 17 21
    % 18 21
    % 19 21
    fileInputStream = java.io.FileInputStream(filename);
    [dirname, filebase, ext] = fileparts(filename);
    % 22 25
    % 23 25
    entry = horzcat(filebase, ext);
    % 25 28
    % 26 28
    zipEntry = java.util.zip.ZipEntry(entry);
    % 28 31
    % 29 31
    projOutputStream.putNextEntry(zipEntry);
    interruptibleStreamCopier.copyStream(fileInputStream, projOutputStream);
    % 32 35
    % 33 35
    fileInputStream.close;
    projOutputStream.closeEntry;
    % 36 38
    return;
