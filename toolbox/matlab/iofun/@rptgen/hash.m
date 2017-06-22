function h = hash(str)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if isempty(str)
        h = '';
        return;
    end % if
    % 11 13
    if not(ischar(str))
        error('rptgen:hash', '%s', 'Input must be a character or a string');
    end % if
    % 15 18
    % 16 18
    str = uint8(str(:));
    % 18 21
    % 19 21
    mdobj = java.security.MessageDigest.getInstance('MD5');
    mdobj.update(str);
    % 22 25
    % 23 25
    h = typecast(mdobj.digest, 'uint8');
    % 25 28
    % 26 28
    h = ctranspose(dec2hex(h));
    h = lower(ctranspose(h(:)));
