function [retStatus, pmSchema] = getPmSchema(hThis, pmSchema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    mySchema = struct([]);
    mySchema(1.0).ClassName = 'MECH.PmMechBranchBarPanel';
    mySchema(1.0).Version = '1.0.0';
    mySchema(1.0).Parameters.PortSpinnerLabel = hThis.PortSpinnerLabel;
    retStatus = true;
    % 22 24
    % 23 24
    [retStat, myItems] = hThis.getPmSchemaFromChildren();
    mySchema(1.0).Items = myItems;
    pmSchema = mySchema(1.0);
end % function
