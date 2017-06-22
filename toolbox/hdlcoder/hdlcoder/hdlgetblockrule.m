function rules = hdlgetblockrule(blocklist)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    rules = {};
    for n=1.0:length(blocklist)
        sblk = blocklist{n};
        mloc = strmatch('Rule', sblk(1.0:2.0:end), 'exact');
        if not(isempty(mloc)) && not(isempty(sblk(mtimes(2.0, mloc))))
            rules{plus(end, 1.0)} = sblk{mtimes(2.0, mloc)};
        else
            rules{plus(end, 1.0)} = [];
        end % if
    end % for
end % function
