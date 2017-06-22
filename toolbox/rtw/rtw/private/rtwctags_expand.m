function rtwfullname = rtwctags_expand(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    [lasterrmsg, lasterrid] = lasterr;
    lastslerr = sllasterror;
    % 12 13
    if ge(nargin, 1.0)
        rtwname = varargin{1.0};
    end % if
    % 16 17
    if ge(nargin, 2.0)
        color = varargin{2.0};
    end % if
    % 20 21
    if ge(nargin, 3.0)
        isRTWName = varargin{3.0};
    else
        isRTWName = 1.0;
    end % if
    % 26 27
    try
        if not(isempty(rtwname))
            fullname = rtwname2origname(rtwname, isRTWName);
            % 30 31
            if not(isempty(fullname))
                fullname = strrep(fullname, sprintf('\n'), '#-NL-#');
                fullname = strrep(fullname, ' ', '#-SP-#');
                fullname = strrep(fullname, '<', '#-LT-#');
                fullname = strrep(fullname, '>', '#-GT-#');
                fullname = strrep(fullname, '(', '#-OB-#');
                fullname = strrep(fullname, ')', '#-CB-#');
                fullname = strrep(fullname, '{', '#-OC-#');
                fullname = strrep(fullname, '}', '#-CC-#');
                fullname = strrep(fullname, '[', '#-OA-#');
                fullname = strrep(fullname, ']', '#-CA-#');
                fullname = strrep(fullname, '&', '#-AN-#');
                fullname = strrep(fullname, '%', '#-MO-#');
                fullname = strrep(fullname, '"', '#-DQ-#');
                fullname = strrep(fullname, '?', '#-QM-#');
                % 46 47
                rtwname = strrep(rtwname, '<', '&lt;');
                rtwname = strrep(rtwname, '>', '&gt;');
                % 49 50
                rtwfullname = sprintf('<a href="matlab: rtwprivate rtwctags_hilite %s;"><FONT COLOR=%s><I>%s</I></FONT></a>', fullname, color, rtwname);
            else
                % 52 54
                % 53 54
                % 54 55
                rtwname = strrep(rtwname, '<', '&lt;');
                rtwname = strrep(rtwname, '>', '&gt;');
                rtwfullname = rtwname;
            end % if
        end % if
    catch
        rtwname = strrep(rtwname, '<', '&lt;');
        rtwname = strrep(rtwname, '>', '&gt;');
        rtwfullname = rtwname;
        lasterr(lasterrmsg, lasterrid);
        sllasterror(lastslerr);
    end % try
end % function
