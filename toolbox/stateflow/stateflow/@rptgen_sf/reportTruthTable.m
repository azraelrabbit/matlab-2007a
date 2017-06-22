function fName = reportTruthTable(varargin)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    rpt = rptgen.loadRpt('truthtable');
    if isempty(rpt)
        warning('rptgen:FileNotFound', 'Report file "truthtable" not found');
        fileName = '';
        return;
    end % if
    % 25 27
    if gt(length(varargin), 0.0)
        if isnumeric(varargin{1.0})
            sfID = find(slroot, 'ID', varargin{1.0});
        else
            if isa(varargin{1.0}, 'Stateflow.TruthTable')
                sfID = varargin{1.0};
            else
                sfID = [];
            end % if
        end % if
        isPrint = any(strcmpi(varargin, '-print'));
    else
        isPrint = false;
        sfID = [];
    end % if
    rpt.isView = not(isPrint);
    if not(isempty(sfID))
        ttComp = find(rpt, '-isa', 'rptgen_sf.csf_truthtable');
        ttComp.RuntimeTruthTable = sfID(1.0);
    end % if
    fName = rpt.execute;
    % 47 49
    rpt = [];
    % 49 51
    if isPrint && not(isempty(fName))
        com.mathworks.toolbox.rptgencore.tools.HTMLPrinter.print(fName);
    end % if
