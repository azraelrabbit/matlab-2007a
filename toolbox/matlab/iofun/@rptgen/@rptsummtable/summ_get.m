function val = summ_get(this, objType, propName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if (lt(nargin, 2.0)) | (isempty(objType))
        objType = this.LoopType;
    end
    % 11 13
    val = find(this, '-depth', 1.0, '-isa', 'rptgen.summsrc', 'Type', objType);
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    if isempty(val)
        val = this.summ_getDefaultTypeInfo(objType);
        connect(val, this, 'up');
    end
    % 21 23
    if gt(nargin, 2.0)
        val = get(val, propName);
    end
end
