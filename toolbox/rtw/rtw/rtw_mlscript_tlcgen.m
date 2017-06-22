function rtw_mlscript_tlcgen(block, tlcFileName)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    fid = fopen(tlcFileName, 'w');
    % 14 15
    bname = horzcat(get_param(block, 'parent'), '/', get_param(block, 'name'));
    strrep(bname, sprintf('\n'), ' ');
    % 17 18
    fprintf(fid, horzcat('%%%% TLC-file for MATLAB Scripting block:\n%%%% ', bname, '\n'));
    % 19 20
    seps = findstr(tlcFileName, filesep);
    if isempty(seps)
        seps(1.0) = 0.0;
    end % if
    implementsName = tlcFileName(plus(seps(end), 1.0):end);
    dot = findstr(implementsName, '.');
    implementsName(dot:end) = [];
    % 27 28
    fprintf(fid, horzcat('\n%%implements "', implementsName, '" "C"\n'));
    % 29 30
    CreateTLCFunction('OutputScript', block, fid);
    % 31 32
    fclose(fid);
end % function
function CreateTLCFunction(scriptFcnName, block, fid)
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    script = get_param(block, scriptFcnName);
    % 41 42
    tfile = CreateTmpFile(script);
    % 43 44
    m2tlc(tfile, scriptFcnName);
    % 45 46
    tfid = fopen(tfile, 'r');
    fwrite(fid, fread(tfid));
    fclose(tfid);
    % 49 50
    rtw_delete_file(tfile);
end % function
function tfile = CreateTmpFile(script)
    % 53 57
    % 54 57
    % 55 57
    % 56 57
    tfile = tempname;
    seps = findstr(tfile, filesep);
    tfile = horzcat(tfile(1.0:seps(end)), 'rtw_', tfile(plus(seps(end), 1.0):end));
        while exist(tfile)
        tfile = tempname;
        seps = findstr(tfile, filesep);
        tfile = horzcat(tfile(1.0:seps(end)), 'rtw_', tfile(plus(seps(end), 1.0):end));
    end % while
    % 65 66
    tfid = fopen(tfile, 'w');
    fwrite(tfid, script);
    fclose(tfid);
end % function
function m2tlc(tfile, scriptFcnName)
    % 71 75
    % 72 75
    % 73 75
    % 74 75
    perlProgram = fullfile(matlabroot, 'toolbox', 'rtw', 'rtw', 'rtw_mlscript_tlcgen.pl');
    % 76 77
    cmd = horzcat('perl ', perlProgram, ' ', tfile, ' ', scriptFcnName);
    [s, m] = unix(cmd);
    if not(isempty(m))
        disp(cmd);
        disp(m);
    end % if
end % function
