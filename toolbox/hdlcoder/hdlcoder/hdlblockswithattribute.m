function attributeblocks = hdlblockswithattribute(attribute)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    blist = hdlsupportedblocks;
    % 9 10
    attributeblocks = {};
    for n=1.0:length(blist)
        block = blist{n};
        mloc = strmatch('Attributes', block(1.0:2.0:end), 'exact');
        % 14 15
        if not(isempty(mloc)) && not(isempty(block(mtimes(2.0, mloc)))) && not(isempty(strfind(lower(block{mtimes(2.0, mloc)}), lower(attribute))))
            % 16 18
            % 17 18
            attributeblocks{plus(end, 1.0)} = block;
        end % if
    end % for
end % function
