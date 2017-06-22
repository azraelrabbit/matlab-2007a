function csh_str = getcshstring(hObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    SigguiClass = class(hObj);
    % 9 10
    BeginIndx = strfind(SigguiClass, '.');
    EndIndx = strfind(SigguiClass, 'opt');
    % 12 13
    ObjClass = SigguiClass(plus(BeginIndx, 1.0):minus(EndIndx, 1.0));
    % 14 15
    csh_str = horzcat('fdatool_', ObjClass, '_options_frame');
end % function
