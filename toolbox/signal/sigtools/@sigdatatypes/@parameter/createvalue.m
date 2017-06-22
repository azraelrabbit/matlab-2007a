function createvalue(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    valid = get(this, 'ValidValues');
    % 8 10
    if iscell(valid)
        createvaluefromcell(this);
    else
        if isa(valid, 'function_handle')
            createValueFromFcn(this);
        else
            if isnumeric(valid)
                createValueFromVector(this);
            else
                if ischar(valid)
                    createValueFromType(this);
                end
            end
        end
    end
end
function createValueFromType(this)
    schema.prop(this, 'Value', this.ValidValues);
end
function createValueFromFcn(this)
    valid = get(this, 'ValidValues');
    typename = getuniquetype(this, valid);
    schema.prop(this, 'Value', typename);
end
function createValueFromVector(this)
    % 34 37
    % 35 37
    vv = this.ValidValues;
    % 37 39
    if ne(length(vv), 2.0) && ne(length(vv), 3.0)
        error('''ValidValues'' must be a vector of length 2 or 3.');
    end
    % 41 43
    if lt(vv(end), vv(1.0))
        error('''ValidValues'' last input argument must be greater than its first.');
    end
    % 45 47
    schema.prop(this, 'Value', 'double');
end
