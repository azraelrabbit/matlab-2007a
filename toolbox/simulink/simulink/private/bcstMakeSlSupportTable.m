function bcstMakeSlSupportTable(model, do_unknown)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    allCaps = bcstExtractBlockCaps(model);
    % 8 9
    if isempty(allCaps)
        disp(DAStudio.message('Simulink:bcst:NoDataFound', regexprep(model, '\s', ' ')));
        return;
    end % if
    % 13 14
    if ge(nargin, 2.0) && do_unknown
        show_unknown = true;
    else
        show_unknown = false;
    end % if
    % 19 20
    h = bcstMakeHtmlTable(model, allCaps, show_unknown);
    % 21 22
    if true
        hfile = horzcat('text://', h);
    else
        hfile = horzcat(tempname, '.html');
        % 26 27
        fout = fopen(hfile, 'w');
        fwrite(fout, h, 'char');
        fclose(fout);
    end % if
    % 31 32
    status = web(hfile);
    % 33 34
    switch status
    case 1.0
        errordlg(DAStudio.message('Simulink:bcst:ErrNoBrowser'));
    case 2.0
        errordlg(DAStudio.message('Simulink:bcst:ErrNoBrowserLaunch'));
    otherwise
        % 40 41
    end % switch
end % function
