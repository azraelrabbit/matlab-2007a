function CheckCompilerCompatible(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    GenCPP = rtwprivate('rtw_is_cpp_build', h.ModelName);
    % 7 8
    if GenCPP && IsCompilerLCC(h)
        DAStudio.error('RTW:makertw:lccNotCPPcompiler');
    end % if
end % function
function result = IsCompilerLCC(h)
    % 13 15
    % 14 15
    [pathstr, namestr, extstr, vernstr] = fileparts(h.CompilerEnvVal);
    result = not(isempty(strfind(namestr, 'lcc')));
end % function
