function [retStat, pmSchema] = getPmSchema(hThis, pmSchema)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    pmSchema = struct([]);
    pmSchema(1.0).Name = 'PMDialogs.PMDlgBuilder';
    pmSchema(1.0).Version = '1.0.0';
    retStat = true;
    % 20 22
    % 21 22
    [retStat, myItems] = hThis.getPmSchemaFromChildren();
    pmSchema(1.0).Items = myItems;
end % function
