function [product, errorStruct] = pmsl_getblockproduct(obj)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    error(nargchk(1.0, 1.0, nargin, 'struct'));
    % 22 23
    product = '';
    [entry, errorStruct] = pmsl_getblocklibraryentry(obj);
    % 25 26
    if not(isempty(entry))
        product = entry.Product;
    end % if
    % 29 30
end % function
