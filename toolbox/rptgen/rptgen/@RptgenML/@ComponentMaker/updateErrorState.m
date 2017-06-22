function updateErrorState(this, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    propNames = {'PkgName';'ClassName'};
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    errMsg = '';
    for i=1.0:length(propNames)
        val = getVal(this, propNames{i}, varargin);
        % 18 19
        if isempty(val)
            p = findprop(this, propNames{i});
            errMsg = sprintf('%s%s must not be empty\n', errMsg, p.Description);
        end % if
    end % for
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    this.ErrorMessage = errMsg;
end % function
function val = getVal(this, propName, args)
    % 32 34
    % 33 34
    propIdx = find(strcmpi(args, propName));
    if isempty(propIdx)
        val = get(this, propName);
    else
        val = args{plus(propIdx(1.0), 1.0)};
    end % if
end % function
