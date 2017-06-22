function errMsg = rtw_expand_template_from_tlc(name, modelName)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    cgt = which(name);
    % 16 17
    if not(isempty(cgt))
        [dirstr, fname, ext] = fileparts(cgt);
        try
            h = get_param(modelName, 'MakeRTWSettingsObject');
            if isempty(h)
                error(horzcat('Unable to load object handle for the makertw class for model: ''', modelName, ''''));
                % 23 24
            end % if
            % 25 26
            if isequal(ext, '.cgt')
                tlcName = rtw_cgt_name_conv(horzcat(fname, ext), 'cgt2tlc');
                outfile = fullfile(h.BuildDirectory, h.GeneratedTLCSubDir, tlcName);
                rtw_expand_template(cgt, outfile);
            else
                outfile = fullfile(h.BuildDirectory, h.GeneratedTLCSubDir, horzcat(fname, ext));
                rtw_copy_file(cgt, outfile);
            end % if
            errMsg = 'success';
        catch
            errMsg = lasterr;
        end % try
    else
        errMsg = 'file not found';
    end % if
end % function
