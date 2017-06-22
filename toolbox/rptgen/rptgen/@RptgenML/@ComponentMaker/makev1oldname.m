function makev1oldname(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(h.v1ClassName)
        return;
        % 9 10
    end % if
    % 11 12
    fid = h.openFile('v1oldname.m');
    % 13 14
    fwrite(fid, sprintf('function n=v1oldname(h)\n%%V10LDNAME returns the name of the component in v1.x\n%%   STATIC\n'));
    % 15 16
    h.writeHeader(fid);
    % 17 18
    fwrite(fid, sprintf('n=''%s'';', h.v1ClassName));
    fclose(fid);
    % 20 21
    h.viewFile('v1oldname.m');
end % function
