function out = mlint(obj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    td = pwd;
    cd(tempdir);
    fname = horzcat(tempname, '.m');
    fh = fopen(fname, 'w');
    fprintf(fh, '%s', obj.compiledTemplate);
    fclose(fh);
    out = mlint(fname, '-string');
    out = sprintf('%s\n\nexecute\nedit %s\nto view processed template', out, fname);
    cd(td);
end % function
